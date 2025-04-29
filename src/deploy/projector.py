import json
import numpy as np
import sys
from PyQt5.QtWidgets import (QApplication, QMainWindow, QVBoxLayout, QHBoxLayout, 
                           QWidget, QPushButton, QSlider, QLabel, QCheckBox, 
                           QGroupBox, QGridLayout, QFileDialog, QComboBox)
from PyQt5.QtCore import Qt
from math import pi

import rospy
from std_msgs.msg import Float32MultiArray, String

class Projector(QMainWindow):
    def __init__(self, config_path='config.json'):
        """
        Initialize camera projector with interactive controls.
        
        Args:
            config_path (str): Path to configuration JSON file
        """
        super().__init__()

        rospy.init_node('control_panel_gui', anonymous=True)

        self.matrix_pub = rospy.Publisher('/control/matrix', Float32MultiArray, queue_size=10)
        self.optimize_action_pub = rospy.Publisher('/control/optimize_action', String, queue_size=1)

        self.matrix_sub = rospy.Subscriber('/radar/extrinsic_matrix', Float32MultiArray, self.update_matrix_from_auto_calib)
        
        # Camera parameters
        self.config_path = config_path
        self.camera_matrix = None
        self.extrinsic_matrix = None 
        self.original_extrinsic = None
        
        # Calibration parameters
        self.cali_scale_degree = 0.2
        self.cali_scale_trans = 0.03
        self.modification_list = []
        self.display_mode = False

        # Load config and initialize parameters
        self.load_config()
        self.init_calibration()
        
        # UI setup
        self.initUI()

    def initUI(self):
        """Initialize the UI components"""
        self.setWindowTitle('Interactive Camera Projector')
        self.setGeometry(100, 100, 400, 800)
        
        # Main layout
        main_layout = QHBoxLayout()
        
        # Left panel for controls
        control_panel = QGroupBox("Controls")
        control_layout = QVBoxLayout()
        
        # Calibration scale controls
        scale_group = QGroupBox("Calibration Scale")
        scale_layout = QGridLayout()
        
        # Degree step slider
        deg_step_label = QLabel("Degree Step:")
        self.deg_step_slider = QSlider(Qt.Horizontal)
        self.deg_step_slider.setRange(1, 100)  # 0.01 to 1.0 degree
        self.deg_step_slider.setValue(int(self.cali_scale_degree * 100))
        self.deg_step_slider.valueChanged.connect(self.update_degree_scale)
        self.deg_step_value = QLabel(f"{self.cali_scale_degree:.2f}°")
        scale_layout.addWidget(deg_step_label, 0, 0)
        scale_layout.addWidget(self.deg_step_slider, 0, 1)
        scale_layout.addWidget(self.deg_step_value, 0, 2)
        
        # Translation step slider
        trans_step_label = QLabel("Trans Step (cm):")
        self.trans_step_slider = QSlider(Qt.Horizontal)
        self.trans_step_slider.setRange(1, 150)  # 0.01 to 1.5 cm
        self.trans_step_slider.setValue(int(self.cali_scale_trans * 100))
        self.trans_step_slider.valueChanged.connect(self.update_trans_scale)
        self.trans_step_value = QLabel(f"{self.cali_scale_trans*100:.1f} cm")
        scale_layout.addWidget(trans_step_label, 1, 0)
        scale_layout.addWidget(self.trans_step_slider, 1, 1)
        scale_layout.addWidget(self.trans_step_value, 1, 2)
        
        scale_group.setLayout(scale_layout)
        
        # Transformation controls
        transform_group = QGroupBox("Transformation Controls")
        transform_layout = QGridLayout()
        
        # Rotation buttons
        self.rot_buttons = {}
        # X rotation
        self.rot_buttons['add_x'] = QPushButton("+ X°")
        self.rot_buttons['add_x'].clicked.connect(lambda: self.apply_modification(0))
        self.rot_buttons['minus_x'] = QPushButton("- X°")
        self.rot_buttons['minus_x'].clicked.connect(lambda: self.apply_modification(1))
        
        # Y rotation
        self.rot_buttons['add_y'] = QPushButton("+ Y°") 
        self.rot_buttons['add_y'].clicked.connect(lambda: self.apply_modification(2))
        self.rot_buttons['minus_y'] = QPushButton("- Y°")
        self.rot_buttons['minus_y'].clicked.connect(lambda: self.apply_modification(3))
        
        # Z rotation
        self.rot_buttons['add_z'] = QPushButton("+ Z°")
        self.rot_buttons['add_z'].clicked.connect(lambda: self.apply_modification(4))
        self.rot_buttons['minus_z'] = QPushButton("- Z°")
        self.rot_buttons['minus_z'].clicked.connect(lambda: self.apply_modification(5))
        
        # Translation buttons
        self.trans_buttons = {}
        # X translation
        self.trans_buttons['add_x'] = QPushButton("+ X")
        self.trans_buttons['add_x'].clicked.connect(lambda: self.apply_modification(6))
        self.trans_buttons['minus_x'] = QPushButton("- X")
        self.trans_buttons['minus_x'].clicked.connect(lambda: self.apply_modification(7))
        
        # Y translation
        self.trans_buttons['add_y'] = QPushButton("+ Y")
        self.trans_buttons['add_y'].clicked.connect(lambda: self.apply_modification(8))
        self.trans_buttons['minus_y'] = QPushButton("- Y")
        self.trans_buttons['minus_y'].clicked.connect(lambda: self.apply_modification(9))
        
        # Z translation
        self.trans_buttons['add_z'] = QPushButton("+ Z")
        self.trans_buttons['add_z'].clicked.connect(lambda: self.apply_modification(10))
        self.trans_buttons['minus_z'] = QPushButton("- Z")
        self.trans_buttons['minus_z'].clicked.connect(lambda: self.apply_modification(11))
        
        # Add rotation buttons to layout
        rot_label = QLabel("Rotation:")
        transform_layout.addWidget(rot_label, 0, 0)
        transform_layout.addWidget(self.rot_buttons['add_x'], 1, 0)
        transform_layout.addWidget(self.rot_buttons['minus_x'], 1, 1)
        transform_layout.addWidget(self.rot_buttons['add_y'], 2, 0)
        transform_layout.addWidget(self.rot_buttons['minus_y'], 2, 1)
        transform_layout.addWidget(self.rot_buttons['add_z'], 3, 0)
        transform_layout.addWidget(self.rot_buttons['minus_z'], 3, 1)
        
        # Add translation buttons to layout
        trans_label = QLabel("Translation:")
        transform_layout.addWidget(trans_label, 4, 0)
        transform_layout.addWidget(self.trans_buttons['add_x'], 5, 0)
        transform_layout.addWidget(self.trans_buttons['minus_x'], 5, 1)
        transform_layout.addWidget(self.trans_buttons['add_y'], 6, 0)
        transform_layout.addWidget(self.trans_buttons['minus_y'], 6, 1)
        transform_layout.addWidget(self.trans_buttons['add_z'], 7, 0)
        transform_layout.addWidget(self.trans_buttons['minus_z'], 7, 1)
        
        transform_group.setLayout(transform_layout)
        
        # Optimization buttons
        auto_calib_group = QGroupBox("Auto Calibration")
        auto_calib_layout = QVBoxLayout()
        self.record_start_button = QPushButton("開始錄製")
        self.record_start_button.clicked.connect(lambda: self.send_action("record_start"))

        self.record_stop_button = QPushButton("停止錄製")
        self.record_stop_button.clicked.connect(lambda: self.send_action("record_stop"))

        self.clear_button = QPushButton("清除片段")
        self.clear_button.clicked.connect(lambda: self.send_action("clear"))

        self.optimize_button = QPushButton("開始優化")
        self.optimize_button.clicked.connect(lambda: self.send_action("optimize"))

        # Method selection
        method_label = QLabel("選擇優化方法:")
        self.method_combo = QComboBox()
        self.method_combo.addItems(["L-BFGS-B", "Powell", "Nelder-Mead"])
        self.method_combo.setCurrentText("L-BFGS-B")
        # self.method_combo.currentTextChanged.connect(self.send_action)

        auto_calib_layout.addWidget(method_label)
        auto_calib_layout.addWidget(self.method_combo)
        auto_calib_layout.addWidget(self.record_start_button)
        auto_calib_layout.addWidget(self.record_stop_button)
        auto_calib_layout.addWidget(self.clear_button)
        auto_calib_layout.addWidget(self.optimize_button)
        auto_calib_group.setLayout(auto_calib_layout)

        # Action buttons
        action_group = QGroupBox("Actions")
        action_layout = QVBoxLayout()
        
        self.reset_button = QPushButton("Reset Calibration")
        self.reset_button.clicked.connect(self.reset_calibration)
        
        self.save_button = QPushButton("Save Calibration")
        self.save_button.clicked.connect(self.save_calibration)
        
        action_layout.addWidget(self.reset_button)
        action_layout.addWidget(self.save_button)
        action_group.setLayout(action_layout)
        
        # Add all groups to control panel
        control_layout.addWidget(scale_group)
        control_layout.addWidget(transform_group)
        control_layout.addWidget(auto_calib_group)
        control_layout.addWidget(action_group)
        control_layout.addStretch(1)
        control_panel.setLayout(control_layout)
        
        # Information display
        self.info_label = QLabel("Extrinsic Matrix:")
        self.matrix_label = QLabel()
        self.update_matrix_display()

        # Add info and matrix labels to control panel
        control_layout.addWidget(self.info_label)
        control_layout.addWidget(self.matrix_label)
        
        # Add panels to main layout
        main_layout.addWidget(control_panel, 1)
        
        # Set up central widget
        central_widget = QWidget()
        central_widget.setLayout(main_layout)
        self.setCentralWidget(central_widget)

        self.update_matrix_display()
        
    def load_config(self):
        """Load camera parameters from config file"""
        try:
            with open(self.config_path, 'r') as f:
                config = json.load(f)['camera']
            
            self.camera_matrix = np.array(config.get('camera_matrix'))
            self.extrinsic_matrix = np.array(config.get('extrinsic_matrix'))
            self.original_extrinsic = self.extrinsic_matrix.copy()
            
            # Validate matrices dimensions
            if self.camera_matrix.shape != (3, 3):
                raise ValueError(f"Camera matrix should be 3x3, got {self.camera_matrix.shape}")
            if self.extrinsic_matrix.shape != (4, 4):
                raise ValueError(f"Extrinsic matrix should be 4x4, got {self.extrinsic_matrix.shape}")
            
            print("Configuration loaded successfully")
            
        except FileNotFoundError:
            print(f"Config file not found at {self.config_path}")
            # Create default matrices
            self.camera_matrix = np.array([
                [800, 0, 400],
                [0, 800, 300],
                [0, 0, 1]
            ])
            self.extrinsic_matrix = np.eye(4)
            self.original_extrinsic = self.extrinsic_matrix.copy()
            
        except json.JSONDecodeError:
            print(f"Invalid JSON in config file {self.config_path}")
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
            
            # Create rotation matrix (simplified)
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
            
        print("Calibration scale initialized")
    
    def update_calibration_scale(self):
        """Update calibration matrices based on current scale parameters"""
        self.init_calibration()
    
    def update_degree_scale(self, value):
        """Update degree scale for calibration"""
        self.cali_scale_degree = value / 100.0
        self.deg_step_value.setText(f"{self.cali_scale_degree:.2f}°")
        self.update_calibration_scale()
    
    def update_trans_scale(self, value):
        """Update translation scale for calibration"""
        self.cali_scale_trans = value / 100.0
        self.trans_step_value.setText(f"{self.cali_scale_trans*100:.1f} cm")
        self.update_calibration_scale()
    
    def toggle_display_mode(self, state):
        """Toggle between intensity and color display modes"""
        self.display_mode = state == Qt.Checked
    
    def apply_modification(self, index):
        """Apply calibration modification based on button click"""
        if 0 <= index < len(self.modification_list):
            self.extrinsic_matrix = self.extrinsic_matrix @ self.modification_list[index]
            self.update_matrix_display()
            print(f"Applied modification {index}")
    
    def reset_calibration(self):
        """Reset calibration to original values"""
        self.extrinsic_matrix = self.original_extrinsic.copy()
        self.update_matrix_display()
        print("Calibration reset to original values")
    
    def update_matrix_display(self):
        """Update displayed transformation matrix"""
        matrix_str = "<pre>"
        for i in range(4):
            row_str = "["
            for j in range(4):
                row_str += f"{self.extrinsic_matrix[i, j]:8.4f} "
            row_str += "]"
            matrix_str += row_str + "<br>"
        matrix_str += "</pre>"
        self.matrix_label.setText(matrix_str)

        # Publish matrix to ROS
        matrix_msg = Float32MultiArray()
        matrix_msg.data = self.extrinsic_matrix.flatten().tolist()
        self.matrix_pub.publish(matrix_msg)
    
    def update_matrix_from_auto_calib(self, msg):
        """Update extrinsic matrix from auto calibration message"""
        self.extrinsic_matrix = np.array(msg.data).reshape(4, 4)
        self.update_matrix_display()
        print("Received new extrinsic matrix from auto calibration")
        

    # Optimization action
    def send_action(self, action):
        method = self.method_combo.currentText()
        payload = json.dumps([action, method])
        msg = String(data=payload)
        self.optimize_action_pub.publish(msg)
        print(f"已送出動作: {action}, 方法: {method}")


    def save_calibration(self):
        """Save current calibration to a file"""
        file_path, _ = QFileDialog.getSaveFileName(
            self, "Save Calibration", "", "Text Files (*.txt);;JSON Files (*.json)"
        )
        
        if file_path:
            if file_path.endswith('.json'):
                # Save as JSON
                data = {
                    'camera_matrix': self.camera_matrix.tolist(),
                    'extrinsic_matrix': self.extrinsic_matrix.tolist()
                }
                with open(file_path, 'w') as f:
                    json.dump(data, f, indent=2)
            else:
                # Save as text
                with open(file_path, 'w') as f:
                    f.write("Extrinsic:\n")
                    f.write("R:\n")
                    for i in range(3):
                        for j in range(3):
                            f.write(f"{self.extrinsic_matrix[i, j]} ")
                        f.write("\n")
                    
                    f.write("t: ")
                    for i in range(3):
                        f.write(f"{self.extrinsic_matrix[i, 3]} ")
                    f.write("\n\n")
                    
                    f.write("************* json format *************\n")
                    f.write("Extrinsic:\n")
                    for i in range(4):
                        f.write("[")
                        for j in range(4):
                            f.write(f"{self.extrinsic_matrix[i, j]}")
                            if j < 3:
                                f.write(",")
                        f.write("]")
                        if i < 3:
                            f.write(",")
                    f.write("\n")
            
            print(f"Calibration saved to {file_path}")
    
    def project_points(self, points_3d, camera_matrix=None, extrinsic_matrix=None):
        """
        Project 3D points to 2D using camera and extrinsic matrices.
        
        Args:
            points_3d (array-like): 3D points to project, shape (N, 3)
            camera_matrix (numpy.ndarray, optional): Camera intrinsic matrix
            extrinsic_matrix (numpy.ndarray, optional): Camera extrinsic matrix
            
        Returns:
            numpy.ndarray: Projected 2D points, shape (N, 2)
        """
        # Use default matrices if not provided
        camera_matrix = self.camera_matrix if camera_matrix is None else camera_matrix
        extrinsic_matrix = self.extrinsic_matrix if extrinsic_matrix is None else extrinsic_matrix
        
        # Convert to numpy array if not already
        points_3d = np.asarray(points_3d)
        
        # Homogenize the 3D points
        points_3d = np.hstack([points_3d, np.ones((points_3d.shape[0], 1))])
        
        # Transform points to camera coordinate system
        points_3d = (extrinsic_matrix @ points_3d.T)[:3, :]
        
        # Project to image plane
        points_2d = camera_matrix @ points_3d
        
        # Normalize by dividing by the z-coordinate
        points_2d[:2, :] /= points_2d[2, :]
        
        # Return only x, y coordinates
        points_2d = points_2d[:2, :].T
        
        return points_2d


def main():
    app = QApplication(sys.argv)
    projector = Projector()
    projector.show()
    sys.exit(app.exec_())

if __name__ == "__main__":
    main()