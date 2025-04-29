#!/usr/bin/env python
# file: scripts/calib_node.py

import rospy
import cv2
import torch
import numpy as np
import tf

from sensor_msgs.msg import Image, PointCloud2
from cv_bridge import CvBridge
from sensor_msgs import point_cloud2
from scipy.optimize import minimize
from ultralytics import YOLO

bridge = CvBridge()

class RadarCameraCalibrator:
    def __init__(self):
        rospy.init_node("radar_camera_calibrator")

        self.image_sub = rospy.Subscriber("/camera/image_raw", Image, self.image_callback, queue_size=1)
        self.lidar_sub = rospy.Subscriber("/lidar/points", PointCloud2, self.lidar_callback, queue_size=1)

        # self.model = torch.hub.load('ultralytics/yolov5', 'yolov5s', pretrained=True)
        self.model = YOLO(self.config.model.path)
            if torch.cuda.is_available():
                self.model.to(torch.device('cuda'))
            rospy.loginfo(f'Model loaded on device {self.model.device}')
        self.model.eval()

        self.image = None
        self.lidar_points = None

        # 相機內參（範例）
        self.K = np.array([[700, 0, 640],
                           [0, 700, 360],
                           [0, 0, 1]])

        # 初始外參（旋轉角度 + 平移向量）
        self.extrinsics = np.array([0.0, 0.0, 0.0, 0.5, 0.0, 0.0])

    def image_callback(self, msg):
        # 接收影像資料
        self.image = bridge.imgmsg_to_cv2(msg, desired_encoding='bgr8')

    def lidar_callback(self, msg):
        # 接收雷達點雲資料
        self.lidar_points = list(point_cloud2.read_points(msg, field_names=("x", "y", "z"), skip_nans=True))

    def run(self):
        rate = rospy.Rate(2)
        while not rospy.is_shutdown():
            if self.image is not None and self.lidar_points is not None:
                bboxes = self.detect_objects(self.image)

                # 優化外參
                result = minimize(self.optimization_loss, self.extrinsics,
                                  args=(self.lidar_points, bboxes), method='Powell')
                self.extrinsics = result.x

                rospy.loginfo("最佳化完成，最小損失: %.2f", result.fun)
                rospy.loginfo("最佳外參: %s", str(result.x))

                # 顯示可視化結果
                vis_image = self.visualize_projection(self.image.copy(), bboxes, self.lidar_points, self.extrinsics)
                cv2.imshow("校正視覺化結果", vis_image)
                cv2.waitKey(1)
            rate.sleep()

    def detect_objects(self, image):
        # 使用 YOLO 執行物件偵測
        results = self.model(image)
        detections = results.xyxy[0].cpu().numpy()
        return [d[:4] for d in detections if int(d[5]) in [2, 3, 5, 7]]  # 車、機車、巴士、卡車

    def project_lidar_to_image(self, points, extr):
        # 將雷達點使用外參投影到影像平面
        rx, ry, rz, tx, ty, tz = extr
        R = tf.transformations.euler_matrix(rx, ry, rz)[:3, :3]
        T = np.array([tx, ty, tz]).reshape(3, 1)

        pts_lidar = np.array(points).T  # shape (3, N)
        pts_cam = R @ pts_lidar + T
        pts_cam = pts_cam.T

        mask = pts_cam[:, 2] > 0  # 篩選在前方的點
        pts_cam = pts_cam[mask]

        proj_pts = self.K @ pts_cam.T
        proj_pts = proj_pts[:2] / proj_pts[2]
        return proj_pts.T

    def compute_loss(self, proj_pts, bboxes):
        # 計算所有投影點到最近偵測框的距離總和
        loss = 0.0
        for pt in proj_pts:
            x, y = pt
            min_dist = float('inf')
            for box in bboxes:
                x1, y1, x2, y2 = box
                cx, cy = (x1 + x2) / 2, (y1 + y2) / 2
                dist = np.sqrt((x - cx)**2 + (y - cy)**2)
                if dist < min_dist:
                    min_dist = dist
            loss += min_dist
        return loss / len(proj_pts) if proj_pts.shape[0] > 0 else float('inf')

    def optimization_loss(self, extrinsics, lidar_pts, bboxes):
        # 用於最佳化的損失函數
        projected = self.project_lidar_to_image(lidar_pts, extrinsics)
        return self.compute_loss(projected, bboxes)

    def visualize_projection(self, image, bboxes, lidar_pts, extr):
        # 繪製偵測框
        for box in bboxes:
            x1, y1, x2, y2 = map(int, box)
            cv2.rectangle(image, (x1, y1), (x2, y2), (0, 255, 0), 2)

        # 繪製投影雷達點
        proj_pts = self.project_lidar_to_image(lidar_pts, extr)
        for pt in proj_pts:
            x, y = int(pt[0]), int(pt[1])
            if 0 <= x < image.shape[1] and 0 <= y < image.shape[0]:
                cv2.circle(image, (x, y), 2, (0, 0, 255), -1)
        return image

if __name__ == '__main__':
    calib = RadarCameraCalibrator()
    calib.run()
