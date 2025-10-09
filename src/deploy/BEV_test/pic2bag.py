#!/usr/bin/env python
# -*- coding: utf-8 -*-

import rosbag
import rospy
from sensor_msgs.msg import CompressedImage
import cv2
import os
from pathlib import Path
import time
from tqdm import tqdm

def images_to_rosbag(base_folder, output_bag_file, fps=30, quality=90):
    """
    將不同資料夾中的圖片轉換為ROS bag檔案(壓縮格式)
    
    參數:
        base_folder: 包含多個圖片資料夾的主資料夾路徑
        output_bag_file: 輸出的bag檔案名稱
        fps: 影片幀率(預設30 FPS)
        quality: JPEG壓縮品質(1-100,預設90)
    """
    
    # 支援的圖片格式
    image_extensions = ['.jpg', '.jpeg', '.png', '.bmp', '.tiff']
    
    # 設定起始時間(使用當前Unix時間戳記)
    start_time = rospy.Time.from_sec(time.time())
    
    # 先掃描所有資料夾和圖片，計算總數
    folder_data = []
    total_images = 0
    
    for folder_name in sorted(os.listdir(base_folder)):
        folder_path = os.path.join(base_folder, folder_name)
        
        # 確認是資料夾
        if not os.path.isdir(folder_path):
            continue
        
        # 獲取資料夾中的所有圖片
        image_files = []
        for file in os.listdir(folder_path):
            file_path = os.path.join(folder_path, file)
            if os.path.isfile(file_path) and Path(file).suffix.lower() in image_extensions:
                image_files.append(file_path)
        
        # 排序圖片檔案
        image_files.sort()
        
        if len(image_files) > 0:
            topic_name = f"/camera/{folder_name}/image_raw/compressed"
            folder_data.append({
                'name': folder_name,
                'path': folder_path,
                'topic': topic_name,
                'images': image_files
            })
            total_images += len(image_files)
    
    print(f"\n總共發現 {len(folder_data)} 個資料夾，{total_images} 張圖片")
    print(f"開始轉換...\n")
    
    # 開啟rosbag進行寫入
    with rosbag.Bag(output_bag_file, 'w') as bag:
        
        # 使用總進度條
        with tqdm(total=total_images, desc="總體進度", unit="張") as pbar:
            
            # 遍歷每個資料夾
            for folder_info in folder_data:
                folder_name = folder_info['name']
                topic_name = folder_info['topic']
                image_files = folder_info['images']
                
                # 計算時間間隔
                time_interval = rospy.Duration(1.0 / fps)
                current_time = start_time
                
                # 使用子進度條顯示當前資料夾
                pbar.set_description(f"處理 {folder_name}")
                
                # 讀取每張圖片並寫入bag
                for image_path in image_files:
                    try:
                        # 讀取圖片
                        cv_image = cv2.imread(image_path)
                        
                        if cv_image is None:
                            tqdm.write(f"  警告: 無法讀取圖片 {image_path}")
                            pbar.update(1)
                            continue
                        
                        # 將圖片編碼為JPEG格式
                        encode_param = [int(cv2.IMWRITE_JPEG_QUALITY), quality]
                        result, encoded_image = cv2.imencode('.jpg', cv_image, encode_param)
                        
                        if not result:
                            tqdm.write(f"  警告: 無法編碼圖片 {image_path}")
                            pbar.update(1)
                            continue
                        
                        # 創建CompressedImage訊息
                        compressed_image = CompressedImage()
                        compressed_image.header.stamp = current_time
                        compressed_image.header.frame_id = folder_name
                        compressed_image.format = "jpeg"
                        compressed_image.data = encoded_image.tobytes()
                        
                        # 寫入bag
                        bag.write(topic_name, compressed_image, current_time)
                        
                        # 更新時間
                        current_time += time_interval
                        
                        # 更新進度條
                        pbar.update(1)
                    
                    except Exception as e:
                        tqdm.write(f"  錯誤: 處理圖片 {image_path} 時發生錯誤: {str(e)}")
                        pbar.update(1)
    
    print(f"\n✓ 所有圖片已成功寫入 {output_bag_file}")
    print(f"✓ 總計處理 {total_images} 張圖片")


def main():
    # 使用範例
    # 資料夾結構範例:
    # base_folder/
    #   ├── camera_front/
    #   │   ├── img_001.jpg
    #   │   ├── img_002.jpg
    #   │   └── ...
    #   ├── camera_left/
    #   │   ├── img_001.jpg
    #   │   └── ...
    #   └── camera_right/
    #       ├── img_001.jpg
    #       └── ...
    
    base_folder = "/media/mvclab/HDD/ncsist/2025/data/CSIST/real"  # 修改為你的主資料夾路徑
    output_bag = "output.bag"  # 輸出的bag檔案名稱
    fps = 20  # 設定幀率
    quality = 90  # JPEG壓縮品質(1-100)
    
    # 檢查資料夾是否存在
    if not os.path.exists(base_folder):
        print(f"錯誤: 資料夾 {base_folder} 不存在")
        return
    
    # 執行轉換
    images_to_rosbag(base_folder, output_bag, fps, quality)


if __name__ == "__main__":
    main()