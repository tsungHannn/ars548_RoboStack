# 可視化給黃老師的部份
# 讀取camera_det的png跟txt後，可視化偵測結果

import os
import cv2
from tqdm import tqdm

# 資料夾路徑
folder_name = 'src/deploy/camera_det'
image_folder = os.path.join(folder_name, 'png')
label_folder = os.path.join(folder_name, 'txt')
output_folder = os.path.join(folder_name, 'vis_result')

# 建立輸出資料夾
os.makedirs(output_folder, exist_ok=True)

# 設定字型
font = cv2.FONT_HERSHEY_SIMPLEX

# 讀取所有圖片
for image_name in tqdm(os.listdir(image_folder)):
    if not image_name.lower().endswith(('.png', '.jpg', '.jpeg')):
        continue

    # 對應的圖片與文字檔路徑
    image_path = os.path.join(image_folder, image_name)
    label_path = os.path.join(label_folder, os.path.splitext(image_name)[0] + '.txt')

    # 讀取圖片
    image = cv2.imread(image_path)

    # 如果有對應的 txt 檔案
    if os.path.exists(label_path):
        with open(label_path, 'r') as f:
            for line in f:
                # 假設每一行格式為：class_name x1 y1 x2 y2 velocity distance
                parts = line.strip().split()
                if len(parts) != 7:
                    continue  # 格式錯誤

                class_name = parts[0]
                x1, y1, x2, y2 = map(int, parts[1:5])
                velocity = parts[5]
                distance = parts[6]

                # 畫框
                cv2.rectangle(image, (x1, y1), (x2, y2), (0, 255, 0), 2)

                # 顯示文字
                label = f'{class_name} V:{velocity} D:{distance}'
                cv2.putText(image, label, (x1, y1 - 10), font, 0.5, (0, 255, 255), 1, cv2.LINE_AA)

    # 儲存結果
    output_path = os.path.join(output_folder, image_name)
    cv2.imwrite(output_path, image)

print("所有圖片已處理完畢，結果儲存在 output/")
