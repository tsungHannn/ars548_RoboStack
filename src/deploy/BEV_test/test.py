"""
ROS1 BEV視角投影與物件偵測節點
結合多視角影像播放、物件偵測與BEV投影功能
支援即時ROS發布或影片輸出模式
"""

import rospy
import cv2
import json
import numpy as np
import os
import glob
from threading import Thread, Lock
from ultralytics import YOLO
from natsort import natsorted
import argparse

# ROS相關函式庫
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
from std_msgs.msg import Header

# YOLO物件偵測 (可根據需要調整為其他偵測器)
try:
    import torch
    YOLO_AVAILABLE = True
except ImportError:
    YOLO_AVAILABLE = False
    rospy.logwarn("PyTorch未安裝，將使用模擬偵測結果")

class BEVProjectionNode:
    def __init__(self, save_to_video=False, output_video_path="output_bev.mp4"):
        rospy.init_node('bev_projection_node', anonymous=True)
        
        # 模式設定
        self.save_to_video = save_to_video
        self.output_video_path = output_video_path
        
        # 初始化CV橋接器
        self.bridge = CvBridge()
        
        # 載入參數
        self.load_parameters()
        
        # 根據模式初始化發布器或影片寫入器
        if not self.save_to_video:
            self.init_publishers()
        else:
            self.init_video_writer()
        
        # 載入配置檔案和影像
        self.load_config_and_images()
        
        # 初始化物件偵測器
        self.init_object_detector()
        
        # 控制變數
        self.frame_index = 1
        self.is_running = True
        self.image_lock = Lock()
        
        # 啟動影像處理執行緒
        self.processing_thread = Thread(target=self.process_images)
        self.processing_thread.daemon = True
        self.processing_thread.start()
        
        if self.save_to_video:
            rospy.loginfo(f"BEV投影節點已啟動 - 影片輸出模式，輸出路徑: {self.output_video_path}")
        else:
            rospy.loginfo("BEV投影節點已啟動 - ROS即時發布模式")
    
    def load_parameters(self):
        """載入ROS參數"""
        self.bev_image_path = rospy.get_param('~bev_image_path', '/home/mvclab/workspace/ncsist/ars548_RoboStack/src/deploy/BEV_test/CSIST_layout.png')
        self.left_folder_path = rospy.get_param('~left_folder_path', '/media/mvclab/HDD/ncsist/2025/data/CSIST/left')
        self.right_folder_path = rospy.get_param('~right_folder_path', '/media/mvclab/HDD/ncsist/2025/data/CSIST/right')
        self.json_config_path = rospy.get_param('~json_config_path', '/home/mvclab/workspace/ncsist/ars548_RoboStack/src/deploy/BEV_test/CSIST_layout.json')
        self.fps = rospy.get_param('~fps', 20.0)
        self.detection_confidence = rospy.get_param('~detection_confidence', 0.5)
        
        rospy.loginfo(f"BEV影像路徑: {self.bev_image_path}")
        rospy.loginfo(f"左視角資料夾: {self.left_folder_path}")
        rospy.loginfo(f"右視角資料夾: {self.right_folder_path}")
        rospy.loginfo(f"配置檔案: {self.json_config_path}")
    
    def init_publishers(self):
        """初始化ROS發布器"""
        self.left_pub = rospy.Publisher('/camera/left/image', Image, queue_size=1)
        self.right_pub = rospy.Publisher('/camera/right/image', Image, queue_size=1)
        self.bev_pub = rospy.Publisher('/camera/bev/image', Image, queue_size=1)
    
    def init_video_writer(self):
        """初始化影片寫入器"""
        # 先載入一張影像來取得尺寸
        temp_bev = cv2.imread(self.bev_image_path)
        temp_left_files = glob.glob(os.path.join(self.left_folder_path, "*.jpg")) + glob.glob(os.path.join(self.left_folder_path, "*.png"))
        if temp_left_files:
            temp_left = cv2.imread(temp_left_files[0])
            temp_right_files = glob.glob(os.path.join(self.right_folder_path, "*.jpg")) + glob.glob(os.path.join(self.right_folder_path, "*.png"))
            if temp_right_files:
                temp_right = cv2.imread(temp_right_files[0])
                
                # 計算合成影像的尺寸 (左右並排，BEV在下方)
                self.combined_width = max(temp_left.shape[1] + temp_right.shape[1], temp_bev.shape[1])
                self.combined_height = temp_left.shape[0] + temp_bev.shape[0]
                
                # 儲存各影像的尺寸用於後續處理
                self.left_height, self.left_width = temp_left.shape[:2]
                self.right_height, self.right_width = temp_right.shape[:2]
                self.bev_height, self.bev_width = temp_bev.shape[:2]
                
                # 初始化影片寫入器
                fourcc = cv2.VideoWriter_fourcc(*'mp4v')
                self.video_writer = cv2.VideoWriter(
                    self.output_video_path, 
                    fourcc, 
                    self.fps, 
                    (self.combined_width, self.combined_height)
                )
                
                rospy.loginfo(f"影片輸出尺寸: {self.combined_width}x{self.combined_height}")
    
    def load_config_and_images(self):
        """載入配置檔案和影像"""
        try:
            # 載入BEV影像
            self.bev_image = cv2.imread(self.bev_image_path)
            if self.bev_image is None:
                raise ValueError(f"無法載入BEV影像: {self.bev_image_path}")
            
            # 載入JSON配置檔案
            with open(self.json_config_path, 'r') as file:
                json_data = json.load(file)
                self.homographys = np.array(json_data["homographys"])
                self.affines = np.array(json_data["affines"])
            
            # 載入左右視角影像檔案列表
            self.left_images = natsorted(glob.glob(os.path.join(self.left_folder_path, "*.jpg")) + 
                                    glob.glob(os.path.join(self.left_folder_path, "*.png")))
            self.right_images = natsorted(glob.glob(os.path.join(self.right_folder_path, "*.jpg")) + 
                                     glob.glob(os.path.join(self.right_folder_path, "*.png")))
            
            if len(self.left_images) == 0 or len(self.right_images) == 0:
                raise ValueError("左視角或右視角資料夾中沒有找到影像檔案")
            
            rospy.loginfo(f"載入了 {len(self.left_images)} 張左視角影像")
            rospy.loginfo(f"載入了 {len(self.right_images)} 張右視角影像")
            
        except Exception as e:
            rospy.logerr(f"載入配置失敗: {str(e)}")
            rospy.signal_shutdown("配置載入失敗")
    
    def init_object_detector(self):
        """初始化物件偵測器"""
        if YOLO_AVAILABLE:
            try:
                self.model = YOLO("/home/mvclab/workspace/ncsist/ars548_RoboStack/src/deploy/yolo11x.pt")
                if torch.cuda.is_available():
                    self.model.to(torch.device('cuda'))
                rospy.loginfo("物件偵測器初始化完成 (使用YOLO)")
                self.use_yolo = True
            except Exception as e:
                rospy.logwarn(f"YOLO載入失敗: {str(e)}，將使用模擬偵測")
                self.use_yolo = False
        else:
            self.use_yolo = False
            rospy.loginfo("使用模擬物件偵測")
    
    def detect_objects(self, image):
        """物件偵測函數"""
        if self.use_yolo and YOLO_AVAILABLE:
            try:
                results = self.model.track(image, show=False, persist=True, tracker='bytetrack.yaml', \
                    verbose=False, classes=[1,2,3,4,5,6,7,8], conf=0.08, imgsz=768, half=True)
                
                detections = []

                if not len(results[0].boxes.xywh.cpu()):
                    return detections
                boxes = results[0].boxes.xywh.cpu()
                track_ids = results[0].boxes.id
                class_ids = results[0].boxes.cls

                if track_ids is None:
                    track_ids = []
                else:
                    track_ids = results[0].boxes.id.int().tolist()

                if class_ids is not None:
                    class_ids = class_ids.int().tolist()
                else:
                    class_ids = [-1] * len(boxes)

                for box, track_id, cls_id in zip(boxes, track_ids, class_ids):
                    x, y, w, h = box
                    detections.append([int(x), int(y)])
                
                return detections
            except Exception as e:
                rospy.logwarn(f"YOLO偵測失敗: {str(e)}")
                return self.simulate_detection(image)
        else:
            return self.simulate_detection(image)
    
    def simulate_detection(self, image):
        """模擬物件偵測 (用於測試)"""
        h, w = image.shape[:2]
        detections = []
        for i in range(np.random.randint(1, 4)):
            x = np.random.randint(w//4, 3*w//4)
            y = np.random.randint(h//2, h)
            conf = np.random.uniform(0.6, 0.95)
            detections.append([x, y, conf])
        
        return detections
    
    def transform_rsv2bev(self, pt, homography, affine):
        """將RSV座標轉換為BEV座標"""
        pt = np.array([pt[0], pt[1], 1.0])
        pt = homography @ pt
        pt[0] = pt[0] / pt[2]
        pt[1] = pt[1] / pt[2]
        pt[2] = 1.0
        pt = affine @ pt
        x = int(pt[0])
        y = int(pt[1])
        
        return [x, y]
    
    def draw_detections(self, image, detections, color=(0, 255, 0)):
        """在影像上繪製偵測結果"""
        result_image = image.copy()
        
        if len(detections) == 0:
            return result_image
        for i, (x, y) in enumerate(detections):
            cv2.circle(result_image, (x, y), 8, color, -1)
        
        return result_image
    
    def combine_images_for_video(self, left_img, right_img, bev_img):
        """將三個影像合成為一個影像用於影片輸出"""
        # 建立空白畫布
        combined = np.zeros((self.combined_height, self.combined_width, 3), dtype=np.uint8)
        
        # 放置左視角影像 (左上)
        combined[0:self.left_height, 0:self.left_width] = left_img
        
        # 放置右視角影像 (右上)
        combined[0:self.right_height, self.left_width:self.left_width+self.right_width] = right_img
        
        # 放置BEV影像 (下方中央)
        bev_start_x = (self.combined_width - self.bev_width) // 2
        combined[self.left_height:self.left_height+self.bev_height, 
                bev_start_x:bev_start_x+self.bev_width] = bev_img
        
        return combined
    
    def save_frame_to_video(self, left_img, right_img, bev_img):
        """將影像幀儲存到影片"""
        if hasattr(self, 'video_writer') and self.video_writer is not None:
            combined_frame = self.combine_images_for_video(left_img, right_img, bev_img)
            self.video_writer.write(combined_frame)
    
    def process_images(self):
        """主要影像處理迴圈"""
        total_frames = min(len(self.left_images), len(self.right_images))
        
        # 影片模式不需要rate control，即時模式才需要
        if not self.save_to_video:
            rate = rospy.Rate(self.fps)
        
        processed_frames = 0
        
        while not rospy.is_shutdown() and self.is_running:
            time_begin = rospy.Time.now()

            # 計算當前影像索引
            left_idx = self.frame_index % len(self.left_images)
            right_idx = self.frame_index % len(self.right_images)
            
            # 載入當前影像
            time_read_begin = rospy.Time.now()
            left_img = cv2.imread(self.left_images[left_idx])
            right_img = cv2.imread(self.right_images[right_idx])
            time_read_end = rospy.Time.now()

            if not self.save_to_video:
                print("read fps:", 1.0/(time_read_end-time_read_begin).to_sec())
            
            if left_img is None or right_img is None:
                rospy.logwarn(f"無法載入影像，跳過frame {self.frame_index}")
                self.frame_index += 1
                continue
            
            # 進行物件偵測
            time_det_begin = rospy.Time.now()
            left_detections = self.detect_objects(left_img)
            right_detections = self.detect_objects(right_img)
            time_det_end = rospy.Time.now()

            # 在原始影像上繪製偵測結果
            left_with_detection = self.draw_detections(left_img, left_detections, (0, 255, 0))
            right_with_detection = self.draw_detections(right_img, right_detections, (255, 0, 0))
            
            # 建立BEV影像副本用於繪製
            bev_with_projections = self.bev_image.copy()
            
            # 將左視角偵測結果投影到BEV
            for detection in left_detections:
                bev_pt = self.transform_rsv2bev(detection[:2], self.homographys[0], self.affines[0])
                if 0 <= bev_pt[0] < bev_with_projections.shape[1] and 0 <= bev_pt[1] < bev_with_projections.shape[0]:
                    cv2.circle(bev_with_projections, bev_pt, 10, (0, 255, 0), -1)
            
            # 將右視角偵測結果投影到BEV
            for detection in right_detections:
                bev_pt = self.transform_rsv2bev(detection[:2], self.homographys[1], self.affines[1])
                if 0 <= bev_pt[0] < bev_with_projections.shape[1] and 0 <= bev_pt[1] < bev_with_projections.shape[0]:
                    cv2.circle(bev_with_projections, bev_pt, 10, (255, 0, 0), -1)
            
            time_end = rospy.Time.now()

            # 添加資訊文字
            det_fps = 1.0/(time_det_end-time_det_begin).to_sec()
            all_fps = 1.0/(time_end-time_begin).to_sec()
            
            cv2.putText(left_with_detection, f"Frame: {left_idx}, DET_FPS: {det_fps:.1f}", 
                        (30, 80), cv2.FONT_HERSHEY_SIMPLEX, 3, (0, 0, 255), 5)
            cv2.putText(right_with_detection, f"Frame: {right_idx}, ALL_FPS: {all_fps:.1f}", 
                        (30, 80), cv2.FONT_HERSHEY_SIMPLEX, 3, (0, 0, 255), 5)
            
            # 根據模式輸出
            if self.save_to_video:
                self.save_frame_to_video(left_with_detection, right_with_detection, bev_with_projections)
                processed_frames += 1
                if processed_frames % 50 == 0:  # 每50幀顯示一次進度
                    progress = (processed_frames / total_frames) * 100
                    rospy.loginfo(f"影片處理進度: {processed_frames}/{total_frames} ({progress:.1f}%)")
                
                # 如果處理完所有影像就結束
                if processed_frames >= total_frames:
                    rospy.loginfo("所有影像處理完成，正在結束...")
                    break
            else:
                self.publish_images(left_with_detection, right_with_detection, bev_with_projections)
                rate.sleep()
            
            # 更新影像索引
            self.frame_index += 1
    
    def publish_images(self, left_img, right_img, bev_img):
        """發布影像到ROS topic"""
        try:
            timestamp = rospy.Time.now()
            
            header = Header()
            header.stamp = timestamp
            header.frame_id = "camera"
            
            left_msg = self.bridge.cv2_to_imgmsg(left_img, "bgr8")
            left_msg.header = header
            self.left_pub.publish(left_msg)
            
            right_msg = self.bridge.cv2_to_imgmsg(right_img, "bgr8")
            right_msg.header = header
            self.right_pub.publish(right_msg)
            
            bev_msg = self.bridge.cv2_to_imgmsg(bev_img, "bgr8")
            bev_msg.header = header
            self.bev_pub.publish(bev_msg)
            
        except Exception as e:
            rospy.logerr(f"影像發布錯誤: {str(e)}")
    
    def shutdown(self):
        """關閉節點"""
        rospy.loginfo("正在關閉BEV投影節點...")
        self.is_running = False
        
        # 關閉影片寫入器
        if hasattr(self, 'video_writer') and self.video_writer is not None:
            self.video_writer.release()
            rospy.loginfo(f"影片已儲存至: {self.output_video_path}")
        
        if hasattr(self, 'processing_thread'):
            self.processing_thread.join(timeout=5.0)
        rospy.loginfo("BEV投影節點已關閉")

def parse_arguments():
    """解析命令列參數"""
    parser = argparse.ArgumentParser(description='BEV投影節點 - 支援即時發布或影片輸出')
    parser.add_argument('--mode', choices=['realtime', 'video'], default='realtime',
                        help='執行模式: realtime (即時ROS發布) 或 video (影片輸出)')
    parser.add_argument('--output', type=str, default='output_bev.mp4',
                        help='影片輸出檔案路徑 (只在video模式下使用)')
    return parser.parse_args()

def main():
    try:
        # 解析命令列參數
        args = parse_arguments()
        
        # 詢問使用者模式選擇
        if len(rospy.myargv()) <= 1:  # 如果沒有命令列參數
            print("\n請選擇執行模式:")
            print("1. 即時模式 (ROS topic發布)")
            print("2. 影片輸出模式")
            
            while True:
                choice = input("請輸入選擇 (1 或 2): ").strip()
                if choice == '1':
                    save_to_video = False
                    output_path = None
                    break
                elif choice == '2':
                    save_to_video = True
                    output_path = input("請輸入影片輸出路徑 (預設: output_bev.mp4): ").strip()
                    if not output_path:
                        output_path = "output_bev.mp4"
                    break
                else:
                    print("無效選擇，請重新輸入")
        else:
            # 使用命令列參數
            save_to_video = (args.mode == 'video')
            output_path = args.output if save_to_video else None
        
        # 建立節點
        if save_to_video:
            node = BEVProjectionNode(save_to_video=True, output_video_path=output_path)
            print(f"\n影片輸出模式已啟動，輸出檔案: {output_path}")
            print("處理過程中請耐心等候...")
        else:
            node = BEVProjectionNode(save_to_video=False)
            print("\n即時模式已啟動，正在發布ROS topics...")
        
        rospy.on_shutdown(node.shutdown)
        rospy.spin()
        
    except rospy.ROSInterruptException:
        pass
    except KeyboardInterrupt:
        print("\n使用者中斷執行")
    except Exception as e:
        rospy.logerr(f"節點啟動失敗: {str(e)}")

if __name__ == '__main__':
    main()