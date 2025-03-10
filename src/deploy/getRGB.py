#! /usr/bin/env python3

import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge 
import cv2
from pynput import keyboard



class ImageSaver:
    def __init__(self):
        rospy.init_node('image_svaer', anonymous=True)

        self.count = 0
        # Subscribe to the camera topic
        self.image_sub = rospy.Subscriber('/aravis_cam/image_color', Image, self.image_callback)
        self.bridge = CvBridge()
        self.cv_image = None
        self.listener = keyboard.Listener(on_press=self.on_press)
        self.listener.start()
        

    def image_callback(self, data):
        try:
            # Convert ROS Image message to OpenCV image
            self.cv_image = self.bridge.imgmsg_to_cv2(data, desired_encoding='8UC3')
        except:
            rospy.logerr('CvBridge Error: {0}'.format(e))


    def on_press(self, key):
        # Save image when space key is pressed
        if key == keyboard.Key.space:
            self.save_image()


    def save_image(self):
        if self.cv_image is not None:
            filename = '/home/ncsist/bags/pic/' + str(self.count) + '.png'
            cv2.imwrite(filename, self.cv_image)
            rospy.loginfo(f"Image saved as {filename}")
            self.count += 1

    def run(self):
        rospy.spin()


if __name__ == "__main__":
    try:
        image_saver = ImageSaver()
        image_saver.run()
    except rospy.ROSInterruptException:
        pass
