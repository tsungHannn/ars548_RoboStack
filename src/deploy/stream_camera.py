#!/usr/bin/env python

import rospy
from sensor_msgs.msg import Image, CompressedImage
from cv_bridge import CvBridge
import cv2
import numpy as np
from rotpy.camera import CameraList
from rotpy.system import SpinSystem

class DualSpinnakerCameraNode:
    def __init__(self):
        # Initialize ROS node
        rospy.init_node('dual_flir_camera_node', anonymous=True)
        
        # Set up ROS publishers for camera 1
        self.image_pub_1 = rospy.Publisher('/aravis_cam1/image_color', Image, queue_size=10)
        self.image_calib_pub_1 = rospy.Publisher('/aravis_cam1/image_color_calib', Image, queue_size=10)
        self.compressed_image_pub_1 = rospy.Publisher('/aravis_cam1/image_color/compressed', CompressedImage, queue_size=10)
        
        # Set up ROS publishers for camera 2
        self.image_pub_2 = rospy.Publisher('/aravis_cam2/image_color', Image, queue_size=10)
        self.image_calib_pub_2 = rospy.Publisher('/aravis_cam2/image_color_calib', Image, queue_size=10)
        self.compressed_image_pub_2 = rospy.Publisher('/aravis_cam2/image_color/compressed', CompressedImage, queue_size=10)
        
        self.bridge = CvBridge()
        
        # Spinnaker camera setup
        self.system = SpinSystem()
        self.cameras = CameraList.create_from_system(
            self.system, update_cams=True, update_interfaces=True
        )
        
        # Check if at least 2 cameras are available
        num_cameras = self.cameras.get_size()
        if num_cameras == 0:
            rospy.logerr("沒有找到攝影機!")
            return
        elif num_cameras == 1:
            rospy.logwarn("只找到一台攝影機，將只啟動一台攝影機")
        else:
            rospy.loginfo(f"找到 {num_cameras} 台攝影機")
            
        # Initialize cameras
        self.camera_1 = None
        self.camera_2 = None
        self.handler_1 = None
        self.handler_2 = None
        
        # Setup camera 1
        self.camera_1 = self.cameras.create_camera_by_index(0)
        self.camera_1.init_cam()
        self.handler_1 = self.camera_1.attach_image_event_handler(
            lambda handler, camera, image: self.image_callback(handler, camera, image, camera_id=1)
        )
        rospy.loginfo("攝影機 1 初始化成功")
        
        # Setup camera 2 if available
        if num_cameras >= 2:
            self.camera_2 = self.cameras.create_camera_by_index(1)
            self.camera_2.init_cam()
            self.handler_2 = self.camera_2.attach_image_event_handler(
                lambda handler, camera, image: self.image_callback(handler, camera, image, camera_id=2)
            )
            rospy.loginfo("攝影機 2 初始化成功")
        
        # Node settings
        self.running = False
        
        rospy.loginfo("雙攝影機節點初始化完成")
        
    def image_callback(self, handler, camera, image, camera_id):
        if not self.running:
            return

        try:
            image = image.convert_fmt('RGB8')
            
            frame_id = image.get_frame_id()
            timestamp = image.get_frame_timestamp()
        
            # Convert image to OpenCV format
            img_data = image.get_image_data()
            img_width = image.get_width()
            img_height = image.get_height()
        
            # Create numpy array from image data
            np_array = np.array(img_data, dtype=np.uint8).reshape(img_height, img_width, 3)
            np_array = cv2.resize(np_array, (2048, 1536))
            np_array = cv2.cvtColor(np_array, cv2.COLOR_RGB2BGR)
        
            # Create ROS timestamp
            ros_timestamp = rospy.Time.now()
            
            # Convert OpenCV image to ROS image message
            ros_image = self.bridge.cv2_to_imgmsg(np_array, '8UC3')
            ros_image_calib = self.bridge.cv2_to_imgmsg(np_array, 'bgr8')
            
            try:
                ros_image.header.stamp = ros_timestamp
                ros_image_calib.header.stamp = ros_timestamp
                ros_image.header.frame_id = f"camera_{camera_id}"
                ros_image_calib.header.frame_id = f"camera_{camera_id}"

                # Publish to appropriate topics based on camera ID
                if camera_id == 1:
                    self.compressed_image_pub_1.publish(self.bridge.cv2_to_compressed_imgmsg(np_array))
                    self.image_pub_1.publish(ros_image)
                    self.image_calib_pub_1.publish(ros_image_calib)
                elif camera_id == 2:
                    self.compressed_image_pub_2.publish(self.bridge.cv2_to_compressed_imgmsg(np_array))
                    self.image_pub_2.publish(ros_image)
                    self.image_calib_pub_2.publish(ros_image_calib)
                    
            except Exception as e:
                rospy.logerr(f"攝影機 {camera_id} 轉換/發布影像時出錯: {e}")
                
        except Exception as e:
            rospy.logerr(f"攝影機 {camera_id} 處理影像時出錯: {str(e)}")
                
    def start(self):
        """開始攝影機採集"""
        self.running = True
        
        if self.camera_1:
            self.camera_1.begin_acquisition()
            rospy.loginfo("攝影機 1 開始採集")
            
        if self.camera_2:
            self.camera_2.begin_acquisition()
            rospy.loginfo("攝影機 2 開始採集")
        
    def stop(self):
        """停止攝影機採集"""
        self.running = False
        
        if self.camera_1:
            self.camera_1.end_acquisition()
            rospy.loginfo("攝影機 1 停止採集")
            
        if self.camera_2:
            self.camera_2.end_acquisition()
            rospy.loginfo("攝影機 2 停止採集")
        
    def cleanup(self):
        """清理資源"""
        try:
            self.stop()
            
            # Cleanup camera 1
            if self.camera_1 and self.handler_1:
                self.camera_1.detach_image_event_handler(self.handler_1)
                self.camera_1.deinit_cam()
                self.camera_1.release()
                rospy.loginfo("攝影機 1 資源已釋放")
                
            # Cleanup camera 2
            if self.camera_2 and self.handler_2:
                self.camera_2.detach_image_event_handler(self.handler_2)
                self.camera_2.deinit_cam()
                self.camera_2.release()
                rospy.loginfo("攝影機 2 資源已釋放")
                
        except Exception as e:
            rospy.logerr(f"清理時出錯: {e}")

def main():
    camera_node = DualSpinnakerCameraNode()
    
    try:
        camera_node.start()
        # Keep the node running until shutdown
        rospy.spin()
    except KeyboardInterrupt:
        rospy.loginfo("正在關閉...")
    finally:
        camera_node.cleanup()
        
if __name__ == "__main__":
    main()