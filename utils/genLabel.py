import os
import cv2
from ultralytics import YOLO
import torch
from natsort import natsorted
from collections import defaultdict
import shutil
from tqdm import tqdm

# 設定參數
scene_path = "/media/mvclab/HDD/ncsist/2025/data/rosbag2kitti_結果/B_place/7_2025-02-26-10-44-20"  # 圖片資料夾
image_folder = os.path.join(scene_path, "png")  # 圖片資料夾
output_folder = os.path.join(scene_path, "pre_label")  # 存放偵測結果的資料夾
model_path = "src/deploy/yolo11m.pt"  # 可換成 yolov8s.pt、yolov8m.pt、yolov8l.pt 等

# 建立輸出資料夾，如果存在則清空檔案
if os.path.exists(output_folder):
    for file in os.listdir(output_folder):
        file_path = os.path.join(output_folder, file)
        try:
            if os.path.isfile(file_path) or os.path.islink(file_path):
                os.unlink(file_path)
            elif os.path.isdir(file_path):
                shutil.rmtree(file_path)
        except Exception as e:
            print(f"無法刪除 {file_path}. 原因: {e}")
else:
    os.makedirs(output_folder)

# 載入 YOLO 模型
model = YOLO(model_path)
print("CUDA available:", torch.cuda.is_available())

if torch.cuda.is_available():
    model.to(torch.device('cuda'))

# === 初始化追蹤歷史 ===
track_history = defaultdict(list)

# 取得資料夾中所有圖片檔名
image_files = [f for f in os.listdir(image_folder) if f.lower().endswith((".jpg", ".jpeg", ".png"))]
image_files = natsorted(image_files)

# 處理每張圖片
for image_name in tqdm(image_files, desc="處理圖片", unit="張"):
    image_path = os.path.join(image_folder, image_name)
    img = cv2.imread(image_path)

    if img is None:
        print(f"無法讀取 {image_name}")
        # 準備輸出 txt 路徑
        txt_name = os.path.splitext(image_name)[0] + ".txt"
        txt_path = os.path.join(output_folder, txt_name)

    dets = model.track(img, show=False, persist=True, tracker='bytetrack.yaml', \
        verbose=False, classes=[1, 2, 3, 4, 5, 6, 7, 8], conf=0.08, imgsz=768, half=True)
    if not len(dets[0].boxes.xywh.cpu()):
        print(f"無法偵測到物體 {image_name}")
        with open(txt_path, 'w') as f:
            pass
        continue

    boxes = dets[0].boxes.xywh.cpu()
    track_ids = dets[0].boxes.id
    class_ids = dets[0].boxes.cls


    if track_ids is None:
        track_ids = []
    else:
        track_ids = dets[0].boxes.id.int().tolist()

    if class_ids is not None:
        class_ids = class_ids.int().tolist()
    else:
        class_ids = [-1] * len(boxes)  # 若沒有類別就填 -1

    result_text = []

    for box, track_id, cls_id in zip(boxes, track_ids, class_ids):
        x, y, w, h = box
        # x1, y1 = int(x - w / 2), int(y - h / 2)
        # x2, y2 = int(x + w / 2), int(y + h / 2)

        # normalize
        x = float(x) / img.shape[1]
        y = float(y) / img.shape[0]
        w = float(w) / img.shape[1]
        h = float(h) / img.shape[0]


        # track = track_history[track_id]
        # track.append((float(x), float(y)))
        # if len(track) > 30:
        #     track.pop(0)


        # 加上文字標籤：track ID + 類別名稱
        class_name = model.names[cls_id] if cls_id >= 0 else "unknown"



        # 儲存文字資料
        result_text.append(f"{cls_id} {x} {y} {w} {h}")

    # 準備輸出 txt 路徑
    txt_name = os.path.splitext(image_name)[0] + ".txt"
    txt_path = os.path.join(output_folder, txt_name)

    with open(txt_path, 'w') as f:
        f.write("\n".join(result_text))

    # print(f"已處理 {image_name} -> {txt_name}")
