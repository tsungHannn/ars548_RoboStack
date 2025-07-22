# 因為從roboflow上下載後檔名會亂掉，所以要整理一下，跟雷達對應
# 下載下來的json裡面會有extra，裡面包含user_tags和name
# user_tags就是場景名稱(A_place_1_2025-02-26-10-13-51)，name是原始檔名(00001.png)
# 所以就用這個把雷達點雲重新命名後轉存到新的資料夾


import os
import json
import shutil
from tqdm import tqdm

# 設定檔案路徑
coco_json_path = '/media/mvclab/HDD/ncsist/2025/datasets/valid/_annotations.coco.json'  # 替換成實際路徑
original_root = '/media/mvclab/HDD/ncsist/2025/data/rosbag2kitti_結果/'  # 各場景資料夾的根目錄
output_pcd_dir = '/media/mvclab/HDD/ncsist/2025/datasets/radar'  # 轉存目錄


# 確保目的資料夾存在
os.makedirs(output_pcd_dir, exist_ok=True)

# 讀取 COCO JSON
with open(coco_json_path, 'r') as f:
    coco_data = json.load(f)

# 處理每個影像標註
for image in tqdm(coco_data.get('images', [])):
    extra = image.get('extra', {})
    user_tags = extra.get('user_tags', [])
    orig_name = extra.get('name', None)

    if not user_tags or not orig_name:
        print(f"[警告] 缺少 user_tags 或 name：{image.get('file_name')}")
        continue

    full_tag = user_tags[0]  # 例如 "A_place_1_2025-02-26-10-13-51"
    try:
        # 解析出 A_place 與日期
        splited_tag = full_tag.split('_') # ['A', 'place', '1', '2025-02-26-10-13-51']

        scene_folder = '_'.join(splited_tag[:2])  # A_place
        date_folder = '_'.join(splited_tag[2:])  # 1_2025-02-26-10-13-51

    except:
        print(f"[錯誤] 無法解析 user_tags: {full_tag}")
        continue

    pcd_file_name = os.path.splitext(orig_name)[0] + '.pcd'
    pcd_input_path = os.path.join(original_root, scene_folder, date_folder, 'pcd', pcd_file_name)

    if not os.path.exists(pcd_input_path):
        print(f"[錯誤] 找不到雷達檔案：{pcd_input_path}")
        continue

    new_pcd_name = f"{full_tag}_{os.path.splitext(orig_name)[0]}.pcd"
    pcd_output_path = os.path.join(output_pcd_dir, new_pcd_name)

    shutil.copy2(pcd_input_path, pcd_output_path)
    # print(f"✔ 已轉存：{pcd_output_path}")