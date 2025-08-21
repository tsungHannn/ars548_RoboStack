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

class GPUCalibrationOptimizer(nn.Module):
    """GPU加速的雷達-相機外參校正優化器"""
    
    def __init__(self, camera_intrinsic, device='cuda'):
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
    
    def compute_batch_loss(self, batch_data):
        """計算一個batch的損失"""
        total_loss = 0.0
        total_count = 0
        
        for points_3d, bboxes, bboxes_id, up_ids, down_ids, left_ids, right_ids in batch_data:
            if len(points_3d) == 0 or len(bboxes) == 0:
                continue
            
            # 轉為tensor
            points_3d_tensor = torch.tensor(points_3d[:, :3], dtype=torch.float32, device=self.device)
            vy_tensor = torch.tensor(points_3d[:, 4], dtype=torch.float32, device=self.device)
            
            # 投影雷達點
            projected_points = self.project_points(points_3d_tensor)  # [N, 2]
            
            # 計算與bbox中心的距離
            frame_distances = []
            
            for i, (x, y) in enumerate(projected_points):
                vy = vy_tensor[i]
                
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
        return self.compute_batch_loss(batch_data)

class AdamCalibrationTrainer:
    """Adam優化器訓練器"""
    
    def __init__(self, camera_intrinsic, device='cuda', save_plot_dir='./plots'):
        self.device = device
        self.model = GPUCalibrationOptimizer(camera_intrinsic, device).to(device)
        self.save_plot_dir = save_plot_dir
        
        # 創建儲存圖表的目錄
        os.makedirs(save_plot_dir, exist_ok=True)
        
        # 訓練記錄
        self.loss_history = []
        self.best_loss_history = []
        self.learning_rate_history = []
        
    def train(self, data, initial_params=None, epochs=2000, lr=0.01, patience=2000):
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
            batch_data.append((points_3d, bboxes, bboxes_id, up_ids, down_ids, left_ids, right_ids))
        
        # 設定優化器和學習率調度器
        optimizer = optim.Adam(self.model.parameters(), lr=lr, weight_decay=1e-4)
        scheduler = optim.lr_scheduler.ReduceLROnPlateau(
            optimizer, mode='min', factor=0.5, patience=50, verbose=True
        )
        
        # 訓練記錄
        best_loss = float('inf')
        best_params = None
        patience_counter = 0
        
        print(f"開始GPU Adam優化，使用設備: {self.device}")
        print(f"數據batch數量: {len(batch_data)}")
        
        for epoch in range(epochs):
            optimizer.zero_grad()
            
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
            
            # 早停
            if patience_counter >= patience:
                print(f"早停於第{epoch}輪，最佳損失: {best_loss:.6f}")
                break
            
            # 定期輸出
            # if epoch % 100 == 0 or epoch < 10:
            print(f"Epoch {epoch:4d}, param: {self.get_current_params()}, Loss: {current_loss:.6f}, LR: {current_lr:.2e}, "
                    f"Best: {best_loss:.6f}")
        
        # 載入最佳參數
        if best_params is not None:
            self.set_params(best_params)
        
        # 儲存loss圖表
        self.save_loss_plots(epochs)
        
        return best_params, best_loss
    
    def save_loss_plots(self, total_epochs):
        """儲存loss變化圖表"""
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        
        # 設置中文字體
        plt.rcParams['font.sans-serif'] = ['SimHei', 'DejaVu Sans']  # 用來正常顯示中文標籤
        plt.rcParams['axes.unicode_minus'] = False  # 用來正常顯示負號
        
        # 創建包含多個子圖的figure
        fig, axes = plt.subplots(2, 2, figsize=(15, 12))
        fig.suptitle(f'雷達-相機校正訓練結果 ({timestamp})', fontsize=16, fontweight='bold')
        
        epochs = range(len(self.loss_history))
        
        # 子圖1: 訓練損失變化
        axes[0, 0].plot(epochs, self.loss_history, 'b-', linewidth=1.5, alpha=0.7, label='訓練損失')
        axes[0, 0].plot(epochs, self.best_loss_history, 'r-', linewidth=2, label='最佳損失')
        axes[0, 0].set_xlabel('訓練輪數 (Epoch)')
        axes[0, 0].set_ylabel('損失值 (Loss)')
        axes[0, 0].set_title('訓練損失變化曲線')
        axes[0, 0].legend()
        axes[0, 0].grid(True, alpha=0.3)
        axes[0, 0].set_yscale('log')  # 使用對數刻度
        
        # 子圖2: 學習率變化
        axes[0, 1].plot(epochs, self.learning_rate_history, 'g-', linewidth=1.5, label='學習率')
        axes[0, 1].set_xlabel('訓練輪數 (Epoch)')
        axes[0, 1].set_ylabel('學習率 (Learning Rate)')
        axes[0, 1].set_title('學習率變化曲線')
        axes[0, 1].legend()
        axes[0, 1].grid(True, alpha=0.3)
        axes[0, 1].set_yscale('log')  # 使用對數刻度
        
        # 子圖3: 損失改善情況（最近1000輪）
        recent_epochs = min(1000, len(self.loss_history))
        if recent_epochs > 0:
            recent_start = len(self.loss_history) - recent_epochs
            axes[1, 0].plot(epochs[recent_start:], self.loss_history[recent_start:], 'b-', 
                          linewidth=1.5, alpha=0.7, label='訓練損失')
            axes[1, 0].plot(epochs[recent_start:], self.best_loss_history[recent_start:], 'r-', 
                          linewidth=2, label='最佳損失')
            axes[1, 0].set_xlabel('訓練輪數 (Epoch)')
            axes[1, 0].set_ylabel('損失值 (Loss)')
            axes[1, 0].set_title(f'近期訓練損失變化 (最後{recent_epochs}輪)')
            axes[1, 0].legend()
            axes[1, 0].grid(True, alpha=0.3)
        
        # 子圖4: 訓練統計信息
        axes[1, 1].axis('off')  # 隱藏坐標軸
        
        # 計算統計信息
        final_loss = self.loss_history[-1] if self.loss_history else 0
        best_loss = min(self.best_loss_history) if self.best_loss_history else 0
        total_epochs_trained = len(self.loss_history)
        improvement = ((self.loss_history[0] - final_loss) / self.loss_history[0] * 100) if self.loss_history and self.loss_history[0] != 0 else 0
        
        # 顯示統計信息
        stats_text = f"""
        訓練統計信息:
        
        總訓練輪數: {total_epochs_trained:,}
        最終損失: {final_loss:.6f}
        最佳損失: {best_loss:.6f}
        損失改善: {improvement:.2f}%
        
        最終學習率: {self.learning_rate_history[-1]:.2e}
        初始學習率: {self.learning_rate_history[0]:.2e}
        
        訓練設備: {self.device}
        """
        
        axes[1, 1].text(0.1, 0.9, stats_text, transform=axes[1, 1].transAxes,
                        fontsize=12, verticalalignment='top',
                        bbox=dict(boxstyle='round', facecolor='lightgray', alpha=0.8))
        
        # 調整子圖間距
        plt.tight_layout()
        
        # 儲存圖表
        plot_filename = f"calibration_training_loss_{timestamp}.png"
        plot_path = os.path.join(self.save_plot_dir, plot_filename)
        plt.savefig(plot_path, dpi=300, bbox_inches='tight')
        print(f"損失圖表已儲存至: {plot_path}")
        
        # 也儲存為PDF格式（向量圖形，適合論文使用）
        # pdf_path = os.path.join(self.save_plot_dir, f"calibration_training_loss_{timestamp}.pdf")
        # plt.savefig(pdf_path, bbox_inches='tight')
        # print(f"損失圖表PDF已儲存至: {pdf_path}")
        
        # 顯示圖表（如果在支援的環境中）
        try:
            plt.show()
        except:
            pass
        
        plt.close()
        
        # 儲存數值資料為CSV（便於後續分析）
        # self.save_training_data(timestamp)
    
    def save_training_data(self, timestamp):
        """儲存訓練數據為CSV檔案"""
        import csv
        
        csv_filename = f"calibration_training_data_{timestamp}.csv"
        csv_path = os.path.join(self.save_plot_dir, csv_filename)
        
        with open(csv_path, 'w', newline='', encoding='utf-8') as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow(['Epoch', 'Loss', 'Best_Loss', 'Learning_Rate'])
            
            for i, (loss, best_loss, lr) in enumerate(zip(self.loss_history, 
                                                         self.best_loss_history, 
                                                         self.learning_rate_history)):
                writer.writerow([i, loss, best_loss, lr])
        
        print(f"訓練數據CSV已儲存至: {csv_path}")
    
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