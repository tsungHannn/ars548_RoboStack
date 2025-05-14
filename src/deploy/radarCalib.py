#!/usr/bin/env python
# -*- coding: utf-8 -*-

import rospy
import numpy as np
from sensor_msgs.msg import PointCloud2, PointField
import sensor_msgs.point_cloud2 as pc2
from std_msgs.msg import Header, ColorRGBA
import tf
import math
from visualization_msgs.msg import MarkerArray, Marker
from geometry_msgs.msg import Pose, Point, Quaternion, Vector3

class RadarPointCloudCorrection:
    def __init__(self):
        rospy.init_node('radar_pointcloud_correction_node')
        
        # 初始化 pitch_angle，並設置為 ROS Param
        self.pitch_angle = rospy.get_param('~pitch_angle', 0.0)  # 默認值為 10 度
        self.pitch_angle_rad = np.deg2rad(self.pitch_angle)
        # 繞 X 旋轉
        # self.R_pitch = np.array([
        #         [1, 0, 0],
        #         [0, np.cos(self.pitch_angle_rad), -np.sin(self.pitch_angle_rad)],
        #         [0, np.sin(self.pitch_angle_rad), np.cos(self.pitch_angle_rad)]
        #     ])

        # 繞 Y 旋轉
        self.R_pitch = np.array([
            [np.cos(self.pitch_angle_rad), 0, np.sin(self.pitch_angle_rad)],
            [0, 1, 0],
            [-np.sin(self.pitch_angle_rad), 0, np.cos(self.pitch_angle_rad)]
        ])

        # # 繞 Z 旋轉
        # self.R_pitch = np.array([
        #     [np.cos(self.pitch_angle_rad), -np.sin(self.pitch_angle_rad), 0],
        #     [np.sin(self.pitch_angle_rad), np.cos(self.pitch_angle_rad), 0],
        #     [0, 0, 1]
        # ])
        
        self.update_pitch_angle()

        # 設置定時器，每 1 秒檢查參數更新
        self.timer = rospy.Timer(rospy.Duration(1.0), self.update_pitch_angle)

        # 訂閱與發布
        self.pointcloud_sub = rospy.Subscriber('/radar/point_cloud_object', PointCloud2, self.pointcloud_callback)
        self.pointcloud_pub = rospy.Publisher('/radar/point_cloud_corrected', PointCloud2, queue_size=10)
        self.pub_radar_marker_corrected = rospy.Publisher('/radar_marker_corrected', MarkerArray, queue_size=1)

        rospy.loginfo('Radar Point Cloud Correction Node Initialized with pitch angle: {:.2f} degrees'.format(self.pitch_angle))

    def update_pitch_angle(self, event=None):
        """ 更新 pitch_angle 並重新計算旋轉矩陣 """
        new_pitch_angle = rospy.get_param('~pitch_angle', self.pitch_angle)

        if new_pitch_angle != self.pitch_angle:
            self.pitch_angle = new_pitch_angle
            self.pitch_angle_rad = np.deg2rad(self.pitch_angle)

            # 更新旋轉矩陣
            # 繞 X 旋轉
            # self.R_pitch = np.array([
            #     [1, 0, 0],
            #     [0, np.cos(self.pitch_angle_rad), -np.sin(self.pitch_angle_rad)],
            #     [0, np.sin(self.pitch_angle_rad), np.cos(self.pitch_angle_rad)]
            # ])

            # 繞 Y 旋轉
            self.R_pitch = np.array([
                [np.cos(self.pitch_angle_rad), 0, np.sin(self.pitch_angle_rad)],
                [0, 1, 0],
                [-np.sin(self.pitch_angle_rad), 0, np.cos(self.pitch_angle_rad)]
            ])

            # # 繞 Z 旋轉
            # self.R_pitch = np.array([
            # [np.cos(self.pitch_angle_rad), -np.sin(self.pitch_angle_rad), 0],
            # [np.sin(self.pitch_angle_rad), np.cos(self.pitch_angle_rad), 0],
            # [0, 0, 1]
            # ])
            
            rospy.loginfo(f"Pitch angle updated to: {self.pitch_angle:.2f} degrees")

    def pointcloud_callback(self, msg):
        points = list(pc2.read_points(msg, field_names=('x', 'y', 'z', 'vx', 'vy'), skip_nans=True))
        corrected_points = []

        for point in points:
            x, y, z, vx, vy = point

            # Apply pitch correction
            corrected_point = np.dot(self.R_pitch, np.array([x, y, z]))
            corrected_point = np.append(corrected_point, [vx, vy])
            corrected_points.append(corrected_point)

        # 發布校正後的點雲
        header = Header()
        header.stamp = rospy.Time.now()
        header.frame_id = msg.header.frame_id
        fields = [
            PointField('x', 0, PointField.FLOAT32, 1),
            PointField('y', 4, PointField.FLOAT32, 1),
            PointField('z', 8, PointField.FLOAT32, 1),
            PointField('vx', 12, PointField.FLOAT32, 1),
            PointField('vy', 16, PointField.FLOAT32, 1),
        ]
        corrected_msg = pc2.create_cloud(header, fields, corrected_points)
        self.pointcloud_pub.publish(corrected_msg)

if __name__ == '__main__':
    try:
        node = RadarPointCloudCorrection()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass