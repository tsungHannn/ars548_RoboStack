"""
ROS1 BEV視角投影與物件偵測節點
結合多視角影像播放、物件偵測與BEV投影功能
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
from tqdm import tqdm

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
    def __init__(self):
        rospy.init_node('bev_projection_node', anonymous=True)
        
        # 初始化CV橋接器
        self.bridge = CvBridge()
        
        # 載入參數
        self.load_parameters()
        self.save_to_video = True  # 設定為True以儲存影片，False則發布影像
        
        # 初始化發布器
        self.left_pub = rospy.Publisher('/camera/left/image', Image, queue_size=1)
        self.right_pub = rospy.Publisher('/camera/right/image', Image, queue_size=1)
        self.bev_pub = rospy.Publisher('/camera/bev/image', Image, queue_size=1)
        
        # 載入配置檔案和影像
        self.load_config_and_images()
        
        # 初始化物件偵測器
        self.init_object_detector()
        
        if self.save_to_video:
            self.init_video_writer()

        # 控制變數
        self.frame_index = 1
        self.is_running = True
        self.image_lock = Lock()
        
        # 啟動影像處理執行緒
        self.processing_thread = Thread(target=self.process_images)
        self.processing_thread.daemon = True
        self.processing_thread.start()
        
        rospy.loginfo("BEV投影節點已啟動")
    
    def load_parameters(self):
        """載入ROS參數"""
        self.bev_image_path = rospy.get_param('~bev_image_path', '/home/mvclab/workspace/ncsist/ars548_RoboStack/src/deploy/BEV_test/CSIST_layout.png')
        self.left_folder_path = rospy.get_param('~left_folder_path', '/media/mvclab/HDD/ncsist/2025/data/CSIST/left')
        self.right_folder_path = rospy.get_param('~right_folder_path', '/media/mvclab/HDD/ncsist/2025/data/CSIST/right')
        self.json_config_path = rospy.get_param('~json_config_path', '/home/mvclab/workspace/ncsist/ars548_RoboStack/src/deploy/BEV_test/CSIST_layout.json')
        self.fps = rospy.get_param('~fps', 20.0)
        self.detection_confidence = rospy.get_param('~detection_confidence', 0.5)

        self.output_video_path = '/home/mvclab/workspace/ncsist/ars548_RoboStack/src/deploy/BEV_video.mp4'

        
        rospy.loginfo(f"BEV影像路徑: {self.bev_image_path}")
        rospy.loginfo(f"左視角資料夾: {self.left_folder_path}")
        rospy.loginfo(f"右視角資料夾: {self.right_folder_path}")
        rospy.loginfo(f"配置檔案: {self.json_config_path}")
    
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
                # 這裡可以載入預訓練的YOLO模型
                # self.model = torch.hub.load('ultralytics/yolov5', 'yolov5s', pretrained=True)
                # self.model.eval()
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

    def init_video_writer(self):
        """初始化影片寫入器 - 三個影像統一尺寸橫著排列"""
        # 先載入一張影像來取得尺寸
        temp_bev = cv2.imread(self.bev_image_path)
        temp_left_files = glob.glob(os.path.join(self.left_folder_path, "*.jpg")) + glob.glob(os.path.join(self.left_folder_path, "*.png"))
        if temp_left_files:
            temp_left = cv2.imread(temp_left_files[0])
            temp_left = cv2.resize(temp_left, None, fx=0.5, fy=0.5, interpolation=cv2.INTER_LINEAR)

            temp_right_files = glob.glob(os.path.join(self.right_folder_path, "*.jpg")) + glob.glob(os.path.join(self.right_folder_path, "*.png"))
            if temp_right_files:
                temp_right = cv2.imread(temp_right_files[0])
                temp_right = cv2.resize(temp_right, None, fx=0.5, fy=0.5, interpolation=cv2.INTER_LINEAR)

                
                # 儲存各影像的原始尺寸
                self.left_height, self.left_width = temp_left.shape[:2]
                self.right_height, self.right_width = temp_right.shape[:2]
                self.bev_height, self.bev_width = temp_bev.shape[:2]
                
                # 計算統一的目標尺寸 (取最大的寬度和高度)
                self.target_width = min(self.left_width, self.right_width, self.bev_width)
                self.target_height = min(self.left_height, self.right_height, self.bev_height)
                
                # 計算合成影像的尺寸 (三個相同尺寸的影像橫著排列)
                self.combined_width = self.target_width * 3
                self.combined_height = self.target_height
                
                # 初始化影片寫入器
                fourcc = cv2.VideoWriter_fourcc(*'mp4v')
                self.video_writer = cv2.VideoWriter(
                    self.output_video_path, 
                    fourcc, 
                    self.fps, 
                    (self.combined_width, self.combined_height)
                )
                
                rospy.loginfo(f"影片輸出尺寸 (三等分排列): {self.combined_width}x{self.combined_height}")
                rospy.loginfo(f"每個影像統一尺寸: {self.target_width}x{self.target_height}")
                rospy.loginfo(f"原始尺寸 - Left: {self.left_width}x{self.left_height}, Right: {self.right_width}x{self.right_height}, BEV: {self.bev_width}x{self.bev_height}")
    
    def detect_objects(self, image):
        """物件偵測函數"""
        if self.use_yolo and YOLO_AVAILABLE:
            try:
                results = self.model(image, 
                            conf=self.detection_confidence, 
                            device='cuda' if torch.cuda.is_available() else 'cpu',
                            verbose=False,
                            show=False,
                            save=False,
                            classes=[1,2,3,4,5,6,7,8])
            
                detections = []
                
                # 檢查是否有偵測結果
                if len(results) == 0 or len(results[0].boxes) == 0:
                    return detections
                
                # 取得第一個結果（通常只有一個）
                result = results[0]
                boxes = result.boxes.xywh.cpu()  # 中心點座標格式 (x_center, y_center, width, height)
                confidences = result.boxes.conf.cpu()  # 信心度
                class_ids = result.boxes.cls.cpu().int() if result.boxes.cls is not None else None
                
                # 處理每個偵測結果
                for i, box in enumerate(boxes):
                    x_center, y_center, width, height = box
                    confidence = confidences[i]
                    cls_id = class_ids[i].item() if class_ids is not None else -1
                    
                    # 轉換為左上角和右下角座標
                    x1 = int(x_center - width / 2)
                    y1 = int(y_center - height / 2)
                    x2 = int(x_center + width / 2)
                    y2 = int(y_center + height / 2)
                    
                    # 可以根據需要過濾特定類別
                    # 例如：只保留特定類別的物件
                    # valid_classes = [0, 1, 2, 3, 4, 5, 6, 7]  # COCO類別ID
                    # if cls_id not in valid_classes:
                    #     continue
                    
                    # 將中心點座標加入偵測結果
                    detections.append([int(x_center), int(y_center)])
                    
                    # 如果需要更多資訊，可以改為字典格式
                    # detections.append({
                    #     'center': [int(x_center), int(y_center)],
                    #     'bbox': [x1, y1, x2, y2],
                    #     'confidence': float(confidence),
                    #     'class_id': cls_id,
                    #     'class_name': self.model.names[cls_id] if cls_id >= 0 else 'unknown'
                    # })
                    # ===========================





                
                return detections
            except Exception as e:
                rospy.logwarn(f"YOLO偵測失敗: {str(e)}")
                return self.simulate_detection(image)
        else:
            return self.simulate_detection(image)
    
    def simulate_detection(self, image):
        """模擬物件偵測 (用於測試)"""
        h, w = image.shape[:2]
        # 模擬一些隨機的車輛偵測結果
        detections = []
        for i in range(np.random.randint(1, 4)):  # 1-3個偵測結果
            x = np.random.randint(w//4, 3*w//4)
            y = np.random.randint(h//2, h)
            conf = np.random.uniform(0.6, 0.95)
            detections.append([x, y, conf])
        
        return detections
    
    def transform_rsv2bev(self, pt, homography, affine):
        """將RSV座標轉換為BEV座標"""
        # 轉換為齊次座標
        pt = np.array([pt[0], pt[1], 1.0])
        
        # 應用單應性變換
        pt = homography @ pt
        
        # 正規化獲得像素座標
        pt[0] = pt[0] / pt[2]
        pt[1] = pt[1] / pt[2]
        pt[2] = 1.0
        
        # 應用仿射變換
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
            # 繪製偵測點
            cv2.circle(result_image, (x, y), 10, color, -1)
            
            # # 顯示信心度
            # text = f"Car {conf:.2f}"
            # cv2.putText(result_image, text, (x + 10, y - 10), 
            #            cv2.FONT_HERSHEY_SIMPLEX, 0.6, color, 2)
        
        return result_image
    


    def combine_images_for_video(self, left_img, right_img, bev_img):
        """將三個影像合成為一個影像用於影片輸出 - 統一尺寸橫著排列"""
        # 建立空白畫布
        combined = np.zeros((self.combined_height, self.combined_width, 3), dtype=np.uint8)
        
        # 將所有影像調整到統一尺寸
        left_resized = cv2.resize(left_img, (self.target_width, self.target_height))
        right_resized = cv2.resize(right_img, (self.target_width, self.target_height))
        bev_resized = cv2.resize(bev_img, (self.target_width, self.target_height))
        
        # 平均分配畫面：左影像 | 右影像 | BEV影像
        # 左影像 (第一個區塊)
        combined[0:self.target_height, 0:self.target_width] = left_resized
        
        # 右影像 (第二個區塊)
        combined[0:self.target_height, self.target_width:self.target_width*2] = right_resized
        
        # BEV影像 (第三個區塊)
        combined[0:self.target_height, self.target_width*2:self.target_width*3] = bev_resized
        
        return combined
    
    def save_frame_to_video(self, left_img, right_img, bev_img):
        """將影像幀儲存到影片"""
        if hasattr(self, 'video_writer') and self.video_writer is not None:
            combined_frame = self.combine_images_for_video(left_img, right_img, bev_img)
            self.video_writer.write(combined_frame)



    def process_images(self):
        """主要影像處理迴圈"""
        # rate = rospy.Rate(self.fps)
        total_frames = min(len(self.left_images), len(self.right_images))
        if self.save_to_video:
            pbar = tqdm(total=total_frames, desc="Processing Images", unit="frame")
            processed_frames = 0

        while not rospy.is_shutdown() and self.is_running:
            # try:
            time_begin = rospy.Time.now()

            # 計算當前影像索引
            left_idx = self.frame_index % len(self.left_images)
            right_idx = self.frame_index % len(self.right_images)
            
            # 載入當前影像
            left_img = cv2.imread(self.left_images[left_idx])
            left_img = cv2.resize(left_img, None, fx=0.5, fy=0.5, interpolation=cv2.INTER_LINEAR)
            right_img = cv2.imread(self.right_images[right_idx])
            right_img = cv2.resize(right_img, None, fx=0.5, fy=0.5, interpolation=cv2.INTER_LINEAR)


            
            if left_img is None or right_img is None:
                rospy.logwarn(f"無法載入影像，跳過frame {self.frame_index}")
                self.frame_index += 1
                continue
            
            # 進行物件偵測
            # 計算時間
            left_detections = self.detect_objects(left_img)
            right_detections = self.detect_objects(right_img)


            # 在原始影像上繪製偵測結果
            left_with_detection = self.draw_detections(left_img, left_detections, (0, 255, 0))
            right_with_detection = self.draw_detections(right_img, right_detections, (255, 0, 0))
            
            # 建立BEV影像副本用於繪製
            bev_with_projections = self.bev_image.copy()
            
            # 將左視角偵測結果投影到BEV
            for detection in left_detections:
                bev_pt = self.transform_rsv2bev(detection, self.homographys[0], self.affines[0])
                if 0 <= bev_pt[0] < bev_with_projections.shape[1] and 0 <= bev_pt[1] < bev_with_projections.shape[0]:
                    cv2.circle(bev_with_projections, bev_pt, 10, (0, 255, 0), -1)
                    # cv2.putText(bev_with_projections, f"L{detection[2]:.2f}", 
                    #             (bev_pt[0] + 15, bev_pt[1] - 15), 
                    #             cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 255, 0), 2)
            
            # 將右視角偵測結果投影到BEV
            for detection in right_detections:
                bev_pt = self.transform_rsv2bev(detection, self.homographys[1], self.affines[1])
                if 0 <= bev_pt[0] < bev_with_projections.shape[1] and 0 <= bev_pt[1] < bev_with_projections.shape[0]:
                    cv2.circle(bev_with_projections, bev_pt, 10, (255, 0, 0), -1)
                    # cv2.putText(bev_with_projections, f"R{detection[2]:.2f}", 
                    #             (bev_pt[0] + 15, bev_pt[1] + 30), 
                    #             cv2.FONT_HERSHEY_SIMPLEX, 0.6, (255, 0, 0), 2)
            
            time_end = rospy.Time.now()

            # 在左上角寫入影像編號
            cv2.putText(left_with_detection, f"Frame: {left_idx}", 
                        (30, 80), cv2.FONT_HERSHEY_SIMPLEX, 2, (0, 0, 255), 5)
            cv2.putText(right_with_detection, f"Frame: {right_idx}", 
                        (30, 80), cv2.FONT_HERSHEY_SIMPLEX, 2, (0, 0, 255), 5)
            
            

            # 根據模式輸出
            if self.save_to_video:
                self.save_frame_to_video(left_with_detection, right_with_detection, bev_with_projections)
                processed_frames += 1

                # if processed_frames % 50 == 0:  # 每50幀顯示一次進度
                #     progress = (processed_frames / total_frames) * 100
                    # rospy.loginfo(f"影片處理進度: {processed_frames}/{total_frames} ({progress:.1f}%)")
                
                pbar.update(1)
                # 如果處理完所有影像就結束
                if processed_frames >= total_frames:
                    rospy.loginfo("所有影像處理完成，正在結束...")
                    pbar.close()
                    # 關閉影片寫入器
                    self.video_writer.release()
                    rospy.loginfo(f"影片已儲存至: {self.output_video_path}")
                    self.is_running = False
                    break
                
            else:
                self.publish_images(left_with_detection, right_with_detection, bev_with_projections)


            
            # 更新影像索引
            self.frame_index += 1
                


                # rate.sleep()
                
            # except Exception as e:
            #     rospy.logerr(f"影像處理錯誤: {str(e)}")
            #     rate.sleep()
    
    def publish_images(self, left_img, right_img, bev_img):
        """發布影像到ROS topic"""
        try:
            timestamp = rospy.Time.now()
            
            # 建立Header
            header = Header()
            header.stamp = timestamp
            header.frame_id = "camera"
            
            # 轉換並發布左視角影像
            left_msg = self.bridge.cv2_to_imgmsg(left_img, "bgr8")
            left_msg.header = header
            self.left_pub.publish(left_msg)
            
            # 轉換並發布右視角影像
            right_msg = self.bridge.cv2_to_imgmsg(right_img, "bgr8")
            right_msg.header = header
            self.right_pub.publish(right_msg)
            
            # 轉換並發布BEV影像
            bev_msg = self.bridge.cv2_to_imgmsg(bev_img, "bgr8")
            bev_msg.header = header
            self.bev_pub.publish(bev_msg)
            
        except Exception as e:
            rospy.logerr(f"影像發布錯誤: {str(e)}")
    
    def shutdown(self):
        """關閉節點"""
        rospy.loginfo("正在關閉BEV投影節點...")
        self.is_running = False

        if hasattr(self, 'processing_thread'):
            self.processing_thread.join(timeout=2.0)
        rospy.loginfo("BEV投影節點已關閉")

def main():
    try:
        node = BEVProjectionNode()
        rospy.on_shutdown(node.shutdown)
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
    except Exception as e:
        rospy.logerr(f"節點啟動失敗: {str(e)}")

if __name__ == '__main__':
    main()