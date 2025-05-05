#!/usr/bin/env python
# -*- coding: utf-8 -*-

import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import cv2


class ImageDisplayNode:
    def __init__(self):
        rospy.init_node('image_display_node', anonymous=True)

        # 從參數伺服器讀取 topic 名稱，預設為 "/camera/image_raw"
        image_topic = rospy.get_param("~image_topic", "/aravis_cam/image_color")
        rospy.loginfo("Subscribing to image topic: %s", image_topic)

        self.bridge = CvBridge()
        self.image_sub = rospy.Subscriber(image_topic, Image, self.image_callback)
    
    def image_callback(self, data):
        try:
            # 將 ROS 影像轉成 OpenCV 格式（BGR）
            cv_image = self.bridge.imgmsg_to_cv2(data, desired_encoding='bgr8')
        except CvBridgeError as e:
            rospy.logerr("CvBridge Error: %s", e)
            return

        # 顯示影像
        cv2.imshow("ROS Image Viewer", cv_image)
        key = cv2.waitKey(1)
        if key == 27:  # 按下 ESC 鍵退出
            rospy.signal_shutdown("ESC pressed, shutting down.")

    def run(self):
        rospy.spin()
        cv2.destroyAllWindows()


if __name__ == '__main__':
    try:
        node = ImageDisplayNode()
        node.run()
    except rospy.ROSInterruptException:
        pass
