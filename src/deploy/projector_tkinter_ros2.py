#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import json
import numpy as np
import sys
import threading
import time
from math import pi
from utils import yaml_to_object
import yaml

import tkinter as tk
from tkinter import ttk, messagebox, filedialog
from tkinter.scrolledtext import ScrolledText

import rclpy
from rclpy.node import Node
from std_msgs.msg import Float32MultiArray, String

class ROSNode(Node):
    """分離的 ROS 節點類別"""
    def __init__(self):
        super().__init__('control_panel_gui')
        
        self.matrix_pub = self.create_publisher(Float32MultiArray, '/control/matrix', 10)
        self.optimize_action_pub = self.create_publisher(String, '/control/optimize_action', 10)
        self.matrix_sub = self.create_subscription(
            Float32MultiArray, 
            '/radar/extrinsic_matrix', 
            self.update_matrix_from_auto_calib, 
            10
        )
        self.intrinsic_pub = self.create_publisher(Float32MultiArray, '/control/camera_intrinsic', 10)

        # 回調函數將通過主視窗設置
        self.gui_callback = None
        
    def set_gui_callback(self, callback):
        """設置 GUI 回調函數"""
        self.gui_callback = callback
        
    def update_matrix_from_auto_calib(self, msg):
        """從自動校正接收矩陣更新"""
        if self.gui_callback:
            self.gui_callback(msg)

