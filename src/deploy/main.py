import json
import math
from dataclasses import dataclass
from collections import defaultdict

import rospy
from std_msgs.msg import Float32MultiArray, String
from sensor_msgs.msg import Image, PointCloud2, PointField
from visualization_msgs.msg import MarkerArray, Marker
from std_msgs.msg import Header, ColorRGBA
from geometry_msgs.msg import Pose, Point, Vector3, Quaternion
from cv_bridge import CvBridge
from ros_numpy import numpify
import message_filters
import sensor_msgs.point_cloud2 as pc2

import cv2
import torch
import os
import numpy as np
from ultralytics import YOLO
from scipy.optimize import minimize, Bounds
from scipy.spatial.transform import Rotation
from pynput import keyboard
from pynput.keyboard import Controller, Key

# import keyboard
import threading

from utils import json_to_object, yaml_to_object


from ars548_messages.msg import ObjectList

def project_points(points_3d, camera_matrix, extrinsic_matrix):
    points_3d = np.asarray(points_3d)
    points_3d = np.hstack([points_3d, np.ones((points_3d.shape[0], 1))])
    points_3d = (extrinsic_matrix @ points_3d.T)[:3, :]
    points_2d = camera_matrix @ points_3d
    points_2d[:2, :] /= points_2d[2, :]
    points_2d = points_2d[:2, :].T
    return points_2d

def random_unit_quaternion():
    # 使用四維高斯分布產生後正規化，確保為單位四元數
    q = np.random.normal(0, 1, 4)
    q /= np.linalg.norm(q)
    return q  # (Qx, Qy, Qz, Qw)

def random_translation(low=-10, high=10):
    # 每個維度均勻分布在 [low, high]
    t = np.random.uniform(low, high, 3)
    return t  # (Tx, Ty, Tz)

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
    class_id: int
    p3: np.ndarray # original 3d radar point
    p2: np.ndarray # projected 2d radar point

@dataclass
class TrafficStats:
    flow: int = 0
    mean_speed: float = 0

