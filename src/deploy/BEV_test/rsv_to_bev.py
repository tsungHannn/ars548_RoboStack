# -*- coding: utf-8 -*-
"""
Created on Mon Aug 18 11:21:51 2025

@author: poww
"""
import cv2
import json

import numpy as np

import os
import sys

import tkinter as tk
from tkinter import filedialog

map_size = 512  # bev map size
pixel_per_meter = 20

n_lanes = 2
lane_width = 3   # unit:meter
lane_length= 10  # unit: meter

"""
-------------------------------------
main(): main function 
-------------------------------------
"""
def rsv_to_bev():
    # (1) load a rsv image from a file using tkinter
    # open a file
    file_path = tk_open_file("D:/CSIST", "選擇路側視角影像")
    
    if not file_path:
        print("未選擇任何檔案")
        return
        # sys.exit("未選擇任何檔案")
        
    # load the selected image
    rsv_im = cv2.imread(file_path)
    rsv_im = cv2.resize(rsv_im, None, fx=0.5, fy=0.5, interpolation=cv2.INTER_LINEAR)
    
    # (2) load the json file if it exist
    # open a json file
    json_file_path = os.path.splitext(file_path)[0] + ".json"
    rsv_quad, bev_quad, bev_markers = load_json(json_file_path)
    
    
    # (3) find the homography matrix between rsv and bev using initialzed quads
    #     and warp rsv_im to bev_im
    homography, status = cv2.findHomography(rsv_quad, bev_quad)
    bev_im = cv2.warpPerspective(rsv_im, homography, (map_size, map_size))
    
    cv2.imshow("rsv", rsv_im)    
    cv2.imshow("bev", bev_im)

    # (4) set the rsv and bev mouse callback functions
    # set the rsv mouse callback function
    drag_idx = -1    # index of the selected point

    rsv_param={
            "quad": rsv_quad,
            "drag_idx": drag_idx,
          }
    cv2.setMouseCallback("rsv", rsv_mouse_callback, param=rsv_param) 
    
    # set the bev mouse callback function
    bev_param={
            "markers": bev_markers
        }
    cv2.setMouseCallback("bev", bev_mouse_callback, param=bev_param) 
    
    # (5) loop to process mouse events until ESC key is pressed
    while True:            
        # (5.1) find the homography matrix between rsv and bev using setting quads
        #       and warp rsv_im to bev_im
        homography, status = cv2.findHomography(rsv_quad, bev_quad)
        bev_im = cv2.warpPerspective(rsv_im, homography, (map_size, map_size))

        # show the rsv_im quad
        rsv_overlay_im = draw_quad(rsv_im, rsv_quad)
        
        # show the bev_im quad and its markers
        bev_overlay_im = draw_quad(bev_im, bev_quad)
        bev_overlay_im = draw_points(bev_overlay_im, bev_markers, color=(0, 255, 0))
        
        cv2.imshow("rsv", rsv_overlay_im)    
        cv2.imshow("bev", bev_overlay_im) 
        
        # read one key 
        key = cv2.waitKey(50)
        
        # press ESC key to exit
        if key == ord('s') or key == ord('S'):  #save key
            print("Enter save")
            # (6) save the bev image, homography matrix and marker points
            # save bev image
            bev_file_path = os.path.splitext(file_path)[0] + "_bev" + ".png"
            cv2.imwrite(bev_file_path, bev_im)
            
            # save the homography and makers points as json file
            json_file_path = os.path.splitext(file_path)[0] + ".json"
            
            # write to the file
            json_data = {}
            json_data["rsv_file"] = file_path
            json_data["rsv_quad"] = rsv_quad.tolist()
            json_data["bev_file"] = bev_file_path
            json_data["bev_quad"] = bev_quad.tolist()
            json_data["homography"] = homography.tolist()
            json_data["markers"] = bev_markers
            
            with open(json_file_path, "w") as file:
                json.dump(json_data, file, indent=2)
        
        # press ESC key to exit
        if key == 27:  #ESC
            break
            
    cv2.destroyAllWindows()