class ProjectorGUI:
    def __init__(self, ros_node: ROSNode, config_path='config.yaml'):
        self.ros_node = ros_node
        self.ros_node.set_gui_callback(self.update_matrix_from_auto_calib)
        
        # Camera parameters
        self.config_path = config_path
        self.camera_matrix = None
        self.extrinsic_matrix = None 
        self.original_extrinsic = None
        
        # Calibration parameters
        self.cali_scale_degree = 0.2
        self.cali_scale_trans = 0.03
        self.cali_scale_intrinsic = 1.0005
        self.modification_list = []
        
        # Load config and initialize parameters
        self.load_config()
        self.init_calibration()
        
        # Create main window
        self.root = tk.Tk()
        self.root.title("Camera Projector Control Panel")
        self.root.geometry("400x900")
        
        # Variables for controls
        self.degree_var = tk.DoubleVar(value=self.cali_scale_degree)
        self.trans_var = tk.DoubleVar(value=self.cali_scale_trans)
        self.intrinsic_var = tk.DoubleVar(value=self.cali_scale_intrinsic)
        self.method_var = tk.StringVar(value="Nelder-Mead")
        self.sample_interval_var = tk.StringVar(value="1")

        self.show_radar_trajectory = tk.BooleanVar(value=False) # 顯示雷達軌跡
        
        # Filter variables
        self.optimize_filter_var = tk.StringVar(value="不限")
        self.vx_filter_var = tk.StringVar(value="all")
        self.vy_filter_var = tk.StringVar(value="all")
        self.camera_filter_x_var = tk.StringVar(value="all")
        self.camera_filter_y_var = tk.StringVar(value="all")
        
        self.setup_gui()
        
    def setup_gui(self):
        """設置 GUI 介面"""
        # Create scrollable main frame
        canvas = tk.Canvas(self.root)
        scrollbar = ttk.Scrollbar(self.root, orient="vertical", command=canvas.yview)
        scrollable_frame = ttk.Frame(canvas)
        
        scrollable_frame.bind(
            "<Configure>",
            lambda e: canvas.configure(scrollregion=canvas.bbox("all"))
        )
        
        canvas.create_window((0, 0), window=scrollable_frame, anchor="nw")
        canvas.configure(yscrollcommand=scrollbar.set)
        
        canvas.pack(side="left", fill="both", expand=True)
        scrollbar.pack(side="right", fill="y")
        
        # ======================
        # Calibration Scale
        # ======================
        scale_frame = ttk.LabelFrame(scrollable_frame, text="Calibration Scale", padding=10)
        scale_frame.pack(fill=tk.X, padx=10, pady=5)
        
        # Degree step
        ttk.Label(scale_frame, text="Degree Step:").grid(row=0, column=0, sticky=tk.W, padx=5)
        degree_scale = ttk.Scale(scale_frame, from_=0.01, to=1.0, 
                               orient=tk.HORIZONTAL, variable=self.degree_var,
                               command=self.update_degree_scale)
        degree_scale.grid(row=0, column=1, sticky=tk.EW, padx=5)
        self.degree_label = ttk.Label(scale_frame, text=f"{self.cali_scale_degree:.2f}°")
        self.degree_label.grid(row=0, column=2, padx=5)
        
        # Translation step
        ttk.Label(scale_frame, text="Trans Step (cm):").grid(row=1, column=0, sticky=tk.W, padx=5)
        trans_scale = ttk.Scale(scale_frame, from_=0.01, to=1.5,
                              orient=tk.HORIZONTAL, variable=self.trans_var,
                              command=self.update_trans_scale)
        trans_scale.grid(row=1, column=1, sticky=tk.EW, padx=5)
        self.trans_label = ttk.Label(scale_frame, text=f"{self.cali_scale_trans*100:.1f} cm")
        self.trans_label.grid(row=1, column=2, padx=5)
        
        # Intrinsic step
        ttk.Label(scale_frame, text="Intrinsic Step:").grid(row=2, column=0, sticky=tk.W, padx=5)
        intrinsic_scale = ttk.Scale(scale_frame, from_=1.0, to=1.1, 
                               orient=tk.HORIZONTAL, variable=self.intrinsic_var,
                               command=self.update_intrinsic_scale)
        intrinsic_scale.grid(row=2, column=1, sticky=tk.EW, padx=5)
        self.intrinsic_label = ttk.Label(scale_frame, text=f"{self.cali_scale_intrinsic:.4f}")
        self.intrinsic_label.grid(row=2, column=2, padx=5)

        scale_frame.columnconfigure(1, weight=1)
        
        # ======================
        # Transformation Controls
        # ======================
        transform_frame = ttk.LabelFrame(scrollable_frame, text="Transformation Controls", padding=10)
        transform_frame.pack(fill=tk.X, padx=10, pady=5)
        
        # 顯示雷達軌跡
        checkbox_frame = ttk.Frame(transform_frame)
        checkbox_frame.pack(fill=tk.X, pady=5)
        ttk.Checkbutton(checkbox_frame, text="顯示雷達軌跡", variable=self.show_radar_trajectory, command=lambda: self.send_action("radar_trajectory")).pack(side=tk.LEFT)
        ttk.Button(checkbox_frame, text="清除軌跡", command=lambda: self.send_action("clear_trajectory")).pack(side=tk.RIGHT, padx=5)
        
        # Rotation section
        rotation_frame = ttk.LabelFrame(transform_frame, text="Rotation", padding=5)
        rotation_frame.pack(fill=tk.X, pady=5)
        
        rot_buttons = [
            ("+ X", lambda: self.apply_modification(0)),
            ("- X", lambda: self.apply_modification(1)),
            ("+ Y", lambda: self.apply_modification(2)),
            ("- Y", lambda: self.apply_modification(3)),
            ("+ Z", lambda: self.apply_modification(4)),
            ("- Z", lambda: self.apply_modification(5))
        ]
        
        for i, (text, command) in enumerate(rot_buttons):
            ttk.Button(rotation_frame, text=text, command=command, width=8).grid(
                row=i//2, column=i%2, padx=2, pady=2, sticky=tk.EW)
        
        # Translation section
        translation_frame = ttk.LabelFrame(transform_frame, text="Translation", padding=5)
        translation_frame.pack(fill=tk.X, pady=5)
        
        trans_buttons = [
            ("+ X", lambda: self.apply_modification(6)),
            ("- X", lambda: self.apply_modification(7)),
            ("+ Y", lambda: self.apply_modification(8)),
            ("- Y", lambda: self.apply_modification(9)),
            ("+ Z", lambda: self.apply_modification(10)),
            ("- Z", lambda: self.apply_modification(11))
        ]
        
        for i, (text, command) in enumerate(trans_buttons):
            ttk.Button(translation_frame, text=text, command=command, width=8).grid(
                row=i//2, column=i%2, padx=2, pady=2, sticky=tk.EW)
        
        # 調整相機內參
        camera_intrinsic_frame = ttk.LabelFrame(transform_frame, text="Camera Intrinsic", padding=5)
        camera_intrinsic_frame.pack(fill=tk.X, pady=5)
        
        intrinsic_buttons = [
            ("+ fx", lambda: self.apply_camera_intrinsic_modification('+fx')),
            ("- fx", lambda: self.apply_camera_intrinsic_modification('-fx')),
            ("+ fy", lambda: self.apply_camera_intrinsic_modification('+fy')),
            ("- fy", lambda: self.apply_camera_intrinsic_modification('-fy')),
        ]
        
        for i, (text, command) in enumerate(intrinsic_buttons):
            ttk.Button(camera_intrinsic_frame, text=text, command=command, width=8).grid(
                row=i//2, column=i%2, padx=2, pady=2, sticky=tk.EW)
        
        for i in range(3):
            rotation_frame.columnconfigure(i, weight=1)
            translation_frame.columnconfigure(i, weight=1)
            camera_intrinsic_frame.columnconfigure(i, weight=1)

        # ======================
        # Auto Calibration
        # ======================
        auto_frame = ttk.LabelFrame(scrollable_frame, text="Auto Calibration", padding=10)
        auto_frame.pack(fill=tk.X, padx=10, pady=5)
        
        # Method and interval
        settings_frame = ttk.Frame(auto_frame)
        settings_frame.pack(fill=tk.X, pady=5)
        
        ttk.Label(settings_frame, text="優化方法:").grid(row=0, column=0, sticky=tk.W, padx=5)
        method_combo = ttk.Combobox(settings_frame, textvariable=self.method_var,
                                  values=["L-BFGS-B", "Powell", "Nelder-Mead"], width=12)
        method_combo.grid(row=0, column=1, padx=5)
        
        ttk.Label(settings_frame, text="取樣間隔:").grid(row=0, column=2, sticky=tk.W, padx=5)
        ttk.Entry(settings_frame, textvariable=self.sample_interval_var, width=8).grid(row=0, column=3, padx=5)
        
        # Recording control buttons
        record_frame = ttk.Frame(auto_frame)
        record_frame.pack(fill=tk.X, pady=5)
        
        record_buttons = [
            ("開始錄製", lambda: self.send_action("record_start")),
            ("停止錄製", lambda: self.send_action("record_stop")),
            ("計算初始外參", lambda: self.send_action("calculate_initial_extrinsic")),
            ("清除片段", lambda: self.send_action("clear")),
            ("開始優化", lambda: self.send_action("optimize"))
        ]
        
        for i, (text, command) in enumerate(record_buttons):
            ttk.Button(record_frame, text=text, command=command, width=12).grid(
                row=i//2, column=i%2, padx=5, pady=3, sticky=tk.EW)
        
        record_frame.columnconfigure(0, weight=1)
        record_frame.columnconfigure(1, weight=1)
        
        # Filter controls
        filter_frame = ttk.LabelFrame(auto_frame, text="濾波器設定", padding=5)
        filter_frame.pack(fill=tk.X, pady=5)
        
        filters = [
            ("優化方向:", self.optimize_filter_var, ["左右", "上下", "不限"]),
            ("雷達 vx:", self.vx_filter_var, ["all", "vx > 0", "vx < 0"]),
            ("雷達 vy:", self.vy_filter_var, ["all", "vy > 0", "vy < 0"]),
            ("相機偵測(左右):", self.camera_filter_x_var, ["all", "left", "right"]),
            ("相機偵測(上下):", self.camera_filter_y_var, ["all", "up", "down"])
        ]
        
        for i, (label, var, values) in enumerate(filters):
            ttk.Label(filter_frame, text=label).grid(row=i, column=0, sticky=tk.W, padx=2)
            combo = ttk.Combobox(filter_frame, textvariable=var, values=values, width=15)
            combo.grid(row=i, column=1, padx=5, pady=2, sticky=tk.EW)
            combo.bind('<<ComboboxSelected>>', lambda e: self.send_action("filter_changed"))
        
        filter_frame.columnconfigure(1, weight=1)
        
        # ======================
        # Actions
        # ======================
        action_frame = ttk.LabelFrame(scrollable_frame, text="Actions", padding=10)
        action_frame.pack(fill=tk.X, padx=10, pady=5)
        
        ttk.Button(action_frame, text="Reset Calibration", command=self.reset_calibration).pack(fill=tk.X, pady=2)
        ttk.Button(action_frame, text="Save Calibration", command=self.save_calibration).pack(fill=tk.X, pady=2)
        
        # ======================
        # Extrinsic Matrix (compact)
        # ======================
        matrix_frame = ttk.LabelFrame(scrollable_frame, text="Extrinsic Matrix", padding=10)
        matrix_frame.pack(fill=tk.X, padx=10, pady=5)
        
        self.matrix_text = ScrolledText(matrix_frame, height=5, width=50, font=("Courier", 8))
        self.matrix_text.pack(fill=tk.X)
        
        # Update matrix display
        self.update_matrix_display()
        
        # Bind mousewheel to canvas
        def _on_mousewheel(event):
            canvas.yview_scroll(int(-1*(event.delta/120)), "units")
        canvas.bind_all("<MouseWheel>", _on_mousewheel)
        
    def load_config(self):
        """Load camera parameters from config file"""
        try:
            self.config = yaml_to_object(self.config_path)
            
            self.camera_matrix = np.array(self.config.camera.camera_matrix.copy())
            self.extrinsic_matrix = np.array(self.config.camera.extrinsic_matrix.copy())
            self.original_extrinsic = self.extrinsic_matrix.copy()
            
            # Validate matrices dimensions
            if self.camera_matrix.shape != (3, 3):
                raise ValueError(f"Camera matrix should be 3x3, got {self.camera_matrix.shape}")
            if self.extrinsic_matrix.shape != (4, 4):
                raise ValueError(f"Extrinsic matrix should be 4x4, got {self.extrinsic_matrix.shape}")
            
            print("Configuration loaded successfully")
            
        except IOError:
            print(f"Config file not found at {self.config_path}")
            # Create default matrices
            self.camera_matrix = np.array([
                [800, 0, 400],
                [0, 800, 300],
                [0, 0, 1]
            ])
            self.extrinsic_matrix = np.eye(4)
            self.original_extrinsic = self.extrinsic_matrix.copy()
    
    def init_calibration(self):
        """Initialize calibration modification matrices"""
        self.modification_list = []
        
        for i in range(12):
            transform_flag = [0] * 6
            transform_flag[i // 2] = 1 if i % 2 == 0 else -1
            
            tmp = np.eye(4)
            angle_x = transform_flag[0] * self.cali_scale_degree * pi / 180.0
            angle_y = transform_flag[1] * self.cali_scale_degree * pi / 180.0
            angle_z = transform_flag[2] * self.cali_scale_degree * pi / 180.0
            
            # Create rotation matrix
            if angle_x != 0:
                rot_x = np.array([
                    [1, 0, 0],
                    [0, np.cos(angle_x), -np.sin(angle_x)],
                    [0, np.sin(angle_x), np.cos(angle_x)]
                ])
                tmp[:3, :3] = rot_x
            elif angle_y != 0:
                rot_y = np.array([
                    [np.cos(angle_y), 0, np.sin(angle_y)],
                    [0, 1, 0],
                    [-np.sin(angle_y), 0, np.cos(angle_y)]
                ])
                tmp[:3, :3] = rot_y
            elif angle_z != 0:
                rot_z = np.array([
                    [np.cos(angle_z), -np.sin(angle_z), 0],
                    [np.sin(angle_z), np.cos(angle_z), 0],
                    [0, 0, 1]
                ])
                tmp[:3, :3] = rot_z
                
            # Add translation component
            tmp[0, 3] = transform_flag[3] * self.cali_scale_trans
            tmp[1, 3] = transform_flag[4] * self.cali_scale_trans
            tmp[2, 3] = transform_flag[5] * self.cali_scale_trans
            
            self.modification_list.append(tmp)
    
    def update_degree_scale(self, value):
        """Update degree scale for calibration"""
        self.cali_scale_degree = float(value)
        self.degree_label.config(text=f"{self.cali_scale_degree:.2f}°")
        self.init_calibration()
    
    def update_trans_scale(self, value):
        """Update translation scale for calibration"""
        self.cali_scale_trans = float(value)
        self.trans_label.config(text=f"{self.cali_scale_trans*100:.1f} cm")
        self.init_calibration()
    
    def update_intrinsic_scale(self, value):
        """更新內參調整步長"""
        self.cali_scale_intrinsic = float(value)
        self.intrinsic_label.config(text=f"{self.cali_scale_intrinsic:.3f}")
        print(f"內參調整步長已更新為: {self.cali_scale_intrinsic:.3f}")
    
    def apply_modification(self, index):
        """Apply calibration modification based on button click"""
        if 0 <= index < len(self.modification_list):
            self.extrinsic_matrix = self.extrinsic_matrix @ self.modification_list[index]
            self.update_matrix_display()
            print(f"Applied modification {index}")
    
    def apply_camera_intrinsic_modification(self, action):
        """根據按鈕點擊應用相機內參矩陣修改"""
        if action == '+fx':
            self.camera_matrix[0, 0] *= self.cali_scale_intrinsic
            print(f"fx 增加: {self.camera_matrix[0, 0]:.3f}")
        elif action == '-fx':
            self.camera_matrix[0, 0] /= self.cali_scale_intrinsic
            print(f"fx 減少: {self.camera_matrix[0, 0]:.3f}")
        elif action == '+fy':
            self.camera_matrix[1, 1] *= self.cali_scale_intrinsic
            print(f"fy 增加: {self.camera_matrix[1, 1]:.3f}")
        elif action == '-fy':
            self.camera_matrix[1, 1] /= self.cali_scale_intrinsic
            print(f"fy 減少: {self.camera_matrix[1, 1]:.3f}")
        
        # 更新相機內參顯示和發布
        self.update_camera_matrix_display()
        self.publish_camera_matrix()

    def update_camera_matrix_display(self):
        """更新相機內參矩陣顯示（在 GUI 中添加顯示區域）"""
        # 如果需要在 GUI 中顯示相機內參，可以添加一個 Text widget
        print("相機內參矩陣:")
        for i in range(3):
            row_str = "["
            for j in range(3):
                row_str += f"{self.camera_matrix[i, j]:8.3f} "
            row_str += "]"
            print(row_str)
    
    def publish_camera_matrix(self):
        """發布相機內參矩陣到 ROS"""
        matrix_msg = Float32MultiArray()
        matrix_msg.data = self.camera_matrix.flatten().tolist()
        self.ros_node.intrinsic_pub.publish(matrix_msg)
        print("已發布相機內參矩陣到 ROS")

    def reset_calibration(self):
        """Reset calibration to original values"""
        self.extrinsic_matrix = self.original_extrinsic.copy()

        # 重置相機內參到原始值
        if hasattr(self, 'original_camera_matrix'):
            self.camera_matrix = self.original_camera_matrix.copy()
        else:
            # 如果沒有原始內參，從配置重新載入
            self.camera_matrix = np.array(self.config.camera.camera_matrix.copy())
            
        self.update_matrix_display()
        self.update_camera_matrix_display()
        print("Calibration reset to original values")
    
    def update_matrix_display(self):
        """Update displayed transformation matrix"""
        self.matrix_text.delete(1.0, tk.END)
        
        matrix_str = ""
        for i in range(4):
            row_str = "["
            for j in range(4):
                row_str += f"{self.extrinsic_matrix[i, j]:6.3f} "
            row_str += "]\n"
            matrix_str += row_str
        
        self.matrix_text.insert(1.0, matrix_str)
        
        # Publish matrix to ROS
        matrix_msg = Float32MultiArray()
        matrix_msg.data = self.extrinsic_matrix.flatten().tolist()
        self.ros_node.matrix_pub.publish(matrix_msg)
    
    def update_matrix_from_auto_calib(self, msg):
        """Update extrinsic matrix from auto calibration message"""
        self.extrinsic_matrix = np.array(msg.data).reshape(4, 4)
        self.root.after(0, self.update_matrix_display)  # Thread-safe GUI update
        print("Received new extrinsic matrix from auto calibration")
    
    def send_action(self, action):
        """Send optimization action via ROS"""
        method = self.method_var.get()
        sample_interval = self.sample_interval_var.get()
        optimize_filter = self.optimize_filter_var.get()
        vx_filter = self.vx_filter_var.get()
        vy_filter = self.vy_filter_var.get()
        camera_filter_x = self.camera_filter_x_var.get()
        camera_filter_y = self.camera_filter_y_var.get()
        radar_trajectory = self.show_radar_trajectory.get()
        
        payload = json.dumps([action, method, sample_interval, optimize_filter, 
                            vx_filter, vy_filter, camera_filter_x, camera_filter_y, radar_trajectory])
        msg = String()
        msg.data = payload
        self.ros_node.optimize_action_pub.publish(msg)
        print(f"已送出動作: {action}, 方法: {method}, 取樣間隔: {sample_interval}, 雷達軌跡: {radar_trajectory}")
    
    def save_calibration(self):
        """Save current calibration to a file"""
        self.config.camera.extrinsic_matrix = self.extrinsic_matrix.tolist()
        self.config.camera.camera_matrix = self.camera_matrix.tolist()  # 儲存內參
        
        file_path = self.config_path
        if file_path:
            if not file_path.endswith('.yaml'):
                file_path += '.yaml'
            with open(file_path, 'w', encoding='utf-8') as file:
                yaml.dump(self.config.to_dict(), file, sort_keys=False)
            
            messagebox.showinfo("儲存成功", f"校正已儲存至 {file_path}")
            print(f"Calibration saved to {file_path}")
    
    def run(self):
        """Start the GUI main loop"""
        self.root.mainloop()

def main():
    print("正在初始化 ROS2...")
    
    # Initialize ROS2
    rclpy.init()
    
    # Create ROS node
    ros_node = ROSNode()
    
    print("正在啟動 GUI...")
    
    # Create and run GUI
    try:
        gui = ProjectorGUI(ros_node)
        
        # Start ROS spinning in separate thread
        def spin_ros():
            try:
                rclpy.spin(ros_node)
            except Exception as e:
                print(f"ROS spinning error: {e}")
        
        ros_thread = threading.Thread(target=spin_ros)
        ros_thread.daemon = True
        ros_thread.start()
        
        gui.run()
        
    except KeyboardInterrupt:
        print("使用者中斷")
    except Exception as e:
        print(f"GUI 錯誤: {e}")
    finally:
        # Cleanup
        print("正在清理資源...")
        try:
            ros_node.destroy_node()
            rclpy.shutdown()
        except Exception as e:
            print(f"清理資源時發生錯誤: {e}")

if __name__ == "__main__":
    main()