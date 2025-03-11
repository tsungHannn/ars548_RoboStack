import json
import math
from dataclasses import dataclass
from collections import defaultdict

import rospy
from std_msgs.msg import Float32MultiArray
from sensor_msgs.msg import Image, PointCloud2
from cv_bridge import CvBridge
from ros_numpy import numpify

import cv2
import torch
import numpy as np
from ultralytics import YOLO

from utils import json_to_object


def project_points(points_3d, camera_matrix, extrinsic_matrix):
    points_3d = np.asarray(points_3d)
    points_3d = np.hstack([points_3d, np.ones((points_3d.shape[0], 1))])
    points_3d = (extrinsic_matrix @ points_3d.T)[:3, :]
    points_2d = camera_matrix @ points_3d
    points_2d[:2, :] /= points_2d[2, :]
    points_2d = points_2d[:2, :].T
    return points_2d

@dataclass
class State:
    camera: Image = None
    radar: PointCloud2 = None
    track_history = defaultdict(lambda: [])
    last_stamp: rospy.Time = None

@dataclass
class Detection:
    id: int
    box: np.ndarray
    speed: float
    dist: float
    # class_id: int
    p3: np.ndarray # original 3d radar point
    p2: np.ndarray # projected 2d radar point

@dataclass
class TrafficStats:
    flow: int = 0
    mean_speed: float = 0

