import torch
import torch.nn as nn
import torch.optim as optim
import numpy as np
import matplotlib.pyplot as plt
import matplotlib
matplotlib.use('Agg')  # 避免在無GUI環境中出錯
matplotlib.rc('font', family='Microsoft JhengHei')
import os
from datetime import datetime
from scipy.spatial.transform import Rotation
import rospy
from sensor_msgs.msg import Image
from std_msgs.msg import String
from cv_bridge import CvBridge
import cv2
import json


class CPUCalibrationOptimizer(nn.Module):
    """CPU版本的雷達-相機外參校正優化器"""
    
    def __init__(self, camera_intrinsic, device='cpu'):
        super().__init__()
        self.device = device
        
        # 將相機內參轉為tensor
        self.camera_intrinsic = torch.tensor(camera_intrinsic, dtype=torch.float32, device=device)
        
        # 可學習的外參參數
        self.quaternion = nn.Parameter(torch.tensor([0., 0., 0., 1.], device=device))  # [x,y,z,w]
        self.translation = nn.Parameter(torch.zeros(3, device=device))
        
        # 損失函數的權重
        self.distance_weight = 1.0
        self.regularization_weight = 0.01

        self.calib_vis = True # 校正可視化
        
        # ROS可視化
        try:
            self.visualize_pub = rospy.Publisher('/optimize_visualize', Image, queue_size=1)
            self.sub_optimize_action = rospy.Subscriber('/control/optimize_action', String, self.control_callback)
            self.bridge = CvBridge()
            self.ros_enabled = True
        except:
            print("ROS未初始化，跳過ROS發布器")
            self.ros_enabled = False
    
    def normalize_quaternion(self, q):
        """標準化四元數"""
        return q / torch.norm(q)
    
    def quaternion_to_rotation_matrix(self, q):
        """四元數轉旋轉矩陣"""
        q = self.normalize_quaternion(q)
        x, y, z, w = q
        
        # 構建旋轉矩陣
        R = torch.zeros(3, 3, device=self.device)
        R[0, 0] = 1 - 2 * (y**2 + z**2)
        R[0, 1] = 2 * (x*y - z*w)
        R[0, 2] = 2 * (x*z + y*w)
        R[1, 0] = 2 * (x*y + z*w)
        R[1, 1] = 1 - 2 * (x**2 + z**2)
        R[1, 2] = 2 * (y*z - x*w)
        R[2, 0] = 2 * (x*z - y*w)
        R[2, 1] = 2 * (y*z + x*w)
        R[2, 2] = 1 - 2 * (x**2 + y**2)
        
        return R
    
    def get_extrinsic_matrix(self):
        """獲取4x4外參矩陣"""
        R = self.quaternion_to_rotation_matrix(self.quaternion)
        T = self.translation
        
        extrinsic = torch.eye(4, device=self.device)
        extrinsic[:3, :3] = R
        extrinsic[:3, 3] = T
        
        return extrinsic
    
    def project_points(self, points_3d):
        """將3D點投影到2D圖像平面"""
        # points_3d: [N, 3]
        # 添加齊次座標
        points_homo = torch.cat([points_3d, torch.ones(points_3d.shape[0], 1, device=self.device)], dim=1)
        
        # 應用外參變換
        extrinsic = self.get_extrinsic_matrix()
        points_cam = torch.matmul(extrinsic, points_homo.T)[:3, :].T  # [N, 3]
        
        # 投影到圖像平面
        points_2d_homo = torch.matmul(self.camera_intrinsic, points_cam.T)  # [3, N]
        points_2d = points_2d_homo[:2, :] / points_2d_homo[2:3, :]  # [2, N]
        
        return points_2d.T  # [N, 2]
    

    def control_callback(self, msg):
        try:
            command = json.loads(msg.data)
            action = command[0]
            method = command[1]
            calib_vis = command[9]
        except Exception as e:
            rospy.logwarn(f"無法解析 optimize_command: {msg.data}, 錯誤: {e}")
            return
        


        if method == 'Adam' and action == 'calib_vis':
            self.calib_vis = calib_vis
            rospy.loginfo("Adam 校正視覺化: " + str(self.calib_vis))


    def visualize_frame(self, image, points_3d, projected_points, bboxes, bboxes_id, 
                       up_ids, down_ids, left_ids, right_ids, vy_tensor, frame_idx=0):
        """可視化當前幀的校正結果"""
        if image is None:
            return
        
        # 複製圖像
        vis_image = image.copy()
        h, w = vis_image.shape[:2]
        
        # 定義顏色 (BGR格式)
        COLOR_RADAR_LEFT = (255, 0, 0)    # 向左雷達點 - 藍色
        COLOR_RADAR_RIGHT = (0, 255, 255) # 向右雷達點 - 黃色
        COLOR_BBOX_LEFT = (255, 0, 255)   # 向左物件框中心 - 紫色
        COLOR_BBOX_RIGHT = (0, 255, 0)    # 向右物件框中心 - 綠色
        COLOR_LINE = (0, 0, 255)          # 最短路徑線 - 紅色
        
        # 畫出所有bbox中心點
        bbox_centers = {}
        for i, (bbox, tid) in enumerate(zip(bboxes, bboxes_id)):
            cx, cy, w_box, h_box = bbox
            cx, cy = int(cx), int(cy)
            
            # 根據ID決定顏色
            if tid in left_ids:
                color = COLOR_BBOX_LEFT
                bbox_centers[tid] = (cx, cy, 'left')
            elif tid in right_ids:
                color = COLOR_BBOX_RIGHT
                bbox_centers[tid] = (cx, cy, 'right')
            else:
                continue
            
            # 畫中心點
            cv2.circle(vis_image, (cx, cy), 20, color, -1)
            # cv2.circle(vis_image, (cx, cy), 10, (255, 255, 255), 2)
            
            # 標註ID
            cv2.putText(vis_image, f'ID:{tid}', (cx + 15, cy - 10), 
                       cv2.FONT_HERSHEY_SIMPLEX, 0.6, color, 2)
        
        # 畫出雷達點並找最短連接
        for i, (proj_point, vy) in enumerate(zip(projected_points, vy_tensor)):
            x, y = int(proj_point[0].item()), int(proj_point[1].item())
            
            # 確保點在圖像範圍內
            if x < 0 or x >= w or y < 0 or y >= h:
                continue
            
            # 根據運動方向確定雷達點顏色和對應的bbox
            if vy > 0:  # 向左運動
                radar_color = COLOR_RADAR_LEFT
                target_ids = left_ids
            elif vy < 0:  # 向右運動
                radar_color = COLOR_RADAR_RIGHT  
                target_ids = right_ids
            else:
                continue
            
            # 畫雷達點
            cv2.circle(vis_image, (x, y), 20, radar_color, -1)
            # cv2.circle(vis_image, (x, y), 20, (255, 255, 255), 2)
            
            # # 標註雷達點信息
            # direction = "←" if vy > 0 else "→"
            # cv2.putText(vis_image, f'R{i}:{direction}', (x + 10, y + 10), 
            #            cv2.FONT_HERSHEY_SIMPLEX, 0.5, radar_color, 2)
            
            # 找到最近的對應bbox並畫線
            min_distance = float('inf')
            closest_bbox = None
            
            for tid in target_ids:
                if tid in bbox_centers:
                    bbox_x, bbox_y, _ = bbox_centers[tid]
                    distance = np.sqrt((x - bbox_x)**2 + (y - bbox_y)**2)
                    if distance < min_distance:
                        min_distance = distance
                        closest_bbox = (bbox_x, bbox_y, tid)
            
            # 畫最短連接線
            if closest_bbox is not None:
                bbox_x, bbox_y, tid = closest_bbox
                cv2.line(vis_image, (x, y), (bbox_x, bbox_y), COLOR_LINE, 2)
                
                # 在線的中點標註距離
                mid_x, mid_y = (x + bbox_x) // 2, (y + bbox_y) // 2
                cv2.putText(vis_image, f'{min_distance:.1f}', (mid_x, mid_y), 
                           cv2.FONT_HERSHEY_SIMPLEX, 0.5, COLOR_LINE, 2)
        
        # # 添加圖例
        # legend_y = 30
        # cv2.putText(vis_image, "Legend:", (10, legend_y), cv2.FONT_HERSHEY_SIMPLEX, 0.7, (255, 255, 255), 2)
        # cv2.circle(vis_image, (120, legend_y - 5), 5, COLOR_RADAR_LEFT, -1)
        # cv2.putText(vis_image, "Radar Left", (135, legend_y), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 255), 1)
        # cv2.circle(vis_image, (250, legend_y - 5), 5, COLOR_RADAR_RIGHT, -1)
        # cv2.putText(vis_image, "Radar Right", (265, legend_y), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 255), 1)
        
        # legend_y += 25
        # cv2.circle(vis_image, (120, legend_y - 5), 5, COLOR_BBOX_LEFT, -1)
        # cv2.putText(vis_image, "Bbox Left", (135, legend_y), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 255), 1)
        # cv2.circle(vis_image, (250, legend_y - 5), 5, COLOR_BBOX_RIGHT, -1)
        # cv2.putText(vis_image, "Bbox Right", (265, legend_y), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 255), 1)
        
        # 發布可視化結果
        if self.ros_enabled:
            try:
                ros_image = self.bridge.cv2_to_imgmsg(vis_image, "bgr8")
                self.visualize_pub.publish(ros_image)
            except Exception as e:
                print(f"ROS發布失敗: {e}")
        
        return vis_image
    
    def compute_batch_loss(self, batch_data, visualize=True):
        """計算一個batch的損失並可視化"""
        total_loss = 0.0
        total_count = 0
        
        for frame_idx, (points_3d, bboxes, bboxes_id, up_ids, down_ids, left_ids, right_ids, image) in enumerate(batch_data):
            if len(points_3d) == 0 or len(bboxes) == 0:
                continue
            
            # 轉為tensor
            points_3d_tensor = torch.tensor(points_3d[:, :3], dtype=torch.float32, device=self.device)
            vy_tensor = torch.tensor(points_3d[:, 4], dtype=torch.float32, device=self.device)
            
            # 投影雷達點
            projected_points = self.project_points(points_3d_tensor)  # [N, 2]
            
            # 可視化當前幀
            if visualize and image is not None:
                vis_image = self.visualize_frame(
                    image, points_3d, projected_points, bboxes, bboxes_id,
                    up_ids, down_ids, left_ids, right_ids, vy_tensor, frame_idx
                )
                
                # # 每隔幾幀保存一次可視化結果（避免太多圖片）
                # if frame_idx % 10 == 0:
                #     save_path = f"./visualization_frame_{frame_idx}.png"
                #     cv2.imwrite(save_path, vis_image)
                #     print(f"可視化結果已保存: {save_path}")
            
            # 計算與bbox中心的距離
            frame_distances = []
            
            for i, (proj_point, vy) in enumerate(zip(projected_points, vy_tensor)):
                x, y = proj_point[0], proj_point[1]
                
                # 根據運動方向選擇對應的bbox
                if vy > 0:
                    valid_ids = left_ids
                elif vy < 0:
                    valid_ids = right_ids
                else:
                    continue
                
                # 找到對應的bbox
                min_distance = float('inf')
                for bbox, tid in zip(bboxes, bboxes_id):
                    if tid in valid_ids:
                        cx, cy, w, h = bbox
                        distance = torch.sqrt((x - cx)**2 + (y - cy)**2)
                        min_distance = min(min_distance, distance)
                
                if min_distance < float('inf'):
                    frame_distances.append(min_distance)
            
            if frame_distances:
                # 使用Huber損失
                frame_distances = torch.stack(frame_distances)
                huber_loss = self.huber_loss(frame_distances, delta=50.0)
                total_loss += huber_loss
                total_count += 1
        
        if total_count == 0:
            return torch.tensor(float('inf'), device=self.device)
        
        # 平均損失
        avg_loss = total_loss / total_count
        
        # 添加正則化項
        regularization = self.regularization_weight * (
            torch.norm(self.translation)**2 +  # 平移正則化
            (1 - torch.norm(self.quaternion))**2  # 四元數單位長度約束
        )
        
        return avg_loss + regularization
    
    def huber_loss(self, distances, delta=1.0):
        """Huber損失函數"""
        mask = distances <= delta
        loss = torch.where(mask, 
                          0.5 * distances**2,
                          delta * (distances - 0.5 * delta))
        return torch.mean(loss)
    
    def forward(self, batch_data):
        """前向傳播"""
        return self.compute_batch_loss(batch_data, visualize=self.calib_vis)