'''
bev_mouse_callback(): show the four points of a quad
'''
def bev_mouse_callback(event, x, y, flags, param): 
    if event == cv2.EVENT_LBUTTONDOWN:        
        # add to markers
        param["markers"].append([x,y])    
        
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
draw_quad(): show the four points of a quad

    receive:
        image: input image
        points: coordinates of four points [[x1, y1], [x2, y2], [x3, y3], [x4, y4]]
    
    return:
        overlay: an image with the quad overlaied on the input image
'''
# draw the quad area and its four corner points
def draw_quad(image, quad):
    # === 在原圖畫淺藍色遮罩 ===
    overlay = image.copy()  ### 建立覆蓋層
    
    # poly_pts = np.array([[tl, bl, br, tr]], dtype=np.int32)  # 順時針／逆時針皆可
    light_blue = (255, 200, 50)  # BGR：淺藍/青色，可調整                   ###
    cv2.fillPoly(overlay, [quad], light_blue)  # 在 overlay 填色

    alpha = 0.35  # 透明度 0~1；數值越大顏色越濃                    ###
    draw_im = cv2.addWeighted(overlay, alpha, image, 1 - alpha, 0)  # 疊回原圖        ###

    #draw the middle line
    up_mid = [(quad[0,0] + quad[3,0])//2, (quad[0,1] + quad[3,1])//2]
    bt_mid = [(quad[1,0] + quad[2,0])//2, (quad[1,1] + quad[2,1])//2]
    cv2.line(draw_im, up_mid, bt_mid, [0, 0, 255], 3)
    
    # draw the points of the quad
    draw_im = draw_points(draw_im, quad)
    
    return draw_im    

'''
load_json(): load the data in the json file including homography matrix and four corresponding points
    receive:
        file_path: file path of the json file
        
    return:
        homography: homography matrix
        markers: marker points
'''
def load_json(file_path):
    # check the existence of the json file
    if os.path.exists(file_path):        
        with open(file_path, "r") as file:
            json_data = json.load(file)
            
            # load the quads
            rsv_quad = json_data["rsv_quad"]
            rsv_quad = np.int32(rsv_quad)
            bev_quad = json_data["bev_quad"]
            bev_quad = np.int32(bev_quad)
            
            # load the markers
            markers = json_data["markers"]
    else:
        # init quads
        rsv_quad = np.int32([[23, 476], [119, 641], [675, 489],[352, 411]])
    
        # compute the road width and height in the unit of pixels
        road_width = n_lanes * lane_width * pixel_per_meter
        road_length = lane_length * pixel_per_meter
        
        # define four points of BEV view
        bev_quad = np.int32([[map_size // 2 - road_width // 2, map_size // 2 - road_length // 2], 
                             [map_size // 2 - road_width // 2, map_size // 2 + road_length // 2], 
                             [map_size // 2 + road_width // 2, map_size // 2 + road_length // 2],
                             [map_size // 2 + road_width // 2, map_size // 2 - road_length // 2] ])
        
        markers = []
         
    return rsv_quad, bev_quad, markers    

'''
rsv_mouse_callback(): show the four points of a quad
'''
def rsv_mouse_callback(event, x, y, flags, param): 
    # get the points
    points= param["quad"]
    
    if event == cv2.EVENT_LBUTTONDOWN:
        # 若按在任一點附近 (半徑 8 px 內) → 開始拖曳
        for i, (px, py) in enumerate(points):
            if (x - px) ** 2 + (y - py) ** 2 <= 64:
                param["drag_idx"] = i
                break
    elif event == cv2.EVENT_MOUSEMOVE and param["drag_idx"] != -1:
        # 拖曳中 → 更新座標
        param["quad"][param["drag_idx"]] = (x, y)

    elif event == cv2.EVENT_LBUTTONUP:
        param["drag_idx"] = -1  # 結束拖曳

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
main(): main function
'''
if __name__ == '__main__':
    rsv_to_bev()