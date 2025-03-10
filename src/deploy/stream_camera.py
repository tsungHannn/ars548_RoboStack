#!/usr/bin/env python

import rospy
from sensor_msgs.msg import Image, CompressedImage
from cv_bridge import CvBridge
import cv2
import numpy as np
from rotpy.camera import CameraList
from rotpy.system import SpinSystem

class SpinnakerCameraNode:
    def __init__(self):
        # Initialize ROS node
        rospy.init_node('flir_camera_node', anonymous=True)
        
        # Set up ROS publisher
        self.image_pub = rospy.Publisher('/aravis_cam/image_color', Image, queue_size=10)
        self.compressed_image_pub = rospy.Publisher('/aravis_cam/image_color/compressed', CompressedImage, queue_size=10)
        self.bridge = CvBridge()
        
        # Spinnaker camera setup
        self.system = SpinSystem()
        self.cameras = CameraList.create_from_system(
            self.system, update_cams=True, update_interfaces=True
        )
        
        # Check if cameras are available
        if self.cameras.get_size() == 0:
            rospy.logerr("No cameras found!")
            return
            
        # Get the first camera and initialize it
        self.camera = self.cameras.create_camera_by_index(0)
        # print(self.camera)
        self.camera.init_cam()
        
        # Set up image handler
        self.handler = self.camera.attach_image_event_handler(self.image_callback)
        
        # Node settings
        self.running = False
        
        rospy.loginfo("Spinnaker camera node initialized successfully")
        
    def image_callback(self, handler, camera, image):
        if not self.running:
            return

        try:
            image = image.convert_fmt('RGB8')
            # print(image.get_pix_fmt(), image.get_bits_per_pixel(), image.get_width(), image.get_height())
            
            frame_id = image.get_frame_id()
            timestamp = image.get_frame_timestamp()
            #rospy.loginfo(f'Image: {frame_id} {timestamp}')
        
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
            #rospy.loginfo(f'Image: {frame_id} {timestamp}')
            
            # Convert OpenCV image to ROS image message
            try:
                ros_image = self.bridge.cv2_to_imgmsg(np_array, '8UC3')
                ros_image.header.stamp = ros_timestamp

                self.compressed_image_pub.publish(self.bridge.cv2_to_compressed_imgmsg(np_array))
            
                self.image_pub.publish(ros_image)
            except Exception as e:
                rospy.logerr(f"Error converting/publishing image: {e}")
            #rospy.loginfo(f'Image: {frame_id} {timestamp}')
        except Exception as e:
            rospy.logerr(str(e))
                
    def start(self):
        """Start the camera acquisition"""
        self.running = True
        self.camera.begin_acquisition()
        rospy.loginfo("Camera acquisition started")
        
    def stop(self):
        """Stop the camera acquisition"""
        self.running = False
        self.camera.end_acquisition()
        rospy.loginfo("Camera acquisition stopped")
        
    def cleanup(self):
        """Clean up resources"""
        try:
            self.stop()
            self.camera.detach_image_event_handler(self.handler)
            self.camera.deinit_cam()
            self.camera.release()
            rospy.loginfo("Camera resources released")
        except Exception as e:
            rospy.logerr(f"Error during cleanup: {e}")
            
def main():
    camera_node = SpinnakerCameraNode()
    
    try:
        camera_node.start()
        # Keep the node running until shutdown
        rospy.spin()
    except KeyboardInterrupt:
        rospy.loginfo("Shutting down")
    finally:
        camera_node.cleanup()
        
if __name__ == "__main__":
    main()
