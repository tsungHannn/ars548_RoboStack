"""
# Copyright (c) Facebook, Inc. and its affiliates. All Rights Reserved

COCO dataset which returns image_id for evaluation.
Mostly copy-paste from https://github.com/pytorch/vision/blob/13b35ff/references/detection/coco_utils.py
"""

import torch
import torch.utils.data

import torchvision
torchvision.disable_beta_transforms_warning()

from torchvision import datapoints

from pycocotools import mask as coco_mask

from src.core import register
import numpy as np
import os
from pypcd_imp import pypcd

__all__ = ['CocoDetection']


@register
class CocoDetection(torchvision.datasets.CocoDetection):
    __inject__ = ['transforms']
    __share__ = ['remap_mscoco_category']
    
    ############### RADAR ###############
    def __init__(self, img_folder, radar_folder, ann_file, transforms, return_masks, sample_ratio=None, remap_mscoco_category=False):
        super(CocoDetection, self).__init__(img_folder, ann_file)
        self._transforms = transforms
        self.prepare = ConvertCocoPolysToMask(return_masks, remap_mscoco_category)
        self.img_folder = img_folder
        self.radar_root = radar_folder
        self.ann_file = ann_file
        self.return_masks = return_masks
        self.remap_mscoco_category = remap_mscoco_category

        self.sample_ratio = sample_ratio if sample_ratio is not None else 0.5
        if self.sample_ratio is not None:
            print("here1")
            import random
            n_samples = int(len(self.ids) * self.sample_ratio)
            selected_ids = random.sample(self.ids, n_samples)

            # ⚡ 把 ids 換成隨機抽的
            self.ids = selected_ids
            print("here2")

            # ⚡ 把 selected_ids 轉成 set，加速下面的 in 查找
            selected_ids = set(selected_ids)

            # ⚡ 重建 img_infos，只留下有用的 image
            self.coco.imgs = {k: self.coco.imgs[k] for k in selected_ids}

            # ⚡ 重建 annotations，只留下有用的 anns
            new_anns = {}
            for ann_id, ann in self.coco.anns.items():
                if ann["image_id"] in selected_ids:
                    new_anns[ann_id] = ann
            self.coco.anns = new_anns
            print("here3")

    def load_pcd(self, pcd_path):

        pc = pypcd.PointCloud.from_path(os.path.join(self.radar_root, pcd_path))
        np_x = (np.array(pc.pc_data["x"], dtype=np.float32)).astype(np.float32)
        np_y = (np.array(pc.pc_data["y"], dtype=np.float32)).astype(np.float32)
        np_z = (np.array(pc.pc_data["z"], dtype=np.float32)).astype(np.float32)
        np_vx = (np.array(pc.pc_data["vx"], dtype=np.float32)).astype(np.float32)
        np_vy = (np.array(pc.pc_data["vy"], dtype=np.float32)).astype(np.float32)
        points_32 = np.transpose(np.vstack((np_x, np_y, np_z, np_vx, np_vy)))

        return points_32


    def __getitem__(self, idx):
        img, target = super(CocoDetection, self).__getitem__(idx)
        image_id = self.ids[idx]
        target = {'image_id': image_id, 'annotations': target}
        img, target = self.prepare(img, target)

        
        # ['boxes', 'masks', 'labels']:
        if 'boxes' in target:
            target['boxes'] = datapoints.BoundingBox(
                target['boxes'], 
                format=datapoints.BoundingBoxFormat.XYXY, 
                spatial_size=img.size[::-1]) # h w

        if 'masks' in target:
            target['masks'] = datapoints.Mask(target['masks'])

        if self._transforms is not None:
            img, target = self._transforms(img, target)

        ################ RADAR ################
        # # 模擬雷達資料：每張圖隨機 50 個點，每個點包含 (x, y, z, vx, vy)
        # num_radar_points = 50
        # radar_feats = np.random.randn(num_radar_points, 5).astype(np.float32)
        # radar_feats = torch.from_numpy(radar_feats)  # shape: [50, 5]


        # -------------------- 載入對應雷達資料 --------------------
        radar_feats = None
        if self.radar_root is not None:
            img_info = self.coco.loadImgs(image_id)[0]
            # 從 extra 中取得 user_tags 與原始影像名稱
            user_tag = img_info.get("extra", {}).get("user_tags", [None])[0]
            image_name = img_info.get("extra", {}).get("name", None)

            if user_tag is not None and image_name is not None:
                image_base = os.path.splitext(image_name)[0]  # "000578"
                radar_name = f"{user_tag}_{image_base}.pcd"
                radar_path = os.path.join(self.radar_root, radar_name)

                radar_feats = self.load_pcd(radar_path)
            else:
                print(f"[警告] image_id={image_id} 缺少 user_tags 或 name")
                # radar_feats = np.random.randn(50, 5).astype(np.float32)
        else:
            # 若沒有 radar_root，回傳模擬資料
            # radar_feats = np.random.randn(50, 5).astype(np.float32)
            print("Error: No radar root specified, cannot load radar data.")

        radar_feats = torch.from_numpy(radar_feats)

        # ---------------------------------------------------------

        return img, radar_feats, target

        # return img, target

    def extra_repr(self) -> str:
        s = f' img_folder: {self.img_folder}\n ann_file: {self.ann_file}\n'
        s += f' return_masks: {self.return_masks}\n'
        if hasattr(self, '_transforms') and self._transforms is not None:
            s += f' transforms:\n   {repr(self._transforms)}'

        return s 


