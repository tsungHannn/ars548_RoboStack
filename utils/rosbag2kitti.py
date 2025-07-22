#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import cv2
import numpy as np
import rosbag
import sensor_msgs.point_cloud2 as pc2
from cv_bridge import CvBridge
import shutil
import math
from tqdm import tqdm
from natsort import natsorted

# === 路徑與 topic 名稱 ===
bag_path = "/media/mvclab/HDD/ncsist/2025/data/20250701/B_place"
# bag_path = "/media/mvclab/HDD/ncsist/2025/data/A_place/1_2025-02-26-10-13-51.bag"
output_path = os.path.join("output", bag_path[-7:])
output_pcd_dir = "pcd"
output_png_dir = "png"
lidar_topic = "/radar/point_cloud_object"
camera_topic = "/aravis_cam/image_color/compressed"

# === 轉換參數 ===
trans_roll = 0.0
trans_pitch = 0.0
trans_yaw = 0.0
trans_tx = 0.0
trans_ty = 0.0
trans_tz = 0.0

def prepare_directory(path):
    if os.path.exists(path):
        shutil.rmtree(path)
    os.makedirs(path)

def transform_point(x, y, z):
    rz = math.radians(trans_yaw)
    ry = math.radians(trans_pitch)
    rx = math.radians(trans_roll)

    cz, sz = math.cos(rz), math.sin(rz)
    cy, sy = math.cos(ry), math.sin(ry)
    cx, sx = math.cos(rx), math.sin(rx)

    Rz = np.array([[cz, -sz, 0],
                   [sz, cz, 0],
                   [0, 0, 1]])
    Ry = np.array([[cy, 0, sy],
                   [0, 1, 0],
                   [-sy, 0, cy]])
    Rx = np.array([[1, 0, 0],
                   [0, cx, -sx],
                   [0, sx, cx]])

    R = Rz @ Ry @ Rx
    T = np.array([[trans_tx], [trans_ty], [trans_tz]])
    P = R @ np.array([[x], [y], [z]]) + T
    return P.flatten()

def count_messages(bag, topics):
    """ 預先掃描 message 數量以顯示進度條 """
    return sum(1 for _ in bag.read_messages(topics=topics))

def process_bag(file):
    prepare_directory(os.path.join(output_path, file[:-4], output_pcd_dir))
    prepare_directory(os.path.join(output_path, file[:-4], output_png_dir))
    bridge = CvBridge()

    bag_file_path = os.path.join(bag_path, file)
    bag = rosbag.Bag(bag_file_path, 'r')
    total_msgs = count_messages(bag, [lidar_topic, camera_topic])
    bag.close()

    bag = rosbag.Bag(bag_file_path, 'r')
    lidar_index = 0
    image_buffer = []

    for topic, msg, t in tqdm(bag.read_messages(topics=[lidar_topic, camera_topic]), total=total_msgs, ncols=100, desc=f"[{file}]", leave=False):
        if topic == camera_topic:
            image_buffer.append((t, msg))

        elif topic == lidar_topic:
            pcd_path = os.path.join(output_path, file[:-4], output_pcd_dir, f"{lidar_index:06d}.pcd")

            if msg.width == 0:
                with open(os.path.join(pcd_path), 'w') as f:
                    f.write("""# .PCD v0.7 - Point Cloud Data file format
                            VERSION 0.7
                            FIELDS x y z vx vy
                            SIZE 4 4 4 4 4
                            TYPE F F F F F
                            COUNT 1 1 1 1 1
                            WIDTH 0
                            HEIGHT 1
                            VIEWPOINT 0 0 0 1 0 0 0
                            POINTS 0
                            DATA ascii
                            """)
            else:
                points = []
                for pt in pc2.read_points(msg, field_names=("x", "y", "z", "vx", "vy"), skip_nans=True):
                    x, y, z = transform_point(pt[0], pt[1], pt[2])
                    vx, vy = pt[3], pt[4]
                    points.append([x, y, z, vx, vy])

                with open(pcd_path, 'w') as f:
                    f.write("# .PCD v0.7 - Point Cloud Data file format\n")
                    f.write("VERSION 0.7\n")
                    f.write("FIELDS x y z vx vy\n")
                    f.write("SIZE 4 4 4 4 4\n")
                    f.write("TYPE F F F F F\n")
                    f.write("COUNT 1 1 1 1 1\n")
                    f.write(f"WIDTH {len(points)}\n")
                    f.write("HEIGHT 1\n")
                    f.write("VIEWPOINT 0 0 0 1 0 0 0\n")
                    f.write(f"POINTS {len(points)}\n")
                    f.write("DATA ascii\n")
                    for pt in points:
                        f.write(f"{pt[0]:.5f} {pt[1]:.5f} {pt[2]:.5f} {pt[3]:.5f} {pt[4]:.5f}\n")

            png_path = os.path.join(output_path, file[:-4], output_png_dir, f"{lidar_index:06d}.png")
            closest_index = -1
            min_time_diff = float('inf')
            for i, (ts, img_msg) in enumerate(image_buffer):
                time_diff = abs((msg.header.stamp.to_sec() - ts.to_sec()))
                if time_diff < min_time_diff:
                    min_time_diff = time_diff
                    closest_index = i

            if 0 <= closest_index < len(image_buffer) and min_time_diff < 0.05:
                closest_img = image_buffer.pop(closest_index)  # 對應影像配對後即移除
                try:
                    np_arr = np.frombuffer(closest_img[1].data, np.uint8)
                    cv_image = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)
                    cv2.imwrite(png_path, cv_image)
                except Exception as e:
                    print(f"❌ Failed to save image {lidar_index}: {e}")

            lidar_index += 1
    bag.close()

def check_directory(file):
    # 檢查相機與雷達的檔案，只留下同時有相機與雷達的資料
    lidar_dir = os.path.join(output_path, file[:-4], output_pcd_dir)
    image_dir = os.path.join(output_path, file[:-4], output_png_dir)

    for lidar_file in os.listdir(lidar_dir):
        lidar_path = os.path.join(lidar_dir, lidar_file)
        image_file = os.path.splitext(lidar_file)[0] + ".png"
        image_path = os.path.join(image_dir, image_file)
        if not os.path.exists(image_path):
            os.remove(lidar_path)
    
    for image_file in os.listdir(image_dir):
        image_path = os.path.join(image_dir, image_file)
        lidar_file = os.path.splitext(image_file)[0] + ".pcd"
        lidar_path = os.path.join(lidar_dir, lidar_file)
        if not os.path.exists(lidar_path):
            os.remove(image_path)

def main():
    all_files = os.listdir(bag_path)
    all_files = natsorted(all_files)
    # all_files = sorted([f for f in os.listdir(bag_path) if f.endswith(".bag")])
    total_bags = len(all_files)

    with tqdm(total=total_bags, desc="📦 Total Progress", ncols=100) as pbar:
        for file in all_files:
            process_bag(file)
            check_directory(file)
            pbar.update(1)

    print("✅ All bags processed!")


if __name__ == "__main__":
    main()