class TrafficMonitor():
    def __init__(self, config_path='config.json'):
        rospy.init_node('traffic_monitor')
        self.setup_parameters(config_path)
        self.setup_topics()
    
    def setup_parameters(self, config_path):
        with open(config_path, 'r') as f:
            config_data = json.load(f)
        self.config = json_to_object(config_data)

        rospy.loginfo(self.config)

        self.cv_bridge = CvBridge()
        self.data = State()
        # cv2.namedWindow('traffic_monitor', cv2.WINDOW_NORMAL)

        self.extrinsic_matrix = self.config.camera.extrinsic_matrix.copy()

        if self.config.model_enabled:
            self.model = YOLO(self.config.model.path)
            if torch.cuda.is_available():
                self.model.to(torch.device('cuda'))
            rospy.loginfo(f'Model loaded on device {self.model.device}')

        if self.config.radar_track_enabled:
            from bytetracker import BYTETracker
            self.radar_tracker = BYTETracker(frame_rate=self.config.fps)
            rospy.loginfo('Radar tracker initialized')
        
        self.setup_traffic_stats()
    

    def setup_topics(self):
        # stream input
        _ = rospy.Subscriber(self.config.camera_topic, Image, self.camera_callback)
        _ = rospy.Subscriber(self.config.radar_topic, PointCloud2, self.radar_callback)
        _ = rospy.Timer(rospy.Duration(1.0 / self.config.fps), self.process_sensor_data)

        self.pub_echo = rospy.Publisher(self.config.echo_topic, Image, queue_size=2)
        self.pub_track = rospy.Publisher(self.config.track_topic, Image, queue_size=2)
        self.pub_radar_project = rospy.Publisher(self.config.radar_project_topic, Image, queue_size=2)
        self.pub_final = rospy.Publisher(self.config.final_topic, Image, queue_size=2)

        # control topics
        self.sub_matrix = rospy.Subscriber('/control/matrix', Float32MultiArray, self.matrix_callback)
    
    def setup_traffic_stats(self):
        """
        Initialize traffic statistics tracking
        """
        # Initialize stats storage
        self.stats_interval = rospy.Duration(self.config.stats_interval_seconds or 15.0)
        self.crossed_objects = set()
        self.reset_traffic_stats()
    
        self.center_y = self.config.camera.height // 2
    
    def reset_traffic_stats(self, current_time=None):
        self.current_stats = TrafficStats()
        self.all_speeds = []
        self.crossed_objects.clear()
        if current_time is None:
            self.stats_start_time = rospy.Time.now()
        else:
            self.stats_start_time = current_time
    
    def matrix_callback(self, msg):
        matrix = np.array(msg.data).reshape((4, 4))
        self.extrinsic_matrix = matrix
    
    def val_callback(self, topic, msg):
        self.data.control.update({topic: msg.data})
        rospy.loginfo(f'{topic}: {msg.data}')
    
    def camera_callback(self, image_msg: Image):
        self.data.camera = image_msg
    
    def radar_callback(self, radar_msg: PointCloud2):
        self.data.radar = radar_msg
    
    def to_image_msg(self, image, stamp=None):
        if stamp is None:
            stamp = rospy.Time.now()
        msg = self.cv_bridge.cv2_to_imgmsg(image)
        msg.header.stamp = stamp
        return msg
    
    def detect_objects(self, image):
        dets = self.model.track(image, show=False, persist=True, tracker='bytetrack.yaml', \
            verbose=False, classes=self.config.model.classes, conf=0.08, imgsz=768, half=True)
        if not len(dets[0].boxes.xywh.cpu()):
            return [], [], image
        boxes = dets[0].boxes.xywh.cpu()
        track_ids = dets[0].boxes.id
        if track_ids is None:
            track_ids = []
        else:
            track_ids = dets[0].boxes.id.int().tolist()
        annotated_frame = dets[0].plot()
        for box, track_id in zip(boxes, track_ids):
            x, y, w, h = box
            track = self.data.track_history[track_id]
            track.append((float(x), float(y)))
            if len(track) > 30:
                track.pop(0)
            points = np.hstack(track).astype(np.int32).reshape((-1, 1, 2))
            cv2.polylines(annotated_frame, [points], isClosed=False, color=(230, 230, 230), thickness=10)
        return boxes, track_ids, annotated_frame

    def radar_to_image(self, radar_msg, frame):
        data = numpify(radar_msg) # (n * 5) [x y z vx vy]
        points = np.stack([data[f] for f in ['x', 'y', 'z', 'vx', 'vy']], axis=1, dtype=np.float32) # (n, 5)
        # fix z to 1
        points[:, 2] = 1
        # v = vx + vy
        v = np.linalg.norm(points[:, 3:5], axis=1)
        # sort points by v
        # points = points[np.logical_and(v > 1.0, points[:, 3] < 0)]
        # points = points[np.logical_and(v > 1.0, points[:, 3] > 0)]
        points = points[(v > 1.0)]

        points_2d = project_points(points[:, :3], self.config.camera.camera_matrix, self.extrinsic_matrix)

        # make radar points boxes and update tracker
        # (n, 2) to (n, 4) (xyxy)

        if self.config.radar_track_enabled:
            boxes = torch.from_numpy(
                np.hstack([points_2d - 300, points_2d + 300, np.ones((points_2d.shape[0], 1)), np.ones((points_2d.shape[0], 1))]) # (x1, y1, x2, y2)
            )
            tracks = self.radar_tracker.update(boxes, frame)
        else:
            tracks = None

        points_2d = points_2d.astype(np.int32)
        radar_frame = frame.copy()
        for x, y in points_2d:
            cv2.circle(radar_frame, (x, y), 20, (255, 0, 0), -1)
        return points, points_2d, tracks, radar_frame
    
    def fusion(self, boxes, ids, points_2d, points_3d):
        mapping = defaultdict(list)
        for box, box_id in zip(boxes, ids):
            x, y, w, h = box
            x, y = int(x - w / 2), int(y - h / 2)
            found = False
            for point, point_2d in zip(points_3d, points_2d):
                if x < point_2d[0] < x + w and y < point_2d[1] < y + h:
                    mapping[box_id].append(Detection(id=box_id, box=box, speed=np.linalg.norm(point[3:5]), dist=np.linalg.norm(point[:2]), p3=point, p2=point_2d))
                    found = True
            if not found:
                mapping[box_id].append(Detection(id=box_id, box=box, speed=0, dist=0, p3=np.zeros(3), p2=np.zeros(2)))
        
        objects = []
        for box_id, detections in mapping.items():
            # average the detections
            avg = np.mean([d.speed for d in detections])
            dist = np.mean([d.dist for d in detections])
            p3 = np.mean([d.p3 for d in detections], axis=0)
            p2 = np.mean([d.p2 for d in detections], axis=0)
            objects.append(Detection(speed=avg, dist=dist, p3=p3, p2=p2, id=box_id, box=detections[0].box))
        
        return objects
    
    def flow_stats(self, objects):
        # calculate traffic flow (count if object cross center line)
        # calculate global mean speed
        if objects:
            for obj in objects:
                if obj.speed > 0:
                    self.all_speeds.append(obj.speed * 3.6)
        
        for obj in objects:
            track = self.data.track_history[obj.id]

            if len(track) >= 2:
                prev_y = track[-2][1]
                curr_y = track[-1][1]

                if obj.id not in self.crossed_objects and \
                    (prev_y < self.center_y <= curr_y or \
                     prev_y > self.center_y >= curr_y):
                    
                    self.crossed_objects.add(obj.id)
                    self.current_stats.flow += 1
        
        current_time = rospy.Time.now()
        if current_time - self.stats_start_time >= self.stats_interval:
            self.current_stats.mean_speed = np.mean(self.all_speeds)
            # stats_result = TrafficStats(flow=self.current_stats.flow, mean_speed=self.current_stats.mean_speed)
            self.reset_traffic_stats(current_time)

    def vis_objects(self, frame, objects):
        for obj in objects:
            x, y, w, h = obj.box.int().tolist()
            x, y = int(x - w / 2), int(y - h / 2)
            cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 255, 0), 4)
            cv2.putText(frame, f'{obj.id}', (x, y), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 4, cv2.LINE_AA)
            cv2.putText(frame, f'{obj.speed*3.6:.2f} m/s', (x, y + 20), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 4, cv2.LINE_AA)
            cv2.putText(frame, f'{obj.dist:.2f} m', (x, y + 40), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 4, cv2.LINE_AA)
            cv2.circle(frame, [int(i) for i in obj.p2], 10, (0, 255, 0), -1)
        
        # extend frame and write current stats in bottom left with black background
        original_height = frame.shape[0]
        frame = cv2.copyMakeBorder(frame, 0, 150, 0, 0, cv2.BORDER_CONSTANT, value=(0, 0, 0))
        cv2.putText(frame, f'Flow: {self.current_stats.flow}, Mean Speed: {np.mean(self.all_speeds):.2f} km/h', (20, original_height + 60), cv2.FONT_HERSHEY_SIMPLEX, 2, (255, 255, 255), 3, cv2.LINE_AA)
        cv2.putText(frame, f'Last Update: {math.ceil(rospy.Time.now().to_sec() - self.stats_start_time.to_sec())} sec', (20, original_height + 120), cv2.FONT_HERSHEY_SIMPLEX, 2, (255, 255, 255), 3, cv2.LINE_AA)
        # rospy.loginfo(f'Flow: {self.current_stats.flow}, Mean Speed: {np.mean(self.all_speeds):.2f} km/h')

        # draw center line
        cv2.line(frame, (0, self.center_y), (frame.shape[1], self.center_y), (0, 0, 255), 2)
        return frame
    
    def time_check(self, stamp):
        if self.data.last_stamp is not None and abs(stamp.to_sec() - self.data.last_stamp.to_sec()) > 1:
            self.reset()
        self.data.last_stamp = stamp
    
    def reset(self):
        if self.config.model_enabled:
            self.model.predictor.trackers[0].reset()
            self.data.track_history.clear()

        if self.config.radar_track_enabled:
            from bytetracker import BYTETracker
            self.radar_tracker = BYTETracker(frame_rate=self.config.fps)

    def process_sensor_data(self, timer):
        rospy.loginfo_once('Processing sensor data')
        time_start = rospy.Time.now()
        if not self.data.camera or not self.data.radar:
            rospy.logwarn('Missing sensor data')
            return
        image_msg, radar_msg = self.data.camera, self.data.radar
        stamp = image_msg.header.stamp
        self.time_check(stamp)

        echo_frame = frame = self.cv_bridge.imgmsg_to_cv2(image_msg)

        # detect and track
        if self.config.model_enabled:
            boxes, ids, track_frame = self.detect_objects(frame)
            if len(boxes):
                self.pub_track.publish(self.to_image_msg(track_frame, stamp))
        
        # process radar
        points_3d, points_2d, radar_tracks, radar_frame = self.radar_to_image(radar_msg, frame)
        self.pub_radar_project.publish(self.to_image_msg(radar_frame, stamp))

        # fuse radar points and bounding boxes
        objects = self.fusion(boxes, ids, points_2d, points_3d)
        self.flow_stats(objects)

        # final result
        final_frame = frame.copy()
        final_frame = self.vis_objects(final_frame, objects)
        self.pub_final.publish(self.to_image_msg(final_frame, stamp))

        self.pub_echo.publish(self.to_image_msg(echo_frame, stamp))
        time_end = rospy.Time.now()
        rospy.loginfo_throttle(5, f'Processing time: {(time_end - time_start).to_sec():.3f}s')

if __name__ == '__main__':
    try:
        monitor = TrafficMonitor()
        rospy.spin()
    except rospy.ROSInterruptException as e:
        rospy.logerr(e)
        rospy.signal_shutdown('Error')
        cv2.destroyAllWindows()
        raise