def convert_coco_poly_to_mask(segmentations, height, width):
    masks = []
    for polygons in segmentations:
        rles = coco_mask.frPyObjects(polygons, height, width)
        mask = coco_mask.decode(rles)
        if len(mask.shape) < 3:
            mask = mask[..., None]
        mask = torch.as_tensor(mask, dtype=torch.uint8)
        mask = mask.any(dim=2)
        masks.append(mask)
    if masks:
        masks = torch.stack(masks, dim=0)
    else:
        masks = torch.zeros((0, height, width), dtype=torch.uint8)
    return masks


class ConvertCocoPolysToMask(object):
    def __init__(self, return_masks=False, remap_mscoco_category=False):
        self.return_masks = return_masks
        self.remap_mscoco_category = remap_mscoco_category

    def __call__(self, image, target):
        w, h = image.size

        image_id = target["image_id"]
        image_id = torch.tensor([image_id])

        anno = target["annotations"]

        anno = [obj for obj in anno if 'iscrowd' not in obj or obj['iscrowd'] == 0]

        boxes = [obj["bbox"] for obj in anno]
        # guard against no boxes via resizing
        boxes = torch.as_tensor(boxes, dtype=torch.float32).reshape(-1, 4)
        boxes[:, 2:] += boxes[:, :2]
        boxes[:, 0::2].clamp_(min=0, max=w)
        boxes[:, 1::2].clamp_(min=0, max=h)

        if self.remap_mscoco_category:
            classes = [mscoco_category2label[obj["category_id"]] for obj in anno]
        else:
            classes = [obj["category_id"] for obj in anno]
            
        classes = torch.tensor(classes, dtype=torch.int64)

        if self.return_masks:
            segmentations = [obj["segmentation"] for obj in anno]
            masks = convert_coco_poly_to_mask(segmentations, h, w)

        keypoints = None
        if anno and "keypoints" in anno[0]:
            keypoints = [obj["keypoints"] for obj in anno]
            keypoints = torch.as_tensor(keypoints, dtype=torch.float32)
            num_keypoints = keypoints.shape[0]
            if num_keypoints:
                keypoints = keypoints.view(num_keypoints, -1, 3)

        keep = (boxes[:, 3] > boxes[:, 1]) & (boxes[:, 2] > boxes[:, 0])
        boxes = boxes[keep]
        classes = classes[keep]
        if self.return_masks:
            masks = masks[keep]
        if keypoints is not None:
            keypoints = keypoints[keep]

        target = {}
        target["boxes"] = boxes
        target["labels"] = classes
        if self.return_masks:
            target["masks"] = masks
        target["image_id"] = image_id
        if keypoints is not None:
            target["keypoints"] = keypoints

        # for conversion to coco api
        area = torch.tensor([obj["area"] for obj in anno])
        iscrowd = torch.tensor([obj["iscrowd"] if "iscrowd" in obj else 0 for obj in anno])
        target["area"] = area[keep]
        target["iscrowd"] = iscrowd[keep]

        target["orig_size"] = torch.as_tensor([int(w), int(h)])
        target["size"] = torch.as_tensor([int(w), int(h)])
    
        return image, target


mscoco_category2name = {
    1: 'person',
    2: 'bicycle',
    3: 'car',
    4: 'motorcycle',
    5: 'airplane',
    6: 'bus',
    7: 'train',
    8: 'truck',
    9: 'boat',
    10: 'traffic light',
    11: 'fire hydrant',
    13: 'stop sign',
    14: 'parking meter',
    15: 'bench',
    16: 'bird',
    17: 'cat',
    18: 'dog',
    19: 'horse',
    20: 'sheep',
    21: 'cow',
    22: 'elephant',
    23: 'bear',
    24: 'zebra',
    25: 'giraffe',
    27: 'backpack',
    28: 'umbrella',
    31: 'handbag',
    32: 'tie',
    33: 'suitcase',
    34: 'frisbee',
    35: 'skis',
    36: 'snowboard',
    37: 'sports ball',
    38: 'kite',
    39: 'baseball bat',
    40: 'baseball glove',
    41: 'skateboard',
    42: 'surfboard',
    43: 'tennis racket',
    44: 'bottle',
    46: 'wine glass',
    47: 'cup',
    48: 'fork',
    49: 'knife',
    50: 'spoon',
    51: 'bowl',
    52: 'banana',
    53: 'apple',
    54: 'sandwich',
    55: 'orange',
    56: 'broccoli',
    57: 'carrot',
    58: 'hot dog',
    59: 'pizza',
    60: 'donut',
    61: 'cake',
    62: 'chair',
    63: 'couch',
    64: 'potted plant',
    65: 'bed',
    67: 'dining table',
    70: 'toilet',
    72: 'tv',
    73: 'laptop',
    74: 'mouse',
    75: 'remote',
    76: 'keyboard',
    77: 'cell phone',
    78: 'microwave',
    79: 'oven',
    80: 'toaster',
    81: 'sink',
    82: 'refrigerator',
    84: 'book',
    85: 'clock',
    86: 'vase',
    87: 'scissors',
    88: 'teddy bear',
    89: 'hair drier',
    90: 'toothbrush'
}

mscoco_category2label = {k: i for i, k in enumerate(mscoco_category2name.keys())}
mscoco_label2category = {v: k for k, v in mscoco_category2label.items()}