class AdamCalibrationTrainer:
    """CPU版本Adam優化器訓練器"""
    
    def __init__(self, camera_intrinsic, device='cpu', save_plot_dir='./plots'):
        self.device = device
        self.model = CPUCalibrationOptimizer(camera_intrinsic, device).to(device)
        self.save_plot_dir = save_plot_dir
        
        
        # 訓練記錄
        self.loss_history = []
        self.best_loss_history = []
        self.learning_rate_history = []

        


        
    def train(self, data, initial_params=None, epochs=2000, lr=0.01, patience=2000, visualize_freq=50):
        """訓練外參"""
        
        # 重置記錄
        self.loss_history = []
        self.best_loss_history = []
        self.learning_rate_history = []
        
        # 初始化參數
        if initial_params is not None:
            qx, qy, qz, qw, tx, ty, tz = initial_params
            with torch.no_grad():
                self.model.quaternion.copy_(torch.tensor([qx, qy, qz, qw], device=self.device))
                self.model.translation.copy_(torch.tensor([tx, ty, tz], device=self.device))
        
        # 準備數據
        batch_data = []
        for points_3d, bboxes, bboxes_id, up_ids, down_ids, left_ids, right_ids, image in data:
            batch_data.append((points_3d, bboxes, bboxes_id, up_ids, down_ids, left_ids, right_ids, image))
        
        # 設定優化器和學習率調度器
        optimizer = optim.Adam(self.model.parameters(), lr=lr, weight_decay=1e-4)
        scheduler = optim.lr_scheduler.ReduceLROnPlateau(
            optimizer, mode='min', factor=0.5, patience=50, verbose=True
        )

        # 添加週期性重啟
        # T_0是第一次重啟的週期，T_mult是每次重啟後週期的倍數(2代表每周期長度翻倍)，eta_min是最小學習率
        warmup_scheduler = optim.lr_scheduler.CosineAnnealingWarmRestarts(
            optimizer, T_0=100, T_mult=2, eta_min=1e-6
        )
        
        # 訓練記錄
        best_loss = float('inf')
        best_params = None
        patience_counter = 0
        
        print(f"開始CPU Adam優化，使用設備: {self.device}")
        print(f"數據batch數量: {len(batch_data)}")
        
        for epoch in range(epochs):
            optimizer.zero_grad()
            
            # 決定是否要可視化（減少頻率避免過多圖片）
            # visualize_this_epoch = (epoch % visualize_freq == 0) or (epoch < 10)
            
            # 前向傳播
            loss = self.model(batch_data)
            
            # 檢查損失是否有效
            if torch.isnan(loss) or torch.isinf(loss):
                print(f"警告: 第{epoch}輪出現無效損失值")
                break
            
            # 反向傳播
            loss.backward()
            
            # 梯度裁剪防止梯度爆炸
            torch.nn.utils.clip_grad_norm_(self.model.parameters(), max_norm=1.0)
            
            optimizer.step()
            scheduler.step(loss)

            
            # 記錄訓練數據
            current_loss = loss.item()
            current_lr = optimizer.param_groups[0]['lr']
            self.loss_history.append(current_loss)
            self.learning_rate_history.append(current_lr)
            
            # 記錄最佳結果
            if current_loss < best_loss:
                best_loss = current_loss
                best_params = self.get_current_params()
                patience_counter = 0
            else:
                patience_counter += 1
            
            self.best_loss_history.append(best_loss)

            # 重啟邏輯應該放在這裡，current_loss已經定義了
            if epoch > 0 and epoch % 200 == 0 and current_loss > best_loss * 1.1:
                warmup_scheduler.step()
                print(f"Epoch {epoch}: 執行學習率重啟")


            # 早停
            if patience_counter >= patience:
                print(f"早停於第{epoch}輪，最佳損失: {best_loss:.6f}")
                break
            
            # 定期輸出
            # if epoch % 10 == 0 or epoch < 5:
            params_str = ', '.join([f'{p:.4f}' for p in self.get_current_params()])
            print(f"Epoch {epoch:4d}, 參數: [{params_str}], Loss: {current_loss:.6f}, "
                    f"LR: {current_lr:.2e}, Best: {best_loss:.6f}")
        
        # 載入最佳參數
        if best_params is not None:
            self.set_params(best_params)
        
        # 最終可視化
        print("生成最終可視化結果...")
        with torch.no_grad():
            self.model(batch_data)
        
        # 儲存loss圖表
        self.save_loss_plots(epochs)
        
        return best_params, best_loss
    
    def save_loss_plots(self, total_epochs):
        """儲存loss變化圖表"""
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        
        # 設置中文字體
        plt.rcParams['font.sans-serif'] = ['Microsoft JhengHei', 'SimHei', 'DejaVu Sans']  
        plt.rcParams['axes.unicode_minus'] = False  
        
        # 創建包含多個子圖的figure
        fig, axes = plt.subplots(2, 2, figsize=(15, 12))
        fig.suptitle(f'Training loss ({timestamp})', fontsize=16, fontweight='bold')
        
        epochs = range(len(self.loss_history))
        
        # 子圖1: 訓練損失變化
        if len(self.loss_history) > 0:
            axes[0, 0].plot(epochs, self.loss_history, 'b-', linewidth=1.5, alpha=0.7, label='Loss')
            axes[0, 0].plot(epochs, self.best_loss_history, 'r-', linewidth=2, label='Best loss')
            axes[0, 0].set_xlabel('Epoch')
            axes[0, 0].set_ylabel('Loss')
            axes[0, 0].set_title('Loss v.s. Epoch')
            axes[0, 0].legend()
            axes[0, 0].grid(True, alpha=0.3)
            axes[0, 0].set_yscale('log')
        
        # 子圖2: 學習率變化
        if len(self.learning_rate_history) > 0:
            axes[0, 1].plot(epochs, self.learning_rate_history, 'g-', linewidth=1.5, label='Learning rate')
            axes[0, 1].set_xlabel('Epoch')
            axes[0, 1].set_ylabel('Learning Rate')
            axes[0, 1].set_title('Learning Rate v.s. Epoch')
            axes[0, 1].legend()
            axes[0, 1].grid(True, alpha=0.3)
            axes[0, 1].set_yscale('log')
        
        # # 子圖3: 損失改善情況（最近1000輪）
        # recent_epochs = min(1000, len(self.loss_history))
        # if recent_epochs > 0:
        #     recent_start = len(self.loss_history) - recent_epochs
        #     axes[1, 0].plot(epochs[recent_start:], self.loss_history[recent_start:], 'b-', 
        #                   linewidth=1.5, alpha=0.7, label='訓練損失')
        #     axes[1, 0].plot(epochs[recent_start:], self.best_loss_history[recent_start:], 'r-', 
        #                   linewidth=2, label='最佳損失')
        #     axes[1, 0].set_xlabel('訓練輪數 (Epoch)')
        #     axes[1, 0].set_ylabel('損失值 (Loss)')
        #     axes[1, 0].set_title(f'近期訓練損失變化 (最後{recent_epochs}輪)')
        #     axes[1, 0].legend()
        #     axes[1, 0].grid(True, alpha=0.3)
        
        # 子圖4: 訓練統計信息
        axes[1, 1].axis('off')
        
        # 計算統計信息
        if len(self.loss_history) > 0:
            final_loss = self.loss_history[-1] 
            best_loss = min(self.best_loss_history) 
            total_epochs_trained = len(self.loss_history)
            improvement = ((self.loss_history[0] - final_loss) / self.loss_history[0] * 100) if self.loss_history[0] != 0 else 0
            
            stats_text = f"""
            Training information:
            
            Total epoch: {total_epochs_trained:,}
            Final loss: {final_loss:.6f}
            Best loss: {best_loss:.6f}
            improvement: {improvement:.2f}%
            
            Final learning rate: {self.learning_rate_history[-1]:.2e}
            Begin learning rate: {self.learning_rate_history[0]:.2e}
            
            Training device: {self.device}
            """
            
            axes[1, 1].text(0.1, 0.9, stats_text, transform=axes[1, 1].transAxes,
                            fontsize=12, verticalalignment='top',
                            bbox=dict(boxstyle='round', facecolor='lightgray', alpha=0.8))
        
        plt.tight_layout()
        
        # 儲存圖表
        plot_filename = f"calibration_training_loss_cpu_{timestamp}.png"
        plot_path = os.path.join(self.save_plot_dir, plot_filename)
        plt.savefig(plot_path, dpi=300, bbox_inches='tight')
        print(f"損失圖表已儲存至: {plot_path}")
        
        try:
            plt.show()
        except:
            pass
        
        plt.close()
    
    def get_current_params(self):
        """獲取當前參數"""
        with torch.no_grad():
            q = self.model.normalize_quaternion(self.model.quaternion)
            t = self.model.translation
            return torch.cat([q, t]).cpu().numpy()
    
    def set_params(self, params):
        """設定參數"""
        qx, qy, qz, qw, tx, ty, tz = params
        with torch.no_grad():
            self.model.quaternion.copy_(torch.tensor([qx, qy, qz, qw], device=self.device))
            self.model.translation.copy_(torch.tensor([tx, ty, tz], device=self.device))
    
    def get_extrinsic_matrix(self):
        """獲取當前外參矩陣"""
        return self.model.get_extrinsic_matrix().cpu().numpy()

# 使用範例
if __name__ == "__main__":
    # 假設的相機內參矩陣
    camera_intrinsic = np.array([
        [800, 0, 320],
        [0, 800, 240],
        [0, 0, 1]
    ])
    
    # 創建訓練器
    trainer = AdamCalibrationTrainer(camera_intrinsic, device='cpu')
    
    # 假設數據格式
    # data = [(points_3d, bboxes, bboxes_id, up_ids, down_ids, left_ids, right_ids, image), ...]
    
    # 開始訓練
    # best_params, best_loss = trainer.train(data, epochs=1000, lr=0.01, visualize_freq=20)