# -*- coding: utf-8 -*-
"""
Created on Mon Aug 18 14:48:01 2025

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
def bev_stitcher():
    # (1) load the basis bev including bev image and json file
    # open a file
    file_path = tk_open_file("D:/CSIST", "選擇基準鳥瞰視角影像")
    
    if not file_path:
        print("未選擇任何檔案")
        return
        # sys.exit("未選擇任何檔案")

    # load the json file
    rsv_file_path, bev_file_path, base_homography, base_markers = load_json(file_path)
        
    # load the base image
    base_im = cv2.imread(bev_file_path)
        
    # (2) loop to stitch several bev images until ESC key is pressed
    rsv_file_paths = [rsv_file_path]
    bev_file_paths = [bev_file_path]
    
    homographys = [base_homography]
    affines = [
                [ 
                    [1.0, 0.0, 0.0],
                    [0.0, 1.0, 0.0]   
                ]               
              ]
    
    while True:
        # show the image 
        base_overlay_im = draw_points(base_im, base_markers, (0, 2550, 0))           
        cv2.imshow("base", base_overlay_im)    

        # read one key 
        key = cv2.waitKey(50)
        
        # press ESC key to exit
        if key == 27:  #ESC
            break
    
        # press 'a' key to stitch a bev image
        elif key == ord('a') or key==ord('A'):
            # open a file for selected added bev
            file_path = tk_open_file("D:/CSIST", "選擇新增鳥瞰視角影像")
            
            if not file_path:
                sys.exit("未選擇任何檔案")
                break

            # load the json file
            rsv_file_path, bev_file_path, added_homography, added_markers = load_json(file_path)

            # load the added image
            added_im = cv2.imread(bev_file_path)
                                    
            # show the image 
            added_overlay_im = draw_points(added_im, added_markers, (0, 2550, 0))           
            cv2.imshow("added", added_overlay_im)    

            # stitch the base bev and added bev images
            base_im, affine = stitch(base_im, base_markers, added_im, added_markers)
            base_im = remove_border(base_im)
            
            # append the homography and affines
            rsv_file_paths.append(rsv_file_path)
            bev_file_paths.append(bev_file_path)
            
            homographys.append(added_homography)
            affines.append(affine.tolist())
            
        # press 'a' key to stitch a bev image
        elif key == ord('s') or key==ord('S'):
            # save the bev_im, homographys and affines
            file_path = tk_save_file("D:/CSIST", "選擇儲存鳥瞰視角影像")
        
            if file_path:
                cv2.imwrite(file_path, base_im)
                
                # write to the file
                json_file_path = os.path.splitext(file_path)[0] + ".json"
                
                json_data = {}
                json_data["rsv_paths"] = rsv_file_paths
                json_data["bev_paths"] = bev_file_paths
                json_data["homographys"] = homographys
                json_data["affines"] = affines
                
                with open(json_file_path, "w") as file:
                    json.dump(json_data, file, indent=2)
        

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
        rsv_file_path = json_data["rsv_file"]
        bev_file_path = json_data["bev_file"]
        
        #load homography and markers
        homography = json_data["homography"]
        markers = json_data["markers"]

    return rsv_file_path, bev_file_path, homography, markers    

'''
remove_border(): remove the border without content

    receive:
        im: input image

    return:
        cropped_im: cropped image
        
'''
def remove_border(im):
    # 轉成灰階
    gray = cv2.cvtColor(im, cv2.COLOR_BGR2GRAY)    
    
    # find the coordinates with nob-zero values
    non_zero_coords = cv2.findNonZero(gray)
    
    # 找到包含所有非黑像素的邊界框
    x, y, w, h = cv2.boundingRect(non_zero_coords)
    
    # 裁切影像
    cropped_im = im[0:y+h, 0:x+w]
    
    return cropped_im
    
    
'''
stitch(): stitch two images by giving four corresponding points

    receive:
        im_1: image 1
        pts_1: corresponding points in image 1
        im_2: image 2
        pts_2: corresponding points in image 2
    
    return:
        stitched_im: image after stitching
        
'''
def stitch(im_1, pts_1, im_2, pts_2):
    # convert to numpy int32
    pts_1 = np.float32(pts_1)
    pts_2 = np.float32(pts_2)
    
    # Compute affine transform 
    affine, inliers = cv2.estimateAffine2D(pts_2, pts_1)

    # Get image shapes
    h_1, w_1 = im_1.shape[:2]
    h_2, w_2 = im_2.shape[:2]
    
    # Corner points of both images
    corners_1 = np.array([[0,0], [w_1,0], [w_1,h_1], [0,h_1]], dtype=np.float32).reshape(-1,1,2)
    corners_2 = np.array([[0,0], [w_2,0], [w_2,h_2], [0,h_2]], dtype=np.float32).reshape(-1,1,2)    
    
    # Warp corners of img2 into img1's coordinate system
    warped_corners_2 = cv2.transform(corners_2, affine)
    
    # Combine corners
    corners = np.vstack((corners_1, warped_corners_2))
    
    # Find bounding box
    [x_min, y_min] = np.int64(corners.min(axis=0).ravel())
    [x_max, y_max] = np.int64(corners.max(axis=0).ravel())
    
    # Translation to avoid negative coordinates
    #t_x, t_y = -x_min if x_min < 0 else 0, -y_min if y_min < 0 else 0
    #translation = np.array([[1, 0, t_x], [0, 1, t_y]], dtype=np.float32)
    
    # Warp second image into panorama space
    warped_w = x_max - x_min
    warped_h = y_max - y_min    
    print(f'{warped_w} : {warped_h}')
    
    warped = cv2.warpAffine(im_2, affine, (warped_w, warped_h))
    
    # Paste img1 into panorama
    canvas = np.zeros_like(warped)
    canvas[0: h_1, 0: w_1] = im_1
    
    # create mask
    mask_1 = (canvas > 0).astype(np.float32)
    mask_2 = (warped > 0).astype(np.float32)
    
    # Weighted blending
    alpha = 0.5  # can be adjusted, or computed per-pixel
    overlap = (mask_1 * mask_2)
    only_1 = mask_1 - overlap
    only_2 = mask_2 - overlap
    
    result = np.zeros_like(canvas, dtype=np.float32)
    result += canvas * only_1
    result += warped * only_2
    result += (canvas * alpha + warped * (1 - alpha)) * overlap
    result = result.astype(np.uint8)
            
    return result, affine

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
        ("json files", "*.json")
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
tk_save_file(): show a dialog for opening a file

    receive:
        init_dir: init directory
        dialog_title: dialog_title
    
    return:
        file_path: path of the selected file
'''
def tk_save_file(init_dir, dialog_title):
    # 建立 Tkinter 主視窗（隱藏，不需要顯示）
    root = tk.Tk()
    root.withdraw()
    
    # 設定檔案類型篩選
    filetypes=[("PNG files", "*.png"), ("JPEG files", "*.jpg"), ("All files", "*.*")]
    
    # 開啟檔案選擇對話框
    file_path = filedialog.asksaveasfilename(
        title=dialog_title,
        initialdir=init_dir,
        defaultextension=".png",
        filetypes=filetypes
    )    
    root.destroy()  # 釋放資源
    
    return file_path

'''
main(): main function
'''
if __name__ == '__main__':
    bev_stitcher()