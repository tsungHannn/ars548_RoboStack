import rospy
from sensor_msgs.msg import Image
from std_msgs.msg import Float32MultiArray, Int32MultiArray
from cv_bridge import CvBridge
import cv2
import numpy as np
import json
import message_filters

from utils import json_to_object, yaml_to_object



class_names = { 0: 'object',
                1: 'bus',
                2: 'car',
                3: 'motorcycle',
                4: 'truck'}




class BEVIntegrationNode:
    """整合多個 RSU 的偵測結果到 BEV 視角"""
    
    def __init__(self, config1_path, config2_path):
        rospy.init_node('bev_integration_node', anonymous=True)
        
        self.config1 = yaml_to_object(config1_path)
        self.config2 = yaml_to_object(config2_path)
        self.scale_factor = 0.5 # 分項一本來有先做resize 0.5，所以這邊也要0.5，不然偵測結果會炸掉

        self.bridge = CvBridge()
        
        # 載入參數
        self.bev_image_path = self.config1.bev_image_path
        self.json_config_path = self.config1.bev_image_path.replace("png", "json")
        
        # 載入 BEV 影像和轉換矩陣
        self.bev_image = cv2.imread(self.bev_image_path)
        with open(self.json_config_path, 'r') as f:
            json_data = json.load(f)
            self.homographys = np.array(json_data["homographys"])
            self.affines = np.array(json_data["affines"])
        


        # # 計算BEV重疊區域
        # self.overlap_mask = self.compute_overlap_region()

        # self.overlay = np.zeros_like(self.bev_image)
        # # 重疊區域顯示為黃色
        # self.overlay[self.overlap_mask > 0] = [0, 255, 255]



        # 儲存每個 RSU 的最新偵測結果
        self.rsu1_detections = []
        self.rsu2_detections = []
        
        # 訂閱兩個 RSU 的偵測結果 (從 TrafficMonitor 發布)
        # rospy.Subscriber(self.config1.detection_result_topic, Float32MultiArray, self.rsu1_callback)
        self.sub_boxes1 = message_filters.Subscriber(self.config1.detection_prefix + '/boxes', Float32MultiArray, queue_size=1)
        self.sub_ids1 = message_filters.Subscriber(self.config1.detection_prefix + '/track_ids', Int32MultiArray, queue_size=1)
        self.sub_class_ids1 = message_filters.Subscriber(self.config1.detection_prefix + '/class_ids', Int32MultiArray, queue_size=1)
        self.sub_points_2d1 = message_filters.Subscriber(self.config1.detection_prefix + '/points_2d', Float32MultiArray, queue_size=1)
        self.sync1 = message_filters.ApproximateTimeSynchronizer([self.sub_boxes1, self.sub_ids1, self.sub_class_ids1, self.sub_points_2d1] , queue_size=1, slop=0.1, allow_headerless=True)
        self.sync1.registerCallback(self.rsu1_callback)


        self.sub_boxes2 = message_filters.Subscriber(self.config2.detection_prefix + '/boxes', Float32MultiArray, queue_size=1)
        self.sub_ids2 = message_filters.Subscriber(self.config2.detection_prefix + '/track_ids', Int32MultiArray, queue_size=1)
        self.sub_class_ids2 = message_filters.Subscriber(self.config2.detection_prefix + '/class_ids', Int32MultiArray, queue_size=1)
        self.sub_points_2d2 = message_filters.Subscriber(self.config2.detection_prefix + '/points_2d', Float32MultiArray, queue_size=1)
        self.sync2 = message_filters.ApproximateTimeSynchronizer([self.sub_boxes2, self.sub_ids2, self.sub_class_ids2, self.sub_points_2d2] , queue_size=1, slop=0.1, allow_headerless=True)
        self.sync2.registerCallback(self.rsu2_callback)


        # rospy.Subscriber(self.config1.detection_result_topic, Float32MultiArray, self.rsu2_callback)
        
        # 發布 BEV 結果
        self.bev_pub = rospy.Publisher('/bev_combined', Image, queue_size=1)
        
        # 定時更新 BEV
        rospy.Timer(rospy.Duration(1.0/20.0), self.update_bev)
        
        rospy.loginfo("BEV整合節點已啟動")
    
    def rsu1_callback(self, msg_boxes, msg_ids, msg_class_ids, msg_points_2d):
        """接收 RSU1 的偵測結果"""
        # 這裡假設偵測結果已經包含在影像中
        # 實際應用中可能需要自定義訊息格式來傳遞偵測座標
        
        boxes = np.array(msg_boxes.data).reshape(-1, 4).tolist() if len(msg_boxes.data) > 0 else []
        ids = np.array(msg_ids.data).tolist() if len(msg_ids.data) > 0 else []
        class_ids = np.array(msg_class_ids.data).tolist() if len(msg_class_ids.data) > 0 else []
        points_2d = np.array(msg_points_2d.data).reshape(-1, 2).tolist() if len(msg_points_2d.data) > 0 else []

        self.rsu1_detections = [boxes, ids, class_ids, points_2d]
    
    def rsu2_callback(self, msg_boxes, msg_ids, msg_class_ids, msg_points_2d):
        """接收 RSU2 的偵測結果"""
        boxes = np.array(msg_boxes.data).reshape(-1, 4).tolist() if len(msg_boxes.data) > 0 else []
        ids = np.array(msg_ids.data).tolist() if len(msg_ids.data) > 0 else []
        class_ids = np.array(msg_class_ids.data).tolist() if len(msg_class_ids.data) > 0 else []
        points_2d = np.array(msg_points_2d.data).reshape(-1, 2).tolist() if len(msg_points_2d.data) > 0 else []
        # points_3d = np.array(msg_points_3d.data).reshape(-1, 3).tolist() if len(msg_points_3d.data) > 0 else []

        self.rsu2_detections = [boxes, ids, class_ids, points_2d]
    
    def compute_overlap_region(self):
        """通過密集採樣來計算兩個RSU在BEV空間的重疊區域"""
        h, w = self.bev_image.shape[:2]
        
        # 為每個RSU創建可視區域mask
        mask1 = np.zeros((h, w), dtype=np.uint8)
        mask2 = np.zeros((h, w), dtype=np.uint8)
        
        # 原始影像尺寸(縮放後): 1024(高) x 1224(寬)
        img_h, img_w = int(2048 * self.scale_factor), int(2448 * self.scale_factor)
        
        rospy.loginfo("開始計算RSU可視區域...")
        
        # 使用密集網格採樣來填充可視區域
        step = 10  # 每10個像素採樣一次,可以根據需要調整
        
        # RSU1的可視區域採樣
        valid_points1 = []
        for y in range(0, img_h, step):
            for x in range(0, img_w, step):
                pt = np.array([x, y, 1.0])
                pt_h = self.homographys[0] @ pt
                
                if abs(pt_h[2]) > 1e-6:
                    pt_h = pt_h / pt_h[2]
                    pt_bev = self.affines[0] @ pt_h
                    bev_x, bev_y = int(pt_bev[0]), int(pt_bev[1])
                    
                    # 只保留在BEV範圍內的點
                    if 0 <= bev_x < w and 0 <= bev_y < h:
                        valid_points1.append([bev_x, bev_y])
        
        # 填充RSU1的可視區域
        if len(valid_points1) > 0:
            valid_points1 = np.array(valid_points1, dtype=np.int32)
            for pt in valid_points1:
                cv2.circle(mask1, tuple(pt), step//2 + 2, 255, -1)
        
        rospy.loginfo(f"RSU1: 找到 {len(valid_points1)} 個有效採樣點")
        
        # RSU2的可視區域採樣
        valid_points2 = []
        for y in range(0, img_h, step):
            for x in range(0, img_w, step):
                pt = np.array([x, y, 1.0])
                pt_h = self.homographys[1] @ pt
                
                if abs(pt_h[2]) > 1e-6:
                    pt_h = pt_h / pt_h[2]
                    pt_bev = self.affines[1] @ pt_h
                    bev_x, bev_y = int(pt_bev[0]), int(pt_bev[1])
                    
                    # 只保留在BEV範圍內的點
                    if 0 <= bev_x < w and 0 <= bev_y < h:
                        valid_points2.append([bev_x, bev_y])
        
        # 填充RSU2的可視區域
        if len(valid_points2) > 0:
            valid_points2 = np.array(valid_points2, dtype=np.int32)
            for pt in valid_points2:
                cv2.circle(mask2, tuple(pt), step//2 + 2, 255, -1)
        
        rospy.loginfo(f"RSU2: 找到 {len(valid_points2)} 個有效採樣點")
        
        # 計算重疊區域
        overlap_mask = cv2.bitwise_and(mask1, mask2)
        
        # 輸出統計資訊
        rospy.loginfo(f"原始影像尺寸(縮放後): {img_h}x{img_w}")
        rospy.loginfo(f"BEV影像尺寸: {h}x{w}")
        rospy.loginfo(f"RSU1可視區域像素數: {np.sum(mask1 > 0)}")
        rospy.loginfo(f"RSU2可視區域像素數: {np.sum(mask2 > 0)}")
        rospy.loginfo(f"重疊區域像素數: {np.sum(overlap_mask > 0)}")
        
        # # 儲存除錯圖片
        # cv2.imwrite('/tmp/rsu1_mask.png', mask1)
        # cv2.imwrite('/tmp/rsu2_mask.png', mask2)
        # cv2.imwrite('/tmp/overlap_mask.png', overlap_mask)
        
        # # 視覺化在BEV上
        # debug_img = self.bev_image.copy()
        # debug_img[mask1 > 0] = [0, 255, 0]  # RSU1區域顯示為綠色
        # debug_img[mask2 > 0] = [255, 0, 0]  # RSU2區域顯示為藍色
        # debug_img[overlap_mask > 0] = [0, 255, 255]  # 重疊區域顯示為黃色
        # cv2.imwrite('/tmp/bev_regions_debug.png', debug_img)
        
        # rospy.loginfo("重疊區域計算完成,除錯圖片已儲存到 /tmp/")
        
        return overlap_mask
    
    def is_in_overlap_region(self, bev_point):
        """判斷BEV座標點是否在重疊區域內"""
        x, y = bev_point
        if 0 <= x < self.overlap_mask.shape[1] and 0 <= y < self.overlap_mask.shape[0]:
            return self.overlap_mask[y, x] > 0
        return False
    

    def transform_to_bev(self, detections, homography_idx):
        """將偵測結果轉換到 BEV 座標"""
        bev_points = []
        for det in detections:
            # det 格式: [x, y] 在原始影像中的座標
            pt = np.array([det[0], det[1], 1.0])
            
            # 應用單應性變換
            pt_h = self.homographys[homography_idx] @ pt
            pt_h[0] = pt_h[0] / pt_h[2]
            pt_h[1] = pt_h[1] / pt_h[2]
            pt_h[2] = 1.0
            
            # 應用仿射變換
            pt_bev = self.affines[homography_idx] @ pt_h
            bev_points.append([int(pt_bev[0]), int(pt_bev[1])])
        
        return bev_points
    
    def update_bev(self, event):
        """更新 BEV 視圖"""
        bev_result = self.bev_image.copy()

        # # 先疊加重疊區域的半透明黃色區域
        # alpha = 0.25  # 透明度
        # bev_result = cv2.addWeighted(bev_result, 1, self.overlay, alpha, 0)
        

        
        # 投影 RSU1 的偵測結果
        
        
        boxes1 = self.rsu1_detections[0] if len(self.rsu1_detections) > 1 else []
        boxes2 = self.rsu2_detections[0] if len(self.rsu2_detections) > 1 else []

        detections1 = []
        detections2 = []
        for i, box in enumerate(boxes1):
            x_center, y_center, width, height = box        
            # 還原到原始影像座標
            x_center_orig = x_center * self.scale_factor
            y_center_orig = y_center * self.scale_factor            
            # # 轉換為左上角和右下角座標
            # x1 = int(x_center - width / 2)
            # y1 = int(y_center - height / 2)
            # x2 = int(x_center + width / 2)
            # y2 = int(y_center + height / 2)
            
            # 將中心點座標加入偵測結果
            detections1.append([int(x_center_orig), int(y_center_orig)])
        
        for i, box in enumerate(boxes2):
            x_center, y_center, width, height = box            
            # 還原到原始影像座標
            x_center_orig = x_center * self.scale_factor
            y_center_orig = y_center * self.scale_factor            
            # # 轉換為左上角和右下角座標
            # x1 = int(x_center - width / 2)
            # y1 = int(y_center - height / 2)
            # x2 = int(x_center + width / 2)
            # y2 = int(y_center + height / 2)
            
            # 將中心點座標加入偵測結果
            detections2.append([int(x_center_orig), int(y_center_orig)])

        if len(self.rsu1_detections) > 0:
            bev_pts_1 = self.transform_to_bev(detections1, homography_idx=0)
            for pt, id in zip(bev_pts_1, self.rsu1_detections[2]):
                if 0 <= pt[0] < bev_result.shape[1] and 0 <= pt[1] < bev_result.shape[0]:

                    cv2.circle(bev_result, tuple(pt), 10, (0, 255, 0), -1)  # 綠色表示 RSU1
                    # 車輛資訊
                    class_name = class_names.get(id, 'unknown')
                    cv2.putText(bev_result, f"Class:{class_name}", (pt[0]+10, pt[1]), cv2.FONT_HERSHEY_SIMPLEX, 0.7, (0, 255, 0), 2)
                    cv2.putText(bev_result, f"Vol: 30 km/h", (pt[0]+10, pt[1]+20), cv2.FONT_HERSHEY_SIMPLEX, 0.7, (0, 255, 0), 2)
        
        # 處理RSU2的偵測結果 (只顯示非重疊區域的車輛)
        if len(self.rsu2_detections) > 0:
            bev_pts_2 = self.transform_to_bev(detections2, homography_idx=1)
            for pt, id in zip(bev_pts_2, self.rsu2_detections[2]):
                if 0 <= pt[0] < bev_result.shape[1] and 0 <= pt[1] < bev_result.shape[0]:
                    # # 檢查是否在重疊區域內
                    # if not self.is_in_overlap_region(pt):
                    #     # 不在重疊區域,顯示RSU2的偵測結果
                    #     cv2.circle(bev_result, tuple(pt), 10, (255, 0, 0), -1)  # 藍色表示 RSU2
                    #     # 車輛資訊
                    #     class_name = class_names.get(id, 'unknown')
                    #     cv2.putText(bev_result, f"Class:{class_name}", (pt[0]+10, pt[1]), cv2.FONT_HERSHEY_SIMPLEX, 0.7, (255, 0, 0), 2)
                    #     cv2.putText(bev_result, f"Vol: 30 km/h", (pt[0]+10, pt[1]+20), cv2.FONT_HERSHEY_SIMPLEX, 0.7, (255, 0, 0), 2)
                    # # 在重疊區域內則跳過,不顯示RSU2的結果


                    cv2.circle(bev_result, tuple(pt), 10, (255, 0, 0), -1)  # 藍色表示 RSU2
                    # 車輛資訊
                    class_name = class_names.get(id, 'unknown')
                    cv2.putText(bev_result, f"Class:{class_name}", (pt[0]+10, pt[1]), cv2.FONT_HERSHEY_SIMPLEX, 0.7, (255, 0, 0), 2)
                    cv2.putText(bev_result, f"Vol: 30 km/h", (pt[0]+10, pt[1]+20), cv2.FONT_HERSHEY_SIMPLEX, 0.7, (255, 0, 0), 2)


        
        # 發布 BEV 結果
        bev_msg = self.bridge.cv2_to_imgmsg(bev_result, "bgr8")
        bev_msg.header.stamp = rospy.Time.now()
        self.bev_pub.publish(bev_msg)