#!/usr/bin/env python
import rosbag
import cv2
from cv_bridge import CvBridge
from sensor_msgs.msg import Image
import os
import numpy as np
from cv_bridge import CvBridge
from sensor_msgs.msg import CompressedImage
from tqdm import tqdm

# === 使用者參數 ===
bag_path = "/media/mvclab/HDD/ncsist/2025/data/20250701/A_place/"  # ROS bag 檔案路徑
bag_file = "3_2025-07-01-21-50-32.bag"  # ROS bag 檔案名稱
image_topic = "/aravis_cam/image_color/compressed"  # Image topic 名稱
output_video = bag_file[:-4] + ".mp4"  # 輸出的 MP4 檔案名稱
fps = 20  # 預設影格率


# 預讀訊息數量（取得進度條長度）
print("預掃描 bag 中的影像數量...")
with rosbag.Bag(os.path.join(bag_path, bag_file), "r") as bag:
    total_msgs = sum(1 for _ in bag.read_messages(topics=[image_topic]))


# 初始化
bridge = CvBridge()
video_writer = None

with rosbag.Bag(os.path.join(bag_path, bag_file), "r") as bag:
    for topic, msg, t in tqdm(bag.read_messages(topics=[image_topic]), total=total_msgs):
        try:
            # 解碼 compressed image
            np_arr = np.frombuffer(msg.data, np.uint8)
            cv_image = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)
        except Exception as e:
            print(f"解碼失敗: {e}")
            continue

        if video_writer is None:
            height, width, _ = cv_image.shape
            fourcc = cv2.VideoWriter_fourcc(*"mp4v")
            video_writer = cv2.VideoWriter(output_video, fourcc, fps, (width, height))

        video_writer.write(cv_image)

# 關閉寫入器
if video_writer:
    video_writer.release()
    print(f"已儲存影片: {output_video}")
else:
    print("無影像寫入，影片未產生。")