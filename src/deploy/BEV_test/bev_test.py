# -*- coding: utf-8 -*-
"""
Created on Tue Aug 19 22:23:13 2025

@author: poww
"""

import cv2
import json

import numpy as np

import os
import sys

import tkinter as tk
from tkinter import filedialog

"""
-------------------------------------
main(): main function 
-------------------------------------
"""
def main():
    # (1) load the road layout image
    file_path = tk_open_file("/home/mvclab/workspace/ncsist/ars548_RoboStack/src/deploy/BEV_test/", "選擇道路布局鳥瞰視角影像")
    
    if not file_path:
        sys.exit("未選擇任何檔案")
        
    # load the base image
    layout_im = cv2.imread(file_path)
    cv2.imshow("layout", layout_im)    
    
    # (2) load the file_paths of bev images, homography, and affines of all views
    # compute the json file
    json_file_path = os.path.splitext(file_path)[0] + ".json"

    # load the json files
    rsv_file_paths, homographys, affines = load_json(json_file_path)
        
    # show the left and right bev images
    left_im = cv2.imread(rsv_file_paths[0])
    left_im = cv2.resize(left_im, None, fx=0.5, fy=0.5, interpolation=cv2.INTER_LINEAR)

    right_im = cv2.imread(rsv_file_paths[1])
    right_im = cv2.resize(right_im, None, fx=0.5, fy=0.5, interpolation=cv2.INTER_LINEAR)
    
    cv2.imshow("left", left_im)    
    cv2.imshow("right", right_im)    
    
    # (3) setup the left and right mouse callback methods
    # setup left mouse callback method
    left_x = 0
    left_y = 0
    left_param={
            "x": left_x,
            "y": left_y,
          }
    cv2.setMouseCallback("left", left_mouse_callback, param=left_param) 

    # setup right mouse callback method
    right_x = 0
    right_y = 0
    right_param={
            "x": right_x,
            "y": right_y,
          }
    cv2.setMouseCallback("right", right_mouse_callback, param=right_param) 

    while True:
        # show the left and right images
        left_canvas = draw_points(left_im, [[left_param["x"], left_param["y"]]], (0, 255, 0))
        right_canvas = draw_points(right_im, [[right_param["x"], right_param["y"]]], (255, 0, 0))
        cv2.imshow("left", left_canvas)    
        cv2.imshow("right", right_canvas)    
        
        # show the layout image
        pt = transform_rsv2bev([left_param["x"], left_param["y"]], homographys[0], affines[0])
        layout_canvas = draw_points(layout_im, [pt], (0, 255, 0))
        
        pt = transform_rsv2bev([right_param["x"], right_param["y"]], homographys[1], affines[1])
        layout_canvas = draw_points(layout_canvas, [pt], (255, 0, 0))
        cv2.imshow("layout", layout_canvas)    
        
        # read one key 
        key = cv2.waitKey(50)
        
        # press ESC key to exit
        if key == 27:  #ESC
            break
       
    cv2.destroyAllWindows()

'''
draw_points(): show a list of points

    receive:
        image: input image
        points: a list of points [[x1, y1], [x2, y2], [x3, y3], ...]
    
    return:
        overlay: an image with the quad overlaied on the input image
'''
def draw_points(image, points, color = (0, 0, 255)):
    draw_im = image.copy()  ### 建立覆蓋層

    # draw the four points of the quad    
    for idx, pt in enumerate(points, start=1):
        # draw the point of the quad
        cv2.circle(draw_im, pt, 5, color, -1)
        
        # show the point coordinate
        text = f"P{idx}{pt}"  # 例如 "P1(222, 237)"
        pos = (pt[0] + 5, pt[1] - 5)  # 座標文字略偏移
        cv2.putText(draw_im, text, pos, cv2.FONT_HERSHEY_SIMPLEX, 0.4, color, 1, cv2.LINE_AA)
    
    return draw_im

'''
left_mouse_callback(): show the four points of a quad
'''
def left_mouse_callback(event, x, y, flags, param): 
    if event == cv2.EVENT_LBUTTONDOWN:        
        # add to markers
        param["x"] = x
        param["y"] = y

'''
load_json(): load the data in the json file including homography matrix and four corresponding points
    receive:
        file_path: file path of the json file
        
    return:
        homography: homography matrix
        markers: marker points
'''
def load_json(file_path):
    # load the homography matrix
    with open(file_path, "r") as file:
        json_data = json.load(file)
        
        # laod the bev file
        rsv_file_paths = json_data["rsv_paths"]
        
        #load homography and markers
        homographys = json_data["homographys"]
        homographys = np.asarray(homographys)

        affines = json_data["affines"]
        affines = np.asarray(affines)
    return rsv_file_paths, homographys, affines    


'''
right_mouse_callback(): show the four points of a quad
'''
def right_mouse_callback(event, x, y, flags, param): 
    if event == cv2.EVENT_LBUTTONDOWN:        
        # add to markers
        param["x"] = x
        param["y"] = y
        
'''
tk_open_file(): show a dialog for opening a file

    receive:
        init_dir: init directory
        dialog_title: dialog_title
    
    return:
        file_path: path of the selected file
'''
def tk_open_file(init_dir, dialog_title):
    # 建立 Tkinter 主視窗（隱藏，不需要顯示）
    root = tk.Tk()
    root.withdraw()

    # 設定檔案類型篩選
    filetypes = [
        ("Image files", "*.jpg *.jpeg *.png *.bmp *.gif *.tiff")
    ]

    # 開啟檔案選擇對話框
    file_path = filedialog.askopenfilename(
        title=dialog_title,
        initialdir=init_dir,
        filetypes=filetypes
    )    
    root.destroy()  # 釋放資源

    return file_path

'''
transform_rsv2bev(): transform a point from rsv to bev

    receive:
        pt: a point in rsv
        homography: homography matrix (3x3 numpy)
        affine: affine transform (2x3 numpy)
    
    return:
        pt: a point after transformation in road layout bev
'''
def transform_rsv2bev(pt, homography, affine):
    # Convert to homogeneous coordinates
    pt = np.array([pt[0], pt[1], 1.0])
    
    # Apply homography
    pt = homography @ pt  # Matrix multiplication
    
    # Normalize to get pixel coordinates
    pt[0] = pt[0] / pt[2]
    pt[1] = pt[1] / pt[2]
    pt[2] = 1.0

    # apply affine 
    pt = affine @ pt
    x = int(pt[0])
    y = int(pt[1])
    
    return [x,y]

# main program
if __name__ == '__main__':
    main()