class TrafficMonitor():
    def __init__(self, config_path='config.yaml'):
        rospy.init_node('traffic_monitor')
        self.setup_parameters(config_path)
        self.setup_topics()


        


    
    def setup_parameters(self, config_path):
        # with open(config_path, 'r') as f:
        #     config_data = json.load(f)
        # self.config = json_to_object(config_data)

        self.config = yaml_to_object(config_path)

        rospy.loginfo(self.config)

        self.cv_bridge = CvBridge()
        self.data = State()
        # cv2.namedWindow('traffic_monitor', cv2.WINDOW_NORMAL)

        # self.extrinsic_matrix 是一個list
        self.extrinsic_matrix = self.config.camera.extrinsic_matrix.copy()
        self.original_extrinsic_matrix = self.extrinsic_matrix.copy() # 為了顯示初始外參的投影結果

        if self.config.model_enabled:
            self.model = YOLO(self.config.model.path)
            if torch.cuda.is_available():
                self.model.to(torch.device('cuda'))
            rospy.loginfo(f'Model loaded on device {self.model.device}')

        # if self.config.radar_track_enabled:
        #     from bytetracker import BYTETracker
        #     self.radar_tracker = BYTETracker(frame_rate=self.config.fps)
        #     rospy.loginfo('Radar tracker initialized')

        if self.config.optimize:
            # 要優化的外參參數(x, y, z軸的旋轉、平移)
            # self.extrinsic_param = np.array([179.36, -83.87, -89.06, 0.11, 4.71, -2.18]) # [Rx, Ry, Rz, Tx, Ty, Tz]
            
            # # 設定隨機優化參數
            # quaternion = random_unit_quaternion()
            # translation = random_translation()
            # self.extrinsic_param_quat = np.array([quaternion[0], quaternion[1], quaternion[2], quaternion[3], translation[0], translation[1], translation[2]])
            # self.extrinsic_param_eular = self.quaternion_to_euler(quaternion[0], quaternion[1], quaternion[2], quaternion[3])

            
            # 把讀到的外參變成參數(quat)
            self.extrinsic_param_quat = self.transformation_matrix_to_param(self.extrinsic_matrix)
            

            self.saved_optimize_data = [] # 儲存(radar_point, boxes)
            self.save_optimize_mode = False # 控制第一次按下是儲存，第二次才進行最佳化
            self.optimize = False # 如果再optimize，就不要繼續跑偵測那些了
            self.optimize_method = "L-BFGS-B" # 優化方法
            self.sampling_interval = 1 # 儲存的間隔 (1的話就是每一幀都要)
            self.frame_count = 0

            # 把參數(quat)變成外參
            # self.new_extrisics_matrix = self.transformation_matrix(self.extrinsic_param_quat).tolist()

            # self.extrinsic_matrix = self.new_extrisics_matrix.copy()

            w, h = self.config.camera.width, self.config.camera.height
            fps = 30
            fourcc = cv2.VideoWriter_fourcc(*'mp4v')
            self.video_writer = cv2.VideoWriter('output.mp4', fourcc, fps, (w, h)) # 優化過程影片
            self.optimize_history = [] # 儲存優化過程的參數

            # 可視化
            self.visualize_pub = rospy.Publisher('/optimize_visualize', Image, queue_size=1)
            self.replay_recorded = False # 持續撥放已經儲存的片段

            # print("原始外參:", self.extrinsic_matrix)
            # print("原始參數(Euler):", self.quaternion_to_euler(self.extrinsic_param_quat))
            # print("原始參數(Quaternion):", self.extrinsic_param_quat)
            
            # rospy.loginfo("按 R 以進行錄製，S 停止錄製，F清除已錄製資料，O 進行優化")
            # # 啟動鍵盤監聽
            # with keyboard.Listener(on_press=self.on_press) as listener:
                # listener.join()
            # listener = keyboard.Listener(on_press=self.on_press)
            # listener.start()
            # threading.Thread(target=self.key_listener, daemon=True).start()
        
        self.cvInit = False
        self.store_camera_det = False
        self.store_camera_det_path = "camera_det"
        self.frame_id = 0
        
        self.radar_cls_list = ['car', 'truck', 'motorcycle', 'bicycle', 'pedestrian', 'animal', 'hazard', 'unknown']

        
        
        self.setup_traffic_stats()
    

    def setup_topics(self):
        # stream input
        _ = rospy.Subscriber(self.config.camera_topic, Image, self.camera_callback)
        _ = rospy.Subscriber(self.config.radar_topic, PointCloud2, self.radar_callback)
        _ = rospy.Timer(rospy.Duration(1.0 / self.config.fps), self.process_sensor_data)



        self.radar_pc = message_filters.Subscriber('/radar/point_cloud_object', PointCloud2)
        self.radar_obj = message_filters.Subscriber('/radar/object_list', ObjectList) # ARS548 object_list
        self.sync = message_filters.ApproximateTimeSynchronizer([self.radar_pc, self.radar_obj], queue_size=1, slop=0.1)
        self.sync.registerCallback(self.radar_filter)
        



        # self.pub_echo = rospy.Publisher(self.config.echo_topic, Image, queue_size=2)
        self.pub_track = rospy.Publisher(self.config.track_topic, Image, queue_size=2)
        self.pub_radar_project = rospy.Publisher(self.config.radar_project_topic, Image, queue_size=2)
        self.pub_final = rospy.Publisher(self.config.final_topic, Image, queue_size=2)

        self.pub_radar_original = rospy.Publisher("/radar_original_project", Image, queue_size=1)
        self.pub_range = rospy.Publisher("/radar_range", MarkerArray, queue_size=1)
        self.pub_radar_filter = rospy.Publisher('/radar_filter', PointCloud2, queue_size=1)
        self.pub_radar_marker = rospy.Publisher('/radar_marker', MarkerArray, queue_size=1)
        self.pub_matrix = rospy.Publisher('/radar/extrinsic_matrix', Float32MultiArray, queue_size=1)

        # control topics
        self.sub_matrix = rospy.Subscriber('/control/matrix', Float32MultiArray, self.matrix_callback)
        self.sub_optimize_action = rospy.Subscriber('/control/optimize_action', String, self.control_callback)
    
    def setup_traffic_stats(self):
        """
        Initialize traffic statistics tracking
        """
        # Initialize stats storage
        self.stats_interval = rospy.Duration(self.config.stats_interval_seconds or 15.0)
        self.crossed_objects = set()
        self.reset_traffic_stats()
    
        self.center_y = self.config.camera.height // 3 * 2
    
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
    
    def drawRadarRange(self):
        # radar range
        range_markers = MarkerArray()
        id = 0

        i = 0
        for t in [[0, 0, 0]]:
            radar_transform = t
            range_marker = Marker(
                header=Header(frame_id="ARS_548", stamp=rospy.Time.now()),
                id=id,
                ns="range_marker_wide",
                type=Marker.LINE_STRIP,
                action=Marker.ADD,
                pose=Pose(
                    position=Point(x=0, y=0, z=0.1),
                    orientation=Quaternion(x=0, y=0, z=0, w=1.0)
                ),
                scale=Vector3(x=0.5, y=0.1, z=0.1),
                color=ColorRGBA(r=0.0, g=0.0, b=1.0, a=1.0)
            )
            id = id + 1
            # wide range
            rotate = -60 * math.pi / 180.0 + radar_transform[2]
            range_marker.points.append(Point(
                x=math.cos(rotate) * 300 - math.sin(rotate) * 0,
                y=math.sin(rotate) * 300 + math.cos(rotate) * 0
            ))
            range_marker.points.append(Point(
                x=0 + radar_transform[0],
                y=0 + radar_transform[1]
            ))

            rotate = 60 * math.pi / 180.0 + radar_transform[2]
            range_marker.points.append(Point(
                x=math.cos(rotate) * 300 - math.sin(rotate) * 0,
                y=math.sin(rotate) * 300 + math.cos(rotate) * 0
            ))
            for i in range(60, -61, -5):
                rotate = i * math.pi / 180.0 + radar_transform[2]
                range_marker.points.append(Point(
                    x=math.cos(rotate) * 300 - math.sin(rotate) * 0,
                    y=math.sin(rotate) * 300 + math.cos(rotate) * 0
                ))
            range_markers.markers.append(range_marker)
        
        self.pub_range.publish(range_markers)


    def detect_objects(self, image, frame_id):
        dets = self.model.track(image, show=False, persist=True, tracker='bytetrack.yaml', \
            verbose=False, classes=self.config.model.classes, conf=0.08, imgsz=768, half=True)
        if not len(dets[0].boxes.xywh.cpu()):
            return [], [], image
        boxes = dets[0].boxes.xywh.cpu()
        track_ids = dets[0].boxes.id
        class_ids = dets[0].boxes.cls


        if track_ids is None:
            track_ids = []
        else:
            track_ids = dets[0].boxes.id.int().tolist()

        if class_ids is not None:
            class_ids = class_ids.int().tolist()
        else:
            class_ids = [-1] * len(boxes)  # 若沒有類別就填 -1

        # annotated_frame = dets[0].plot()
        annotated_frame = image.copy()
        result_text = []

        for box, track_id, cls_id in zip(boxes, track_ids, class_ids):
            x, y, w, h = box
            x1, y1 = int(x - w / 2), int(y - h / 2)
            x2, y2 = int(x + w / 2), int(y + h / 2)

            # 畫出框
            cv2.rectangle(annotated_frame, (x1, y1), (x2, y2), color=(0, 255, 0), thickness=3)

            track = self.data.track_history[track_id]
            track.append((float(x), float(y)))
            if len(track) > 30:
                track.pop(0)
            points = np.hstack(track).astype(np.int32).reshape((-1, 1, 2))
            # cv2.polylines(annotated_frame, [points], isClosed=False, color=(230, 230, 230), thickness=10) # 移動軌跡

            # 加上文字標籤：track ID + 類別名稱
            class_name = self.model.names[cls_id] if cls_id >= 0 else "unknown"
            text = f'{class_name} ID:{track_id}'

            # 計算文字尺寸，取得文字框座標
            font = cv2.FONT_HERSHEY_SIMPLEX
            font_scale = 1
            font_thickness = 2
            text_size, _ = cv2.getTextSize(text, font, font_scale, font_thickness)
            text_width, text_height = text_size

            # 畫綠色背景框
            bg_x1 = x1
            bg_y1 = y1 - text_height - 10
            bg_x2 = x1 + text_width + 6
            bg_y2 = y1
            cv2.rectangle(annotated_frame, (bg_x1, bg_y1), (bg_x2, bg_y2), color=(0, 255, 0), thickness=-1)


            cv2.putText(annotated_frame, text, (x1 + 3, y1 - 5), cv2.FONT_HERSHEY_SIMPLEX,
                        font_scale, (0, 0, 0), font_thickness, cv2.LINE_AA)
            # 儲存文字資料
            result_text.append(f"{class_name} {x1} {y1} {x2} {y2}")
        

        if self.store_camera_det:
            # 確保資料夾存在
            os.makedirs(self.store_camera_det_path, exist_ok=True)
            # 清除舊檔案
            for file in os.listdir(self.store_camera_det_path):
                file_path = os.path.join(self.store_camera_det_path, file)
                if os.path.isfile(file_path):
                    os.remove(file_path)
            
            os.makedirs(os.path.join(self.store_camera_det_path, "txt"), exist_ok=True)
            os.makedirs(os.path.join(self.store_camera_det_path, "png"), exist_ok=True)


            # 儲存圖片
            img_path = os.path.join(self.store_camera_det_path, "png", f"frame_{frame_id:05d}.png")
            cv2.imwrite(img_path, image)

            # 儲存文字偵測結果
            txt_path = os.path.join(self.store_camera_det_path, "txt", f"frame_{frame_id:05d}.txt")
            with open(txt_path, 'w') as f:
                f.write("\n".join(result_text))



            
        return boxes, track_ids, class_ids, annotated_frame

    def radar_to_image(self, radar_msg, frame, extrinsic_matrix):
        data = numpify(radar_msg) # (n * 7) [x y z vx vy id cls]
        points = np.stack([data[f] for f in ['x', 'y', 'z', 'vx', 'vy', 'id', 'cls']], axis=1, dtype=np.float32) # (n, 5)
        # fix z to 1
        points[:, 2] = 1
        # v = vx + vy
        v = np.linalg.norm(points[:, 3:5], axis=1)
        dist = np.linalg.norm(points[:, 0:2], axis=1)
        # sort points by v
        # points = points[np.logical_and(v > 1.0, points[:, 3] < 0)]
        # points = points[np.logical_and(v > 1.0, points[:, 3] > 0)]

        points = points[(v > 2.0)]
        # points = points[np.logical_and(v > 2.0, dist < 100)]
        points_2d = project_points(points[:, :3], self.config.camera.camera_matrix, extrinsic_matrix)

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
        for (x, y), cls, velocity in zip(points_2d, points[:, 6], v):
            cv2.circle(radar_frame, (x, y), 20, (255, 0, 0), -1)
            # cv2.putText(radar_frame, str(self.radar_cls_list[int(cls)]), (x + 15, y), cv2.FONT_HERSHEY_SIMPLEX, 1.5, (255, 0, 0), 4, cv2.LINE_AA)
            # cv2.putText(radar_frame, f"{velocity:.2f}", (x + 15, y + 50), cv2.FONT_HERSHEY_SIMPLEX, 1.5, (255, 0, 0), 4, cv2.LINE_AA)
        return points, points_2d, tracks, radar_frame
    
    def fusion(self, boxes, ids, class_ids, points_2d, points_3d):
        mapping = defaultdict(list)
        for box, box_id, cls_id in zip(boxes, ids, class_ids):
            x, y, w, h = box
            x, y = int(x - w / 2), int(y - h / 2)
            found = False
            for point, point_2d in zip(points_3d, points_2d):
                if x < point_2d[0] < x + w and y < point_2d[1] < y + h:
                    mapping[box_id].append(Detection(id=box_id, box=box, speed=np.linalg.norm(point[3:5]), dist=np.linalg.norm(point[:2]), p3=point, p2=point_2d, class_id=cls_id))
                    found = True
            if not found:
                mapping[box_id].append(Detection(id=box_id, box=box, speed=0, dist=0, p3=np.zeros(3), p2=np.zeros(2), class_id=cls_id))
        
        objects = []
        for box_id, detections in mapping.items():
            # average the detections
            avg = np.mean([d.speed for d in detections])
            dist = np.mean([d.dist for d in detections])
            p3 = np.mean([d.p3 for d in detections], axis=0)
            p2 = np.mean([d.p2 for d in detections], axis=0)
            objects.append(Detection(speed=avg, dist=dist, p3=p3, p2=p2, id=box_id, box=detections[0].box, class_id=detections[0].class_id))
        
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
            # cv2.putText(frame, f'{obj.speed*3.6:.2f} m/s', (x, y + 20), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 4, cv2.LINE_AA)
            # cv2.putText(frame, f'{obj.dist:.2f} m', (x, y + 40), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 4, cv2.LINE_AA)
            # cv2.circle(frame, [int(i) for i in obj.p2], 10, (0, 255, 0), -1)
        
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

        # if self.config.radar_track_enabled:
        #     from bytetracker import BYTETracker
        #     self.radar_tracker = BYTETracker(frame_rate=self.config.fps)


    def control_callback(self, msg):
        try:
            command = json.loads(msg.data)
            action = command[0]
            method = command[1]
            sample_interval = command[2]
        except Exception as e:
            rospy.logwarn(f"無法解析 optimize_command: {msg.data}, 錯誤: {e}")
            return
        
        self.optimize_method = method
        self.sampling_interval = int(sample_interval)
        if action == 'record_start':
            self.save_optimize_mode = True
            print("開始錄製")
        elif action == 'record_stop':
            self.save_optimize_mode = False
            print("停止錄製，經過", self.frame_count, "幀，interval=", self.sampling_interval, "已錄製", len(self.saved_optimize_data), "幀")
            if len(self.saved_optimize_data) > 0 and self.replay_recorded == False:
                threading.Thread(target=self.vis_recorded_data, daemon=True).start()
                self.replay_recorded = True
        elif action == 'clear':
            self.saved_optimize_data.clear()
            self.frame_count = 0
            self.replay_recorded = False
            rospy.loginfo("清除已錄製的資料")
        elif action == 'optimize':
            print("開始優化")
            self.optimize = True


    def vis_recorded_data(self):
        """
        持續地循環播放已錄製的影像和雷達投影。
        可配合 threading.Thread 在 background 執行。
        """
        if len(self.saved_optimize_data) == 0:
            rospy.loginfo("目前沒有已儲存的資料可視化")
            return

        rospy.loginfo("開始循環播放已儲存的資料...")
        while not rospy.is_shutdown() and len(self.saved_optimize_data) > 0:
            for idx, (points_3d, bboxes, bboxes_id, image) in enumerate(self.saved_optimize_data):
                vis_img = image.copy()

                vis_msg = self.cv_bridge.cv2_to_imgmsg(vis_img, encoding="bgr8")
                self.visualize_pub.publish(vis_msg)
                rospy.sleep(0.1)  # 控制 FPS



    
    def compute_loss(self, proj_pts, bboxes, image=None, visualize=False):
        loss = 0.0
        vis_img = image.copy() if visualize and image is not None else None

        for pt in proj_pts:
            x, y = pt
            min_dist = float('inf')
            closest_center = None

            for box in bboxes:
                cx, cy, w, h = box # cx, cy 是框中心
                # cx, cy = (x1 + x2) / 2, (y1 + y2) / 2
                dist = np.sqrt((x - cx)**2 + (y - cy)**2)
                if dist < min_dist:
                    min_dist = dist
                    closest_center = (int(cx), int(cy))

            if visualize and vis_img is not None and closest_center is not None:
                pt_int = (int(x), int(y))
                cv2.line(vis_img, pt_int, closest_center, (0, 0, 255), 2)  # 紅線
                cv2.circle(vis_img, pt_int, 15, (255, 0, 0), -1)  # 藍點（雷達投影）
                cv2.circle(vis_img, closest_center, 15, (0, 255, 0), -1)  # 綠點（框中心）

            loss += min_dist
        
        for box in bboxes:
            cx, cy, w, h = box
            cv2.circle(vis_img, (int(cx), int(cy)), 15, (0, 255, 0), -1)  # 綠點（框中心）

        if visualize and vis_img is not None:
            vis_msg = self.cv_bridge.cv2_to_imgmsg(vis_img)
            self.visualize_pub.publish(vis_msg)
            self.video_writer.write(vis_img)


        return loss / len(proj_pts) if proj_pts.shape[0] > 0 else float('inf')

    def batch_optimization_loss(self, extrinsic_param, saved_data, visualize=False):
        # qx, qy, qz, qw, tx, ty, tz = extrinsics_param
        normalized_param = self.normalize_quaternion(extrinsic_param)

        total_loss = 0.0
        for idx, (points_3d, bboxes, bboxes_id, image) in enumerate(saved_data):
            extrinsic_matrix = self.transformation_matrix(normalized_param).tolist()
            projected = project_points(points_3d[:, :3], self.config.camera.camera_matrix, extrinsic_matrix)
            loss = self.compute_loss(projected, bboxes, image=image, visualize=visualize)
            total_loss += loss

        print("Param:", extrinsic_param, "Loss:", total_loss)
        self.optimize_history.append((extrinsic_param, total_loss))
        return total_loss


    # ====== Quaternion Utils ======
    def euler_to_quaternion(self, param_euler):
        # param_euler: [Rx, Ry, Rz, Tx, Ty, Tz]
        rx, ry, rz = param_euler[:3]
        r = Rotation.from_euler('xyz', [rx, ry, rz])
        qx, qy, qz, qw = r.as_quat()  # 回傳順序為 [x, y, z, w]
        tx, ty, tz = param_euler[3:]
        return [qx, qy, qz, qw, tx, ty, tz]

    def quaternion_to_euler(self, param_quat):
        # param_quat: [Qx, Qy, Qz, Qw, Tx, Ty, Tz]
        qx, qy, qz, qw = param_quat[:4]
        r = Rotation.from_quat([qx, qy, qz, qw])
        rx, ry, rz = r.as_euler('xyz')
        tx, ty, tz = param_quat[4:]
        return [rx, ry, rz, tx, ty, tz]

    def quaternion_to_rotation_matrix(self, param_quat):
        # param_quat: [Qx, Qy, Qz, Qw, Tx, Ty, Tz]
        qx, qy, qz, qw = param_quat[:4]
        r = Rotation.from_quat([qx, qy, qz, qw])
        return r.as_matrix()  # shape: (3, 3)

    def normalize_quaternion(self, param_quat):
        # param_quat: [Qx, Qy, Qz, Qw, Tx, Ty, Tz]
        qx, qy, qz, qw = param_quat[:4]
        tx, ty, tz = param_quat[4:]
        norm = np.sqrt(qx**2 + qy**2 + qz**2 + qw**2)
        qx /= norm
        qy /= norm
        qz /= norm
        qw /= norm
        return [qx, qy, qz, qw, tx, ty, tz]
    


    
    def transformation_matrix_to_param(self, matrix):
        matrix = np.array(matrix)

        # 提取旋轉矩陣和位移向量
        R = matrix[:3, :3]
        T = matrix[:3, 3]

        # 將旋轉矩陣轉換為四元數
        r = Rotation.from_matrix(R)
        qx, qy, qz, qw = r.as_quat()
        # 提取位移向量
        Tx, Ty, Tz = T

        return [qx, qy, qz, qw, Tx, Ty, Tz]
    # ==============================

    def transformation_matrix(self, param_quat):
        # 四元數表示
        # qx, qy, qz, qw, tx, ty, tz = extrinsics_param
        normalized_quat = self.normalize_quaternion(param_quat)
        R_mat = self.quaternion_to_rotation_matrix(normalized_quat)
        T = np.array([normalized_quat[4], normalized_quat[5], normalized_quat[6]])  # Tx, Ty, Tz
        
        # 構建齊次變換矩陣 4x4
        transformation_matrix = np.eye(4)
        transformation_matrix[:3, :3] = R_mat  # 上三角放旋轉矩陣
        transformation_matrix[:3, 3] = T   # 最後一列放位移
        
        return transformation_matrix


    def process_sensor_data(self, timer):
        rospy.loginfo_once('Processing sensor data')
        time_start = rospy.Time.now()
        if not self.data.camera:
            rospy.logwarn('Missing camera data')
            return
        if not self.data.radar:
            rospy.logwarn('Missing radar data')
            return
        
        # if self.cvInit == False:
        #     cv2.namedWindow("traffic_monitor", cv2.WINDOW_NORMAL)
        #     cv2.resizeWindow("traffic_monitor", 1280, 720)
        #     self.cvInit = True

        image_msg, radar_msg = self.data.camera, self.data.radar
        stamp = image_msg.header.stamp
        self.time_check(stamp)

        echo_frame = frame = self.cv_bridge.imgmsg_to_cv2(image_msg)
        # detect and track
        if self.config.model_enabled:
            boxes, ids, class_ids, track_frame = self.detect_objects(frame, self.frame_id)
            if len(boxes):
                self.pub_track.publish(self.to_image_msg(track_frame, stamp))
        
        # process radar
        # points_3d: 雷達3D點，[x, y, z, vx, vy]
        points_3d, points_2d, radar_tracks, radar_frame = self.radar_to_image(radar_msg, frame, self.extrinsic_matrix)

        original_points_3d, original_points_2d, original_radar_tracks, original_radar_frame = self.radar_to_image(radar_msg, frame.copy(), self.original_extrinsic_matrix)
        
        

        # fuse radar points and bounding boxes
        objects = self.fusion(boxes, ids, class_ids, points_2d, points_3d)
        self.flow_stats(objects)

        fusion_frame = self.vis_objects(radar_frame.copy(), objects)
        camera_detection = self.vis_objects(frame.copy(), objects)
        # self.pub_radar_project.publish(self.to_image_msg(fusion_frame, stamp))

        # 自動化校正
        # 優化外參
        if self.save_optimize_mode == True:
            if self.frame_count % self.sampling_interval == 0:
                self.saved_optimize_data.append([points_3d, boxes, ids, frame.copy()])
            self.frame_count += 1

        if self.optimize == True:
            start_time = rospy.Time.now()
            # 過濾靜止物件
            self.filter_static_objects_by_track_id()
            rotation_bounds = [(-1, 1)] * 4
            translation_bounds = [(-10, 10)] * 3
            bounds = rotation_bounds + translation_bounds
            # rx, ry, rz, tx, ty, tz = self.extrinsic_param
            # rx, ry, rz = np.radians([rx, ry, rz]) # 修改成弧度

            # qx, qy, qz, qw = self.euler_to_quaternion(rx, ry, rz) # 歐拉角轉換成四元數
            # self.extrinsic_param_quat = [qx, qy, qz, qw, tx, ty, tz] # 準備優化: 旋轉+位移
            init_extrinsic_param_quat = self.extrinsic_param_quat.copy()
            
            print("開始優化, method:", self.optimize_method)
            result = minimize(self.batch_optimization_loss, self.extrinsic_param_quat,
                            args=(self.saved_optimize_data, True), method=self.optimize_method, bounds=bounds)
            
            self.extrinsic_matrix = self.transformation_matrix(result.x)
            end_time = rospy.Time.now()
            print("New extrinsic matrix:\n", self.extrinsic_matrix)
            print("-"*20)
            print("Old extrinsic matrix:\n", np.array(self.original_extrinsic_matrix))

            rospy.loginfo("最佳化完成，共優化: %d 幀，最小損失: %.2f", len(self.saved_optimize_data), result.fun)
            
            rospy.loginfo("最佳參數: %s", str(result.x))
            rospy.loginfo("初始參數: %s", str(init_extrinsic_param_quat))
            result_quat_param = list(result.x)
            result_euler_param = self.quaternion_to_euler(result_quat_param)
            rospy.loginfo("轉換回角度: %s", result_euler_param)
            rospy.loginfo("原始參數: %s", str(self.extrinsic_param_quat))
            rospy.loginfo_throttle(5, f'Processing time: {(end_time - start_time).to_sec():.3f}s')
            
            with open(f"optimize_history.txt", 'w') as f:
                for param, loss in self.optimize_history:
                    f.write(f"{param} {loss}\n")
            
            matrix_msg = Float32MultiArray()
            matrix_msg.data = self.extrinsic_matrix.flatten().tolist()
            self.pub_matrix.publish(matrix_msg)
            
            self.optimize = False
            self.video_writer.release()
            
            
        # final result
        final_frame = frame.copy()
        # final_frame = self.vis_objects(radar_frame, objects)

        # 改成顯示優化後外參結果
        # new_points_3d, new_points_2d, radar_tracks, new_radar_frame = self.radar_to_image(radar_msg, final_frame, self.new_extrisics_matrix)
        # 建立可調整大小的視窗
        

        
        # cv2.imshow('traffic_monitor', track_frame)
        # cv2.waitKey(1)

        self.pub_radar_original.publish(self.to_image_msg(original_radar_frame, stamp))
        self.pub_final.publish(self.to_image_msg(fusion_frame, stamp))
        # self.pub_echo.publish(self.to_image_msg(echo_frame, stamp))

        
        self.frame_id += 1
        time_end = rospy.Time.now()
        # rospy.loginfo_throttle(5, f'Processing time: {(time_end - time_start).to_sec():.3f}s')


    def filter_static_objects_by_track_id(self, movement_threshold=10.0, min_frames=3):
        """
        根據 track_id 的中心移動距離，過濾每幀中靜止的物件框
        """
        print("正在過濾靜止物件框...")

        # 建立每個 track_id 對應的中心點軌跡
        track_history = {}
        for _, boxes, ids, _ in self.saved_optimize_data:
            for box, track_id in zip(boxes, ids):
                if track_id is None:
                    continue
                cx, cy, w, h = box
                if track_id not in track_history:
                    track_history[track_id] = []
                track_history[track_id].append((float(cx), float(cy)))

        # 判斷靜止的 track_id
        static_ids = set()
        for tid, centers in track_history.items():
            if len(centers) < min_frames:
                continue
            total_dist = sum(
                np.linalg.norm(np.array(centers[i]) - np.array(centers[i - 1]))
                for i in range(1, len(centers))
            )
            if total_dist < movement_threshold:
                static_ids.add(tid)

        print(f"判斷為靜止的 track_ids: {static_ids}")

        # 過濾每幀中的 boxes
        filtered_data = []
        for points_3d, boxes, ids, image in self.saved_optimize_data:
            new_boxes = []
            new_ids = []
            for box, track_id in zip(boxes, ids):
                if track_id is None or track_id not in static_ids:
                    new_boxes.append(box)
                    new_ids.append(track_id)
            filtered_data.append([points_3d, new_boxes, new_ids, image])

        self.saved_optimize_data = filtered_data
        print("靜止框過濾完成。")





    def radar_filter(self, radar_pc, radar_obj):
       
        markers = MarkerArray()
        # # clear previous markers
        markers.markers.append(Marker(
            header=Header(frame_id="ARS_548", stamp=rospy.Time.now()),
            action=Marker.DELETEALL
        ))
        
        radar_point_filter = [] # 只留速度大於1的

        # Iterate through the points in the PointCloud2 message
        for obj in radar_obj.objectlist_objects:
            id = obj.u_id
            x = obj.u_position_x
            y = obj.u_position_y
            z = obj.u_position_z
            vx = obj.f_dynamics_absvel_x
            vy = obj.f_dynamics_absvel_y





            
            prob = [obj.u_classification_car, obj.u_classification_truck, obj.u_classification_motorcycle,
                    obj.u_classification_bicycle, obj.u_classification_pedestrian, obj.u_classification_animal,
                    obj.u_classification_hazard, obj.u_classification_unknown]
            
            cls_max_index = prob.index(max(prob))
            class_name = self.radar_cls_list[cls_max_index]
            # print(classification[max_index])

            # 畫雷達範圍
            self.drawRadarRange()
            # effective range

            effective_range = False
            angle = math.atan2(y, x) * 180 / math.pi
            dist = math.sqrt(x ** 2 + y ** 2)
            elevation_angle = math.degrees(math.atan2(z, dist))
            
            if (dist < 100 and abs(elevation_angle) < 14 and abs(angle) < 60) or \
                (dist < 300 and abs(elevation_angle) < 4 and abs(angle) < 60):
                effective_range = True
            

            if effective_range == True:
                speed = math.sqrt(pow(vx, 2)+pow(vy,2)) # 這個speed單位是m/s

                # if speed > 2 and dist < 30:
                if class_name == 'car' or class_name == 'truck' or class_name == 'motorcycle' or class_name == 'bicycle':

                    radar_point_filter.append([x, y, z, vx, vy, id, cls_max_index])
                    # 把資訊印在rviz
                    width = obj.u_shape_width_edge_mean
                    length = obj.u_shape_length_edge_mean
                    text_marker = Marker(
                        header=Header(frame_id="ARS_548", stamp=rospy.Time.now()),
                        id=id,
                        ns="front_center_text",
                        type=Marker.TEXT_VIEW_FACING,
                        action=Marker.ADD,
                        # text=f"id: {obj.u_id} cls: {obj.classT}\n{dist:.2f}m\n{speed*3.6:.2f}km/h\n{obj.vrelX:.2f} {obj.vrelY:.2f}",
                        # text=f"id: {obj.u_id}\nWxL:{width:.2f}x{length:.2f}m\nSpeed:{speed*3.6:.2f}km/h\nClass:{self.radar_cls_list[cls_max_index]}\nDist:{dist:.2f}\nHeight:{z:.2f}m\nElevation_angle: {elevation_angle:.2f}",
                        # text=f"dist: {dist:.2f}\nelevation_angle: {elevation_angle:.2f}\n{speed*3.6:.2f}km/h\nClass:{classification[max_index]}",
                        # text=f"x:{obj.u_position_x}\ny:{obj.u_position_y}\nz:{obj.u_position_z}",
                        text = f"id: {obj.u_id}\nClass:{self.radar_cls_list[cls_max_index]}",
                        pose=Pose(
                            position=Point(x=obj.u_position_x, y=obj.u_position_y, z=obj.u_position_z),
                            orientation=Quaternion(x=0, y=0, z=1)
                        ),
                        scale=Vector3(x=2, y=2, z=2),
                        color=ColorRGBA(r=0.0, g=1.0, b=0.0, a=1.0),
                    )
                    markers.markers.append(text_marker)


        header = Header()
        # header.stamp = rospy.Time.now()
        header.stamp = radar_obj.header.stamp
        header.frame_id = radar_pc.header.frame_id
        fields = [
            PointField('x', 0, PointField.FLOAT32, 1),
            PointField('y', 4, PointField.FLOAT32, 1),
            PointField('z', 8, PointField.FLOAT32, 1),
            PointField('vx', 12, PointField.FLOAT32, 1),
            PointField('vy', 16, PointField.FLOAT32, 1),
            PointField('id', 20, PointField.FLOAT32, 1),
            PointField('cls', 24, PointField.FLOAT32, 1)
        ]
        point_cloud_filter = pc2.create_cloud(header, fields, radar_point_filter)
        self.pub_radar_filter.publish(point_cloud_filter)

        self.pub_radar_marker.publish(markers)

if __name__ == '__main__':
    try:
        monitor = TrafficMonitor()
        rospy.spin()
    except rospy.ROSInterruptException as e:
        rospy.logerr(e)
        rospy.signal_shutdown('Error')
        cv2.destroyAllWindows()
        raise
