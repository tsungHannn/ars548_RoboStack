#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
將 MP4 影片轉換成 ROS1 bag 格式
需要安裝: pip install opencv-python rosbag cv-bridge --break-system-packages
"""

import cv2
import rosbag
import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import os

# ============================================
# 在這裡設定你的參數
# ============================================
VIDEO_NAME = "雪隧資料_花老師/north16.mp4"              # 輸入影片檔名
OUTPUT_BAG_NAME = "output.bag"        # 輸出 bag 檔名
TOPIC_NAME = "aravis_cam/image_color_row"      # ROS topic 名稱
OUTPUT_FPS = None                     # 輸出 FPS (None = 使用原始 FPS，或設定數字如 30, 15, 10)
FRAME_ID = "ARS_548"                   # Frame ID
# ============================================


def mp4_to_rosbag(video_path, output_bag_path, topic_name, fps, frame_id):
    """
    將 MP4 影片轉換為 ROS bag
    
    參數:
        video_path: 輸入的 MP4 影片路徑
        output_bag_path: 輸出的 bag 檔案路徑
        topic_name: ROS topic 名稱
        fps: 指定 FPS (如果為 None，則使用影片原始 FPS)
        frame_id: ROS frame ID
    """
    
    # 檢查輸入檔案是否存在
    if not os.path.exists(video_path):
        print(f"錯誤: 找不到影片檔案 {video_path}")
        return False
    
    # 開啟影片
    cap = cv2.VideoCapture(video_path)
    if not cap.isOpened():
        print(f"錯誤: 無法開啟影片 {video_path}")
        return False
    
    # 取得影片資訊
    total_frames = int(cap.get(cv2.CAP_PROP_FRAME_COUNT))
    video_fps = cap.get(cv2.CAP_PROP_FPS)
    width = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
    height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
    
    if fps is None:
        fps = video_fps
    
    print("=" * 60)
    print("影片資訊:")
    print(f"  檔案路徑: {video_path}")
    print(f"  解析度: {width}x{height}")
    print(f"  原始 FPS: {video_fps:.2f}")
    print(f"  總幀數: {total_frames}")
    print(f"  影片長度: {total_frames/video_fps:.2f} 秒")
    print("\n輸出設定:")
    print(f"  輸出檔案: {output_bag_path}")
    print(f"  Topic 名稱: {topic_name}")
    print(f"  輸出 FPS: {fps:.2f}")
    print(f"  Frame ID: {frame_id}")
    print("=" * 60)
    
    # 建立 CvBridge 用於轉換 OpenCV 影像到 ROS 訊息
    bridge = CvBridge()
    
    # 建立 rosbag
    try:
        bag = rosbag.Bag(output_bag_path, 'w')
        print(f"\n開始轉換...")
        
        frame_count = 0
        time_increment = rospy.Duration(1.0 / fps)
        current_time = rospy.Time(0)
        
        while True:
            ret, frame = cap.read()
            if not ret:
                break
            
            # 將 BGR 轉換為 RGB (ROS 使用 RGB)
            frame_rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
            
            # 轉換為 ROS Image 訊息
            image_msg = bridge.cv2_to_imgmsg(frame_rgb, encoding="rgb8")
            image_msg.header.stamp = current_time
            image_msg.header.frame_id = frame_id
            
            # 寫入 bag
            bag.write(topic_name, image_msg, current_time)
            
            frame_count += 1
            current_time += time_increment
            
            # 顯示進度
            if frame_count % 30 == 0 or frame_count == total_frames:
                progress = (frame_count / total_frames) * 100
                print(f"進度: {frame_count}/{total_frames} ({progress:.1f}%)")
        
        print("\n" + "=" * 60)
        print("轉換完成!")
        print(f"總共處理了 {frame_count} 幀")
        print(f"輸出檔案: {output_bag_path}")
        
        # 取得檔案大小
        bag_size = os.path.getsize(output_bag_path) / (1024 * 1024)  # MB
        print(f"檔案大小: {bag_size:.2f} MB")
        print("=" * 60)
        
    except Exception as e:
        print(f"錯誤: {e}")
        import traceback
        traceback.print_exc()
        return False
    
    finally:
        cap.release()
        bag.close()
    
    return True


def main():
    """主程式"""
    print("\n" + "=" * 60)
    print("MP4 轉 ROS1 Bag 工具")
    print("=" * 60)
    
    # 使用程式開頭設定的參數
    success = mp4_to_rosbag(
        video_path=VIDEO_NAME,
        output_bag_path=OUTPUT_BAG_NAME,
        topic_name=TOPIC_NAME,
        fps=OUTPUT_FPS,
        frame_id=FRAME_ID
    )
    
    if success:
        print("\n✓ 轉換成功!")
        print("\n使用以下指令查看 bag 檔案:")
        print(f"  rosbag info {OUTPUT_BAG_NAME}")
        print(f"  rosbag play {OUTPUT_BAG_NAME}")
    else:
        print("\n✗ 轉換失敗!")
        return 1
    
    return 0


if __name__ == "__main__":
    exit(main())