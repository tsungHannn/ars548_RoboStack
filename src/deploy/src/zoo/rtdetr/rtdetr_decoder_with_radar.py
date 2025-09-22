###################### add heatmap ######################
# """by lyuwenyu
# """

# import math 
# import copy 
# from collections import OrderedDict

# import torch 
# import torch.nn as nn 
# import torch.nn.functional as F 
# import torch.nn.init as init 
# import numpy as np


# from .denoising import get_contrastive_denoising_training_group
# from .utils import deformable_attention_core_func, get_activation, inverse_sigmoid
# from .utils import bias_init_with_prob


# from src.core import register
# from .pointnet_utils import PointNetEncoder, STN3d, STN2d
# from .pointnet2_utils import PointNetSetAbstractionMsg, PointNetSetAbstraction
# from .SECOND import VoxelFeatureExtractor, get_paddings_indicator


# __all__ = ['RTDETRTransformer']



# class MLP(nn.Module):
#     def __init__(self, input_dim, hidden_dim, output_dim, num_layers, act='relu'):
#         super().__init__()
#         self.num_layers = num_layers
#         h = [hidden_dim] * (num_layers - 1)
#         self.layers = nn.ModuleList(nn.Linear(n, k) for n, k in zip([input_dim] + h, h + [output_dim]))
#         self.act = nn.Identity() if act is None else get_activation(act)

#     def forward(self, x):
#         for i, layer in enumerate(self.layers):
#             x = self.act(layer(x)) if i < self.num_layers - 1 else layer(x)
#         return x



# class MSDeformableAttention(nn.Module):
#     def __init__(self, embed_dim=256, num_heads=8, num_levels=4, num_points=4,):
#         """
#         Multi-Scale Deformable Attention Module
#         """
#         super(MSDeformableAttention, self).__init__()
#         self.embed_dim = embed_dim
#         self.num_heads = num_heads
#         self.num_levels = num_levels
#         self.num_points = num_points
#         self.total_points = num_heads * num_levels * num_points

#         self.head_dim = embed_dim // num_heads
#         assert self.head_dim * num_heads == self.embed_dim, "embed_dim must be divisible by num_heads"

#         self.sampling_offsets = nn.Linear(embed_dim, self.total_points * 2,)
#         self.attention_weights = nn.Linear(embed_dim, self.total_points)
#         self.value_proj = nn.Linear(embed_dim, embed_dim)
#         self.output_proj = nn.Linear(embed_dim, embed_dim)

#         self.ms_deformable_attn_core = deformable_attention_core_func

#         self._reset_parameters()


#     def _reset_parameters(self):
#         # sampling_offsets
#         init.constant_(self.sampling_offsets.weight, 0)
#         thetas = torch.arange(self.num_heads, dtype=torch.float32) * (2.0 * math.pi / self.num_heads)
#         grid_init = torch.stack([thetas.cos(), thetas.sin()], -1)
#         grid_init = grid_init / grid_init.abs().max(-1, keepdim=True).values
#         grid_init = grid_init.reshape(self.num_heads, 1, 1, 2).tile([1, self.num_levels, self.num_points, 1])
#         scaling = torch.arange(1, self.num_points + 1, dtype=torch.float32).reshape(1, 1, -1, 1)
#         grid_init *= scaling
#         self.sampling_offsets.bias.data[...] = grid_init.flatten()

#         # attention_weights
#         init.constant_(self.attention_weights.weight, 0)
#         init.constant_(self.attention_weights.bias, 0)

#         # proj
#         init.xavier_uniform_(self.value_proj.weight)
#         init.constant_(self.value_proj.bias, 0)
#         init.xavier_uniform_(self.output_proj.weight)
#         init.constant_(self.output_proj.bias, 0)


#     def forward(self,
#                 query,
#                 reference_points,
#                 value,
#                 value_spatial_shapes,
#                 value_mask=None):
#         """
#         Args:
#             query (Tensor): [bs, query_length, C]
#             reference_points (Tensor): [bs, query_length, n_levels, 2], range in [0, 1], top-left (0,0),
#                 bottom-right (1, 1), including padding area
#             value (Tensor): [bs, value_length, C]
#             value_spatial_shapes (List): [n_levels, 2], [(H_0, W_0), (H_1, W_1), ..., (H_{L-1}, W_{L-1})]
#             value_level_start_index (List): [n_levels], [0, H_0*W_0, H_0*W_0+H_1*W_1, ...]
#             value_mask (Tensor): [bs, value_length], True for non-padding elements, False for padding elements

#         Returns:
#             output (Tensor): [bs, Length_{query}, C]
#         """
#         bs, Len_q = query.shape[:2]
#         Len_v = value.shape[1]

#         value = self.value_proj(value)
#         if value_mask is not None:
#             value_mask = value_mask.astype(value.dtype).unsqueeze(-1)
#             value *= value_mask
#         value = value.reshape(bs, Len_v, self.num_heads, self.head_dim)

#         sampling_offsets = self.sampling_offsets(query).reshape(
#             bs, Len_q, self.num_heads, self.num_levels, self.num_points, 2)
#         attention_weights = self.attention_weights(query).reshape(
#             bs, Len_q, self.num_heads, self.num_levels * self.num_points)
#         attention_weights = F.softmax(attention_weights, dim=-1).reshape(
#             bs, Len_q, self.num_heads, self.num_levels, self.num_points)

#         if reference_points.shape[-1] == 2:
#             offset_normalizer = torch.tensor(value_spatial_shapes)
#             offset_normalizer = offset_normalizer.flip([1]).reshape(
#                 1, 1, 1, self.num_levels, 1, 2)
#             sampling_locations = reference_points.reshape(
#                 bs, Len_q, 1, self.num_levels, 1, 2
#             ) + sampling_offsets / offset_normalizer
#         elif reference_points.shape[-1] == 4:
#             sampling_locations = (
#                 reference_points[:, :, None, :, None, :2] + sampling_offsets /
#                 self.num_points * reference_points[:, :, None, :, None, 2:] * 0.5)
#         else:
#             raise ValueError(
#                 "Last dim of reference_points must be 2 or 4, but get {} instead.".
#                 format(reference_points.shape[-1]))

#         output = self.ms_deformable_attn_core(value, value_spatial_shapes, sampling_locations, attention_weights)

#         output = self.output_proj(output)

#         return output
    

# # =============================
# # 雷達特徵嵌入層 (RadarFeatureEmbedding)
# # 將 (x, y, z, vx, vy) 投影為 d_model 維度的嵌入向量
# # =============================
# class RadarFeatureEmbedding(nn.Module):
#     # =============================
#     # Linear + LayerNorm
#     # =============================
#     # def __init__(self, input_dim=5, embed_dim=256): 
#     #     super(RadarFeatureEmbedding, self).__init__()
#     #     self.fc = nn.Linear(input_dim, embed_dim)
#     #     self.norm = nn.LayerNorm(embed_dim)

#     # def forward(self, radar_feats):
#     #     # radar_feats: [batch_size, num_radar_points, 5]
#     #     embedded = self.fc(radar_feats)
#     #     embedded = self.norm(embedded)
#     #     return embedded

#     # =============================
#     # pointnet+STN2d(https://github.com/yanx27/Pointnet_Pointnet2_pytorch/blob/master/models/pointnet_utils.py)
#     # =============================
#     def __init__(self, input_dim=4, embed_dim=256):
#         super().__init__()
#         self.stn = STN2d(2)  # 只對 x, y 做 2x2 變換
#         self.conv1 = nn.Conv1d(input_dim, 64, 1)
#         self.conv2 = nn.Conv1d(64, 128, 1)
#         self.conv3 = nn.Conv1d(128, 1024, 1)
#         self.bn1 = nn.BatchNorm1d(64)
#         self.bn2 = nn.BatchNorm1d(128)
#         self.bn3 = nn.BatchNorm1d(1024)
#         self.projector = nn.Linear(1024, embed_dim)
#         self.norm = nn.LayerNorm(embed_dim)

#     def forward(self, x):
#         # x: [B, N, 4] (x, y, vx, vy)
#         x = x.transpose(1, 2)  # → [B, 4, N]
#         B, C, N = x.shape

#         # === 1. 拿出 (x, y) 給 STN2d 做變換 ===
#         xy = x[:, :2, :]                           # → [B, 2, N]
#         extra = x[:, 2:, :]                        # → [B, 2, N]

#         trans = self.stn(xy)                       # → [B, 2, 2]
#         xy_trans = torch.bmm(trans, xy)            # → [B, 2, N]

#         # === 2. 拼回完整特徵 ===
#         x = torch.cat([xy_trans, extra], dim=1)    # → [B, 4, N]

#         # === 3. 通過 Conv 路徑 ===
#         x = F.relu(self.bn1(self.conv1(x)))        # → [B, 64, N]
#         x = F.relu(self.bn2(self.conv2(x)))        # → [B, 128, N]
#         x = F.relu(self.bn3(self.conv3(x)))        # → [B, 1024, N]

#         x = x.transpose(1, 2)                      # → [B, N, 1024]
#         x = self.projector(x)                      # → [B, N, embed_dim]
#         x = self.norm(x)
#         return x




# # =============================
# # 雷達數據的跨注意力機制 (RadarCrossAttention)
# # =============================
# class RadarCrossAttention(nn.Module):
#     def __init__(self, embed_dim=256, num_heads=8, num_points=4):
#         super(RadarCrossAttention, self).__init__()
#         self.embed_dim = embed_dim
#         self.num_heads = num_heads
#         self.num_points = num_points

#         self.head_dim = embed_dim // num_heads
#         assert self.head_dim * num_heads == self.embed_dim, "embed_dim must be divisible by num_heads"

#         self.sampling_offsets = nn.Linear(embed_dim, num_heads * num_points * 2)
#         self.attention_weights = nn.Linear(embed_dim, num_heads * num_points)
#         self.value_proj = nn.Linear(embed_dim, embed_dim)
#         self.output_proj = nn.Linear(embed_dim, embed_dim)

#         self._reset_parameters()

#     def _reset_parameters(self):
#         init.constant_(self.sampling_offsets.weight, 0)
#         init.constant_(self.sampling_offsets.bias, 0)
#         init.constant_(self.attention_weights.weight, 0)
#         init.constant_(self.attention_weights.bias, 0)
#         init.xavier_uniform_(self.value_proj.weight)
#         init.constant_(self.value_proj.bias, 0)
#         init.xavier_uniform_(self.output_proj.weight)
#         init.constant_(self.output_proj.bias, 0)

#     def forward(self, query, radar_feats, radar_pad_mask=None):
#         # query: [batch_size, query_length, embed_dim]
#         # radar_feats: [batch_size, num_radar_points, embed_dim]
#         bs, Len_q, _ = query.shape
#         Len_v = radar_feats.shape[1]
#         value = self.value_proj(radar_feats).reshape(bs, Len_v, self.num_heads, self.head_dim)
#         if radar_pad_mask is not None:
#             # radar_pad_mask: [B,V], True=padding
#             value = value.masked_fill(radar_pad_mask.unsqueeze(-1).unsqueeze(-1), 0.0)

#         sampling_offsets = self.sampling_offsets(query).reshape(bs, Len_q, self.num_heads, self.num_points, 2)
#         attention_weights = self.attention_weights(query).reshape(bs, Len_q, self.num_heads, self.num_points)
#         attention_weights = F.softmax(attention_weights, dim=-1)

#         # output = torch.einsum("bqhp,bvhp->bqhp", attention_weights, value)
#         # query: [B, Q, C], value: [B, V, C] → 先轉成 [B, Q, H, D] and [B, V, H, D]
#         Q = query.shape[1]
#         query = query.view(bs, Q, self.num_heads, self.head_dim)
#         value = value  # already in [B, V, H, D]
#         scores = torch.einsum('bqhd,bvhd->bqhv', query, value)
#         weights = F.softmax(scores, dim=-1)
#         output = torch.einsum('bqhv,bvhd->bqhd', weights, value)

        
#         output = output.reshape(bs, Q, -1)
#         output = self.output_proj(output)

#         return output
    



# class TransformerDecoderLayer(nn.Module):
#     def __init__(self,
#                  d_model=256,
#                  n_head=8,
#                  dim_feedforward=1024,
#                  dropout=0.,
#                  activation="relu",
#                  n_levels=4,
#                  n_points=4,):
#         super(TransformerDecoderLayer, self).__init__()

#         # self attention
#         self.self_attn = nn.MultiheadAttention(d_model, n_head, dropout=dropout, batch_first=True)
#         self.dropout1 = nn.Dropout(dropout)
#         self.norm1 = nn.LayerNorm(d_model)

#         # cross attention
#         self.cross_attn = MSDeformableAttention(d_model, n_head, n_levels, n_points)

#         # 雷達數據的跨注意力機制
#         in_dim=4
#         self.radar_feature_embed = RadarFeatureEmbedding(input_dim=in_dim, embed_dim=d_model) # 不傳入高度資訊
#         print("in_dim: ",in_dim)
#         self.radar_cross_attn = RadarCrossAttention(d_model, n_head)

#         self.dropout2 = nn.Dropout(dropout)
#         self.norm2 = nn.LayerNorm(d_model)

#         # ffn
#         self.linear1 = nn.Linear(d_model, dim_feedforward)
#         self.activation = getattr(F, activation)
#         self.dropout3 = nn.Dropout(dropout)
#         self.linear2 = nn.Linear(dim_feedforward, d_model)
#         self.dropout4 = nn.Dropout(dropout)
#         self.norm3 = nn.LayerNorm(d_model)

#         # ============================
#         self.enable_radar_cross = True   # True=用雷達點cross-attn，False=關掉
#         self.radar_attn_scale = nn.Parameter(torch.tensor(0.5))  # 初值稍弱


#     def with_pos_embed(self, tensor, pos):
#         return tensor if pos is None else tensor + pos

#     def forward_ffn(self, tgt):
#         return self.linear2(self.dropout3(self.activation(self.linear1(tgt))))

#     # 加入 radar_feats
#     def forward(self,
#                 tgt,
#                 reference_points,
#                 memory,
#                 memory_spatial_shapes,
#                 memory_level_start_index,
#                 radar_feats,
#                 radar_pad_mask=None,
#                 attn_mask=None,
#                 memory_mask=None,
#                 query_pos_embed=None
#                 ):
#         # self attention
#         q = k = self.with_pos_embed(tgt, query_pos_embed)

#         # if attn_mask is not None:
#         #     attn_mask = torch.where(
#         #         attn_mask.to(torch.bool),
#         #         torch.zeros_like(attn_mask),
#         #         torch.full_like(attn_mask, float('-inf'), dtype=tgt.dtype))

#         tgt2, _ = self.self_attn(q, k, value=tgt, attn_mask=attn_mask)
#         # print(attn_mask.shape)
#         # print(attn_mask)
#         # print("@@@@@@@@@@@@@@@@@@")
#         # print(memory_mask.shape)
#         tgt = tgt + self.dropout1(tgt2)
#         tgt = self.norm1(tgt)

#         # cross attention
#         tgt2 = self.cross_attn(\
#             self.with_pos_embed(tgt, query_pos_embed), 
#             reference_points, 
#             memory, 
#             memory_spatial_shapes, 
#             memory_mask)
        
#         if self.enable_radar_cross and (radar_feats is not None):
#             # ----- 雷達嵌入 + 屏蔽 padding -----
#             radar_embedded = self.radar_feature_embed(radar_feats)   # [B,Nmax,C]
#             if radar_pad_mask is not None:
#                 radar_embedded = radar_embedded.masked_fill(radar_pad_mask.unsqueeze(-1), 0.0)

#             # ----- 雷達 cross-attn（可選地帶 mask）-----
#             radar_attn = self.radar_cross_attn(tgt, radar_embedded, radar_pad_mask=radar_pad_mask)

#             # 將兩者進行融合（相加）
#             # tgt2 = tgt2 + radar_attn
#             tgt2 = tgt2 + self.radar_attn_scale * radar_attn


#         tgt = tgt + self.dropout2(tgt2)
#         tgt = self.norm2(tgt)

#         # ffn
#         tgt2 = self.forward_ffn(tgt)
#         tgt = tgt + self.dropout4(tgt2)
#         tgt = self.norm3(tgt)

#         return tgt


# class TransformerDecoder(nn.Module):
#     def __init__(self, hidden_dim, decoder_layer, num_layers, eval_idx=-1):
#         super(TransformerDecoder, self).__init__()
#         self.layers = nn.ModuleList([copy.deepcopy(decoder_layer) for _ in range(num_layers)])
#         self.hidden_dim = hidden_dim
#         self.num_layers = num_layers
#         self.eval_idx = eval_idx if eval_idx >= 0 else num_layers + eval_idx


#     def _pack_radar_list(self, radar_feats):
#         """把 list of [Ni,4] -> (x_pad [B,Nmax,4], pad_mask [B,Nmax], True=padding)"""
#         if not isinstance(radar_feats, (list, tuple)):
#             return radar_feats, None

#         B = len(radar_feats)
#         device = radar_feats[0].device
#         D = radar_feats[0].shape[1] if radar_feats[0].ndim == 2 else 4
#         lens = [r.shape[0] for r in radar_feats]
#         Nmax = max(lens) if lens else 0

#         x_pad = torch.zeros(B, Nmax, D, device=device, dtype=radar_feats[0].dtype)
#         pad_mask = torch.ones(B, Nmax, dtype=torch.bool, device=device)  # True=padding
#         for i, r in enumerate(radar_feats):
#             n = r.shape[0]
#             if n > 0:
#                 x_pad[i, :n, :] = r
#                 pad_mask[i, :n] = False
#         return x_pad, pad_mask


#     def forward(self,
#                 tgt,
#                 ref_points_unact,
#                 memory,
#                 memory_spatial_shapes,
#                 memory_level_start_index,
#                 bbox_head,
#                 score_head,
#                 query_pos_head,
#                 radar_feats, # 新增radar_feats參數,list([Ni,4]) 或 [B,N,4]
#                 attn_mask=None,
#                 memory_mask=None):
#         output = tgt
#         dec_out_bboxes = []
#         dec_out_logits = []
#         ref_points_detach = F.sigmoid(ref_points_unact)

#         # ==== 新增：把 list 打包成 [B,Nmax,4]，並取得 pad mask ====
#         radar_feats, radar_pad_mask = self._pack_radar_list(radar_feats)  # radar_feats: [B,Nmax,4]

#         for i, layer in enumerate(self.layers):
#             ref_points_input = ref_points_detach.unsqueeze(2)
#             query_pos_embed = query_pos_head(ref_points_detach)

#             output = layer(output, ref_points_input, memory,
#                            memory_spatial_shapes, memory_level_start_index,
#                            radar_feats, # 傳入radar_feats
#                            radar_pad_mask=radar_pad_mask,   # <<< 新增參數
#                            attn_mask=attn_mask, 
#                            memory_mask=memory_mask, 
#                            query_pos_embed=query_pos_embed)

#             inter_ref_bbox = F.sigmoid(bbox_head[i](output) + inverse_sigmoid(ref_points_detach))

#             if self.training:
#                 dec_out_logits.append(score_head[i](output))
#                 if i == 0:
#                     dec_out_bboxes.append(inter_ref_bbox)
#                 else:
#                     dec_out_bboxes.append(F.sigmoid(bbox_head[i](output) + inverse_sigmoid(ref_points)))

#             elif i == self.eval_idx:
#                 dec_out_logits.append(score_head[i](output))
#                 dec_out_bboxes.append(inter_ref_bbox)
#                 break

#             ref_points = inter_ref_bbox
#             ref_points_detach = inter_ref_bbox.detach(
#             ) if self.training else inter_ref_bbox

#         return torch.stack(dec_out_bboxes), torch.stack(dec_out_logits)


# @register
# class RTDETRTransformer(nn.Module):
#     __share__ = ['num_classes']
#     def __init__(self,
#                  num_classes=80,
#                  hidden_dim=256,
#                  num_queries=300,
#                  position_embed_type='sine',
#                  feat_channels=[512, 1024, 2048],
#                  feat_strides=[8, 16, 32],
#                  num_levels=3,
#                  num_decoder_points=4,
#                  nhead=8,
#                  num_decoder_layers=6,
#                  dim_feedforward=1024,
#                  dropout=0.,
#                  activation="relu",
#                  num_denoising=100,
#                  label_noise_ratio=0.5,
#                  box_noise_scale=1.0,
#                  learnt_init_query=False,
#                  eval_spatial_size=None,
#                  eval_idx=-1,
#                  eps=1e-2, 
#                  aux_loss=True):

#         super(RTDETRTransformer, self).__init__()
#         assert position_embed_type in ['sine', 'learned'], \
#             f'ValueError: position_embed_type not supported {position_embed_type}!'
#         assert len(feat_channels) <= num_levels
#         assert len(feat_strides) == len(feat_channels)
#         for _ in range(num_levels - len(feat_strides)):
#             feat_strides.append(feat_strides[-1] * 2)

#         self.hidden_dim = hidden_dim
#         self.nhead = nhead
#         self.feat_strides = feat_strides
#         self.num_levels = num_levels
#         self.num_classes = num_classes
#         self.num_queries = num_queries
#         self.eps = eps
#         self.num_decoder_layers = num_decoder_layers
#         self.eval_spatial_size = eval_spatial_size
#         self.aux_loss = aux_loss
#         # ==== fusion switches ====
#         self.use_radar_points  = False   # 控制「雷達點 → (PointNet) → Decoder cross-attn」
#         self.use_radar_heatmap = True  # 控制「雷達點 → heatmap → 加到 encoder memory」
#         self.radar_scale       = nn.Parameter(torch.tensor(0.1))  # heatmap 殘差強度
#         # --- NEW: safer defaults & gates ---
#         self.radar_level_gate = nn.Parameter(torch.zeros(self.num_levels))  # 每個 level 一個 scalar gate
#         self.modality_dropout_p = 0.3       # 訓練時隨機關掉雷達，逼網路學會用
#         self.hm_clip = 0.98                 # 98 百分位做熱圖正規化
#         # ===== Radar heatmap 參數（圓形，等向性）=====
#         self.radar_proj = nn.ModuleList([
#             nn.Conv2d(1, self.hidden_dim, kernel_size=1, bias=False)
#             for _ in range(self.num_levels)
#         ])
#         self.radar_sigma     = 0.015   # 以 [0,1] 座標為單位的 σ（越小越小顆）
#         self.radar_max_radius_px = 48 # 每點貼圖最大半徑（像素，上限）
#         self._disk_cache = {}         # {(sigma_px_四捨五入, radius_px): kernel_tensor}
#         # ==========================================

#         # backbone feature projection
#         self._build_input_proj_layer(feat_channels)



#         # Transformer module
#         decoder_layer = TransformerDecoderLayer(hidden_dim, nhead, dim_feedforward, dropout, activation, num_levels, num_decoder_points)
#         self.decoder = TransformerDecoder(hidden_dim, decoder_layer, num_decoder_layers, eval_idx)

#         self.num_denoising = num_denoising
#         self.label_noise_ratio = label_noise_ratio
#         self.box_noise_scale = box_noise_scale
#         # denoising part
#         if num_denoising > 0: 
#             # self.denoising_class_embed = nn.Embedding(num_classes, hidden_dim, padding_idx=num_classes-1) # TODO for load paddle weights
#             self.denoising_class_embed = nn.Embedding(num_classes+1, hidden_dim, padding_idx=num_classes)

#         # decoder embedding
#         self.learnt_init_query = learnt_init_query
#         if learnt_init_query:
#             self.tgt_embed = nn.Embedding(num_queries, hidden_dim)
#         self.query_pos_head = MLP(4, 2 * hidden_dim, hidden_dim, num_layers=2)

#         # encoder head
#         self.enc_output = nn.Sequential(
#             nn.Linear(hidden_dim, hidden_dim),
#             nn.LayerNorm(hidden_dim,)
#         )
#         self.enc_score_head = nn.Linear(hidden_dim, num_classes)
#         self.enc_bbox_head = MLP(hidden_dim, hidden_dim, 4, num_layers=3)

#         # decoder head
#         self.dec_score_head = nn.ModuleList([
#             nn.Linear(hidden_dim, num_classes)
#             for _ in range(num_decoder_layers)
#         ])
#         self.dec_bbox_head = nn.ModuleList([
#             MLP(hidden_dim, hidden_dim, 4, num_layers=3)
#             for _ in range(num_decoder_layers)
#         ])

#         # init encoder output anchors and valid_mask
#         if self.eval_spatial_size:
#             self.anchors, self.valid_mask = self._generate_anchors()

#         self._reset_parameters()

#     def _normalize_heatmap(self, hm, clip=0.98):
#         """
#         hm: [B,1,H,W]，做 per-image 百分位正規化，抑制全紅/全黑。
#         回傳 clamp 到 [0,1]。
#         """
#         B, _, H, W = hm.shape
#         flat = hm.reshape(B, -1)
#         # 98% 分位數（避免被少數大值主導）
#         q = torch.quantile(flat, torch.tensor(clip, device=hm.device, dtype=hm.dtype), dim=1, keepdim=True)
#         # 設一個安全下限，避免分母太小
#         q = torch.clamp(q, min=0.3)
#         hm = hm / (q.view(B, 1, 1, 1) + 1e-6)
#         return hm.clamp(0.0, 1.0)

#     def _get_gaussian_disk(self, sigma_px: float, radius_px: int, device, dtype):
#         """
#         產生一個圓形高斯貼圖（等向性），回傳 shape = [2R+1, 2R+1]、數值 0~1。
#         僅在 r <= 3σ 的圓內有值，圓外為 0；結果會快取起來重用。
#         """
#         R = int(max(2, radius_px))
#         key = (int(round(float(sigma_px))), int(R))
#         if key in self._disk_cache:
#             ker = self._disk_cache[key].to(device=device, dtype=dtype)
#             return ker

#         yy, xx = torch.meshgrid(
#             torch.arange(-R, R + 1, device=device, dtype=dtype),
#             torch.arange(-R, R + 1, device=device, dtype=dtype),
#             indexing="ij"
#         )
#         r2 = xx * xx + yy * yy
#         max_r = 3.0 * sigma_px
#         max_r2 = max_r * max_r

#         ker = torch.zeros((2 * R + 1, 2 * R + 1), device=device, dtype=dtype)
#         inside = r2 <= max_r2
#         # 高斯：exp( -0.5 * r^2 / σ^2 )
#         ker[inside] = torch.exp(-0.5 * (r2[inside] / (sigma_px * sigma_px + 1e-9)))

#         # 快取（存 CPU、float32 以節省顯存）
#         self._disk_cache[key] = ker.detach().to("cpu", torch.float32)
#         return ker
    
#     def _radar_points_to_pyramid_heatmaps(self, radar_feats, spatial_shapes, device, dtype):
#         """
#         把 batch 的雷達點（list[tensor [Ni,4]，內含 x,y,vx,vy]；x,y 已正規化到 [0,1]）
#         轉成每個金字塔一張 heatmap：list[level]，每張 shape=[B,1,h,w]、值域 0~1。

#         圖形為「圓形漸層」（等向性高斯），不再依速度拉長方向，避免出現方形邊。
#         """
#         B = len(radar_feats)
#         L = len(spatial_shapes)
#         heatmaps = []

#         for lvl in range(L):
#             h, w = spatial_shapes[lvl]
#             hm = torch.zeros((B, 1, h, w), device=device, dtype=dtype)

#             # 以較長邊換算像素尺度的 σ 與半徑
#             max_dim = max(h, w)
#             sigma_px = float(self.radar_sigma) * max_dim
#             radius_px = int(min(max(6, 3.0 * sigma_px), self.radar_max_radius_px))
#             # 生成/取用圓形高斯貼圖（共享 LUT）
#             disk = self._get_gaussian_disk(sigma_px, radius_px, device=device, dtype=dtype)  # [2R+1, 2R+1]
#             R = radius_px

#             for b in range(B):
#                 pts = radar_feats[b]
#                 if pts is None or pts.numel() == 0:
#                     continue

#                 # 取 (x,y)，忽略速度方向（只畫圓）
#                 xy = pts[:, :2]  # [Ni,2] in [0,1]

#                 # 轉像素座標（對齊像素中心）
#                 # u ∈ [0,w) 近似對應於 x_n * w - 0.5 的格點中心
#                 ux = torch.clamp(xy[:, 0] * w - 0.5, 0, w - 1).round().to(torch.int64)
#                 vy = torch.clamp(xy[:, 1] * h - 0.5, 0, h - 1).round().to(torch.int64)

#                 for px, py in zip(ux.tolist(), vy.tolist()):
#                     x0 = px - R
#                     y0 = py - R
#                     x1 = px + R + 1
#                     y1 = py + R + 1

#                     # 與影像交集
#                     ix0 = max(0, x0); iy0 = max(0, y0)
#                     ix1 = min(w, x1); iy1 = min(h, y1)
#                     if ix0 >= ix1 or iy0 >= iy1:
#                         continue

#                     # 對應到貼圖的子區域
#                     dx0 = ix0 - x0; dy0 = iy0 - y0
#                     dx1 = dx0 + (ix1 - ix0); dy1 = dy0 + (iy1 - iy0)

#                     # 疊加（加總；最後再 clamp 至 [0,1]）
#                     hm[b, 0, iy0:iy1, ix0:ix1] += disk[dy0:dy1, dx0:dx1]

#             # 夾到 [0,1]；你也可在這裡做百分位正規化（若之後覺得太亮）
#             # hm = torch.clamp(hm, 0.0, 1.0)
#             heatmaps.append(hm)

#         return heatmaps


#     def _reset_parameters(self):
#         bias = bias_init_with_prob(0.01)

#         init.constant_(self.enc_score_head.bias, bias)
#         init.constant_(self.enc_bbox_head.layers[-1].weight, 0)
#         init.constant_(self.enc_bbox_head.layers[-1].bias, 0)

#         for cls_, reg_ in zip(self.dec_score_head, self.dec_bbox_head):
#             init.constant_(cls_.bias, bias)
#             init.constant_(reg_.layers[-1].weight, 0)
#             init.constant_(reg_.layers[-1].bias, 0)
        
#         # linear_init_(self.enc_output[0])
#         init.xavier_uniform_(self.enc_output[0].weight)
#         if self.learnt_init_query:
#             init.xavier_uniform_(self.tgt_embed.weight)
#         init.xavier_uniform_(self.query_pos_head.layers[0].weight)
#         init.xavier_uniform_(self.query_pos_head.layers[1].weight)


#     def _build_input_proj_layer(self, feat_channels):
#         self.input_proj = nn.ModuleList()
#         for in_channels in feat_channels:
#             self.input_proj.append(
#                 nn.Sequential(OrderedDict([
#                     ('conv', nn.Conv2d(in_channels, self.hidden_dim, 1, bias=False)), 
#                     ('norm', nn.BatchNorm2d(self.hidden_dim,))])
#                 )
#             )

#         in_channels = feat_channels[-1]

#         for _ in range(self.num_levels - len(feat_channels)):
#             self.input_proj.append(
#                 nn.Sequential(OrderedDict([
#                     ('conv', nn.Conv2d(in_channels, self.hidden_dim, 3, 2, padding=1, bias=False)),
#                     ('norm', nn.BatchNorm2d(self.hidden_dim))])
#                 )
#             )
#             in_channels = self.hidden_dim

#     def _get_encoder_input(self, feats):
#         # get projection features
#         proj_feats = [self.input_proj[i](feat) for i, feat in enumerate(feats)]
#         if self.num_levels > len(proj_feats):
#             len_srcs = len(proj_feats)
#             for i in range(len_srcs, self.num_levels):
#                 if i == len_srcs:
#                     proj_feats.append(self.input_proj[i](feats[-1]))
#                 else:
#                     proj_feats.append(self.input_proj[i](proj_feats[-1]))

#         # get encoder inputs
#         feat_flatten = []
#         spatial_shapes = []
#         level_start_index = [0, ]
#         for i, feat in enumerate(proj_feats):
#             _, _, h, w = feat.shape
#             # [b, c, h, w] -> [b, h*w, c]
#             feat_flatten.append(feat.flatten(2).permute(0, 2, 1))
#             # [num_levels, 2]
#             spatial_shapes.append([h, w])
#             # [l], start index of each level
#             level_start_index.append(h * w + level_start_index[-1])

#         # [b, l, c]
#         feat_flatten = torch.concat(feat_flatten, 1)
#         level_start_index.pop()
#         return (feat_flatten, spatial_shapes, level_start_index)

#     def _generate_anchors(self,
#                           spatial_shapes=None,
#                           grid_size=0.05,
#                           dtype=torch.float32,
#                           device='cpu'):
#         if spatial_shapes is None:
#             spatial_shapes = [[int(self.eval_spatial_size[0] / s), int(self.eval_spatial_size[1] / s)]
#                 for s in self.feat_strides
#             ]
#         anchors = []
#         for lvl, (h, w) in enumerate(spatial_shapes):
#             grid_y, grid_x = torch.meshgrid(\
#                 torch.arange(end=h, dtype=dtype), \
#                 torch.arange(end=w, dtype=dtype), indexing='ij')
#             grid_xy = torch.stack([grid_x, grid_y], -1)
#             valid_WH = torch.tensor([w, h]).to(dtype)
#             grid_xy = (grid_xy.unsqueeze(0) + 0.5) / valid_WH
#             wh = torch.ones_like(grid_xy) * grid_size * (2.0 ** lvl)
#             anchors.append(torch.concat([grid_xy, wh], -1).reshape(-1, h * w, 4))

#         anchors = torch.concat(anchors, 1).to(device)
#         valid_mask = ((anchors > self.eps) * (anchors < 1 - self.eps)).all(-1, keepdim=True)
#         anchors = torch.log(anchors / (1 - anchors))
#         # anchors = torch.where(valid_mask, anchors, float('inf'))
#         # anchors[valid_mask] = torch.inf # valid_mask [1, 8400, 1]
#         anchors = torch.where(valid_mask, anchors, torch.inf)

#         return anchors, valid_mask


#     def _get_decoder_input(self,
#                            memory,
#                            spatial_shapes,
#                            denoising_class=None,
#                            denoising_bbox_unact=None):
#         bs, _, _ = memory.shape
#         # prepare input for decoder
#         if self.training or self.eval_spatial_size is None:
#             anchors, valid_mask = self._generate_anchors(spatial_shapes, device=memory.device)
#         else:
#             anchors, valid_mask = self.anchors.to(memory.device), self.valid_mask.to(memory.device)

#         # memory = torch.where(valid_mask, memory, 0)
#         memory = valid_mask.to(memory.dtype) * memory  # TODO fix type error for onnx export 

#         output_memory = self.enc_output(memory)

#         enc_outputs_class = self.enc_score_head(output_memory)
#         enc_outputs_coord_unact = self.enc_bbox_head(output_memory) + anchors

#         _, topk_ind = torch.topk(enc_outputs_class.max(-1).values, self.num_queries, dim=1)
        
#         reference_points_unact = enc_outputs_coord_unact.gather(dim=1, \
#             index=topk_ind.unsqueeze(-1).repeat(1, 1, enc_outputs_coord_unact.shape[-1]))

#         enc_topk_bboxes = F.sigmoid(reference_points_unact)
#         if denoising_bbox_unact is not None:
#             reference_points_unact = torch.concat(
#                 [denoising_bbox_unact, reference_points_unact], 1)
        
#         enc_topk_logits = enc_outputs_class.gather(dim=1, \
#             index=topk_ind.unsqueeze(-1).repeat(1, 1, enc_outputs_class.shape[-1]))

#         # extract region features
#         if self.learnt_init_query:
#             target = self.tgt_embed.weight.unsqueeze(0).tile([bs, 1, 1])
#         else:
#             target = output_memory.gather(dim=1, \
#                 index=topk_ind.unsqueeze(-1).repeat(1, 1, output_memory.shape[-1]))
#             target = target.detach()

#         if denoising_class is not None:
#             target = torch.concat([denoising_class, target], 1)

#         return target, reference_points_unact.detach(), enc_topk_bboxes, enc_topk_logits

#     ########### RADAR ##############
#     def forward(self, feats, radar_feats, targets=None):
#         if not hasattr(self, "_printed_fusion_mode"):
#             mode = []
#             if self.use_radar_points:  mode.append("RadarPoints")
#             if self.use_radar_heatmap: mode.append("Heatmap")
#             if not mode:               mode.append("ImageOnly")
#             print(f"[RTDETRTransformer] Fusion Mode: { '+'.join(mode) }")
#             self._printed_fusion_mode = True
#         # input projection and embedding
#         (memory, spatial_shapes, level_start_index) = self._get_encoder_input(feats)

#         # ====== 由雷達點做 heatmap，並在 encoder 輸入前融合（新增）======
#         # radar_feats 目前是 list([Ni,4])（x,y,vx,vy），假設 x,y 已是影像座標的 [0,1] 正規化
#         if self.use_radar_heatmap and isinstance(radar_feats, (list, tuple)):
#             B = len(radar_feats)
#             device = memory.device
#             dtype = memory.dtype

#             # 1) 生成每層 heatmap：[level] -> [B,1,h,w]
#             pyr_heatmaps = self._radar_points_to_pyramid_heatmaps(
#                 radar_feats, spatial_shapes, device=device, dtype=dtype
#             )

#             # (可選) 訓練時隨機關掉雷達，避免網路只依賴某一模態
#             use_radar_now = True
#             # if self.training and (torch.rand(1, device=memory.device) < self.modality_dropout_p):
#             #     use_radar_now = False

#             if use_radar_now:
#                 print("used heatmap")
#                 add_list = []
#                 for lvl, hm in enumerate(pyr_heatmaps):
#                     # 先做百分位正規化，穩定尺度
#                     hm = self._normalize_heatmap(hm, clip=self.hm_clip)   # [B,1,h,w]
#                     add_on = self.radar_proj[lvl](hm)                     # [B,C,h,w]
#                     add_on = add_on.flatten(2).permute(0, 2, 1)           # [B,h*w,C]

#                     # per-level scalar gate（Sigmoid 0~1），再乘全域 learnable scale
#                     gate = torch.sigmoid(self.radar_level_gate[lvl]) * self.radar_scale
#                     add_on = gate * add_on
#                     add_list.append(add_on)

#                 if add_list:
#                     radar_bias = torch.cat(add_list, dim=1)               # [B, sum(h*w), C]
#                     memory = memory + radar_bias
#         # ==============================================================

#         # ====== 同步 Decoder 旗標 + 決定是否把雷達點丟進 Decoder ======
#         for lyr in self.decoder.layers:
#             lyr.enable_radar_cross = self.use_radar_points  # <- NEW：開/關雷達 cross-attn

#         radar_for_decoder = radar_feats if self.use_radar_points else None  # <- NEW
#         # ==============================================================
        
#         # prepare denoising training
#         if self.training and self.num_denoising > 0:
#             denoising_class, denoising_bbox_unact, attn_mask, dn_meta = \
#                 get_contrastive_denoising_training_group(targets, \
#                     self.num_classes, 
#                     self.num_queries, 
#                     self.denoising_class_embed, 
#                     num_denoising=self.num_denoising, 
#                     label_noise_ratio=self.label_noise_ratio, 
#                     box_noise_scale=self.box_noise_scale, )
#         else:
#             denoising_class, denoising_bbox_unact, attn_mask, dn_meta = None, None, None, None

#         target, init_ref_points_unact, enc_topk_bboxes, enc_topk_logits = \
#             self._get_decoder_input(memory, spatial_shapes, denoising_class, denoising_bbox_unact)

#         # decoder
#         out_bboxes, out_logits = self.decoder(
#             target,
#             init_ref_points_unact,
#             memory,
#             spatial_shapes,
#             level_start_index,
#             self.dec_bbox_head,
#             self.dec_score_head,
#             self.query_pos_head,
#             radar_feats=radar_for_decoder, # 新增 radar_feats
#             attn_mask=attn_mask)

#         if self.training and dn_meta is not None:
#             dn_out_bboxes, out_bboxes = torch.split(out_bboxes, dn_meta['dn_num_split'], dim=2)
#             dn_out_logits, out_logits = torch.split(out_logits, dn_meta['dn_num_split'], dim=2)

#         out = {'pred_logits': out_logits[-1], 'pred_boxes': out_bboxes[-1]}

#         if self.training and self.aux_loss:
#             out['aux_outputs'] = self._set_aux_loss(out_logits[:-1], out_bboxes[:-1])
#             out['aux_outputs'].extend(self._set_aux_loss([enc_topk_logits], [enc_topk_bboxes]))
            
#             if self.training and dn_meta is not None:
#                 out['dn_aux_outputs'] = self._set_aux_loss(dn_out_logits, dn_out_bboxes)
#                 out['dn_meta'] = dn_meta

#         return out


#     @torch.jit.unused
#     def _set_aux_loss(self, outputs_class, outputs_coord):
#         # this is a workaround to make torchscript happy, as torchscript
#         # doesn't support dictionary with non-homogeneous values, such
#         # as a dict having both a Tensor and a list.
#         return [{'pred_logits': a, 'pred_boxes': b}
#                 for a, b in zip(outputs_class, outputs_coord)]






#################################################################
###################### Radar + image ##############################
#################################################################
"""by lyuwenyu
"""

import math 
import copy 
from collections import OrderedDict

import torch 
import torch.nn as nn 
import torch.nn.functional as F 
import torch.nn.init as init 
import numpy as np


from .denoising import get_contrastive_denoising_training_group
from .utils import deformable_attention_core_func, get_activation, inverse_sigmoid
from .utils import bias_init_with_prob


from src.core import register
from .pointnet_utils import PointNetEncoder, STN3d, STN2d
from .pointnet2_utils import PointNetSetAbstractionMsg, PointNetSetAbstraction
from .SECOND import VoxelFeatureExtractor, get_paddings_indicator


__all__ = ['RTDETRTransformer']



class MLP(nn.Module):
    def __init__(self, input_dim, hidden_dim, output_dim, num_layers, act='relu'):
        super().__init__()
        self.num_layers = num_layers
        h = [hidden_dim] * (num_layers - 1)
        self.layers = nn.ModuleList(nn.Linear(n, k) for n, k in zip([input_dim] + h, h + [output_dim]))
        self.act = nn.Identity() if act is None else get_activation(act)

    def forward(self, x):
        for i, layer in enumerate(self.layers):
            x = self.act(layer(x)) if i < self.num_layers - 1 else layer(x)
        return x



class MSDeformableAttention(nn.Module):
    def __init__(self, embed_dim=256, num_heads=8, num_levels=4, num_points=4,):
        """
        Multi-Scale Deformable Attention Module
        """
        super(MSDeformableAttention, self).__init__()
        self.embed_dim = embed_dim
        self.num_heads = num_heads
        self.num_levels = num_levels
        self.num_points = num_points
        self.total_points = num_heads * num_levels * num_points

        self.head_dim = embed_dim // num_heads
        assert self.head_dim * num_heads == self.embed_dim, "embed_dim must be divisible by num_heads"

        self.sampling_offsets = nn.Linear(embed_dim, self.total_points * 2,)
        self.attention_weights = nn.Linear(embed_dim, self.total_points)
        self.value_proj = nn.Linear(embed_dim, embed_dim)
        self.output_proj = nn.Linear(embed_dim, embed_dim)

        self.ms_deformable_attn_core = deformable_attention_core_func

        self._reset_parameters()


    def _reset_parameters(self):
        # sampling_offsets
        init.constant_(self.sampling_offsets.weight, 0)
        thetas = torch.arange(self.num_heads, dtype=torch.float32) * (2.0 * math.pi / self.num_heads)
        grid_init = torch.stack([thetas.cos(), thetas.sin()], -1)
        grid_init = grid_init / grid_init.abs().max(-1, keepdim=True).values
        grid_init = grid_init.reshape(self.num_heads, 1, 1, 2).tile([1, self.num_levels, self.num_points, 1])
        scaling = torch.arange(1, self.num_points + 1, dtype=torch.float32).reshape(1, 1, -1, 1)
        grid_init *= scaling
        self.sampling_offsets.bias.data[...] = grid_init.flatten()

        # attention_weights
        init.constant_(self.attention_weights.weight, 0)
        init.constant_(self.attention_weights.bias, 0)

        # proj
        init.xavier_uniform_(self.value_proj.weight)
        init.constant_(self.value_proj.bias, 0)
        init.xavier_uniform_(self.output_proj.weight)
        init.constant_(self.output_proj.bias, 0)


    def forward(self,
                query,
                reference_points,
                value,
                value_spatial_shapes,
                value_mask=None):
        """
        Args:
            query (Tensor): [bs, query_length, C]
            reference_points (Tensor): [bs, query_length, n_levels, 2], range in [0, 1], top-left (0,0),
                bottom-right (1, 1), including padding area
            value (Tensor): [bs, value_length, C]
            value_spatial_shapes (List): [n_levels, 2], [(H_0, W_0), (H_1, W_1), ..., (H_{L-1}, W_{L-1})]
            value_level_start_index (List): [n_levels], [0, H_0*W_0, H_0*W_0+H_1*W_1, ...]
            value_mask (Tensor): [bs, value_length], True for non-padding elements, False for padding elements

        Returns:
            output (Tensor): [bs, Length_{query}, C]
        """
        bs, Len_q = query.shape[:2]
        Len_v = value.shape[1]

        value = self.value_proj(value)
        if value_mask is not None:
            value_mask = value_mask.astype(value.dtype).unsqueeze(-1)
            value *= value_mask
        value = value.reshape(bs, Len_v, self.num_heads, self.head_dim)

        sampling_offsets = self.sampling_offsets(query).reshape(
            bs, Len_q, self.num_heads, self.num_levels, self.num_points, 2)
        attention_weights = self.attention_weights(query).reshape(
            bs, Len_q, self.num_heads, self.num_levels * self.num_points)
        attention_weights = F.softmax(attention_weights, dim=-1).reshape(
            bs, Len_q, self.num_heads, self.num_levels, self.num_points)

        if reference_points.shape[-1] == 2:
            offset_normalizer = torch.tensor(value_spatial_shapes)
            offset_normalizer = offset_normalizer.flip([1]).reshape(
                1, 1, 1, self.num_levels, 1, 2)
            sampling_locations = reference_points.reshape(
                bs, Len_q, 1, self.num_levels, 1, 2
            ) + sampling_offsets / offset_normalizer
        elif reference_points.shape[-1] == 4:
            sampling_locations = (
                reference_points[:, :, None, :, None, :2] + sampling_offsets /
                self.num_points * reference_points[:, :, None, :, None, 2:] * 0.5)
        else:
            raise ValueError(
                "Last dim of reference_points must be 2 or 4, but get {} instead.".
                format(reference_points.shape[-1]))

        output = self.ms_deformable_attn_core(value, value_spatial_shapes, sampling_locations, attention_weights)

        output = self.output_proj(output)

        return output


# =============================
# 雷達特徵嵌入層 (RadarFeatureEmbedding)
# 將 (x, y, z, vx, vy) 投影為 d_model 維度的嵌入向量
# =============================
class RadarFeatureEmbedding(nn.Module):
    # =============================
    # Linear + LayerNorm
    # =============================
    # def __init__(self, input_dim=5, embed_dim=256): 
    #     super(RadarFeatureEmbedding, self).__init__()
    #     self.fc = nn.Linear(input_dim, embed_dim)
    #     self.norm = nn.LayerNorm(embed_dim)

    # def forward(self, radar_feats):
    #     # radar_feats: [batch_size, num_radar_points, 5]
    #     embedded = self.fc(radar_feats)
    #     embedded = self.norm(embedded)
    #     return embedded

    # =============================
    # pointnet+STN2d(https://github.com/yanx27/Pointnet_Pointnet2_pytorch/blob/master/models/pointnet_utils.py)
    # =============================
    def __init__(self, input_dim=4, embed_dim=256):
        super().__init__()
        self.stn = STN2d(2)  # 只對 x, y 做 2x2 變換
        self.conv1 = nn.Conv1d(input_dim, 64, 1)
        self.conv2 = nn.Conv1d(64, 128, 1)
        self.conv3 = nn.Conv1d(128, 1024, 1)
        self.bn1 = nn.BatchNorm1d(64)
        self.bn2 = nn.BatchNorm1d(128)
        self.bn3 = nn.BatchNorm1d(1024)
        self.projector = nn.Linear(1024, embed_dim)
        self.norm = nn.LayerNorm(embed_dim)

    def forward(self, x):
        # x: [B, N, 4] (x, y, vx, vy)
        x = x.transpose(1, 2)  # → [B, 4, N]
        B, C, N = x.shape

        # === 1. 拿出 (x, y) 給 STN2d 做變換 ===
        xy = x[:, :2, :]                           # → [B, 2, N]
        extra = x[:, 2:, :]                        # → [B, 2, N]

        trans = self.stn(xy)                       # → [B, 2, 2]
        xy_trans = torch.bmm(trans, xy)            # → [B, 2, N]

        # === 2. 拼回完整特徵 ===
        x = torch.cat([xy_trans, extra], dim=1)    # → [B, 4, N]

        # === 3. 通過 Conv 路徑 ===
        x = F.relu(self.bn1(self.conv1(x)))        # → [B, 64, N]
        x = F.relu(self.bn2(self.conv2(x)))        # → [B, 128, N]
        x = F.relu(self.bn3(self.conv3(x)))        # → [B, 1024, N]

        x = x.transpose(1, 2)                      # → [B, N, 1024]
        x = self.projector(x)                      # → [B, N, embed_dim]
        x = self.norm(x)
        return x




# =============================
# 雷達數據的跨注意力機制 (RadarCrossAttention)
# =============================
class RadarCrossAttention(nn.Module):
    def __init__(self, embed_dim=256, num_heads=8, num_points=4):
        super(RadarCrossAttention, self).__init__()
        self.embed_dim = embed_dim
        self.num_heads = num_heads
        self.num_points = num_points

        self.head_dim = embed_dim // num_heads
        assert self.head_dim * num_heads == self.embed_dim, "embed_dim must be divisible by num_heads"

        self.sampling_offsets = nn.Linear(embed_dim, num_heads * num_points * 2)
        self.attention_weights = nn.Linear(embed_dim, num_heads * num_points)
        self.value_proj = nn.Linear(embed_dim, embed_dim)
        self.output_proj = nn.Linear(embed_dim, embed_dim)

        self._reset_parameters()

    def _reset_parameters(self):
        init.constant_(self.sampling_offsets.weight, 0)
        init.constant_(self.sampling_offsets.bias, 0)
        init.constant_(self.attention_weights.weight, 0)
        init.constant_(self.attention_weights.bias, 0)
        init.xavier_uniform_(self.value_proj.weight)
        init.constant_(self.value_proj.bias, 0)
        init.xavier_uniform_(self.output_proj.weight)
        init.constant_(self.output_proj.bias, 0)

    def forward(self, query, radar_feats, radar_pad_mask=None):
        # query: [batch_size, query_length, embed_dim]
        # radar_feats: [batch_size, num_radar_points, embed_dim]
        bs, Len_q, _ = query.shape
        Len_v = radar_feats.shape[1]
        value = self.value_proj(radar_feats).reshape(bs, Len_v, self.num_heads, self.head_dim)
        if radar_pad_mask is not None:
            # radar_pad_mask: [B,V], True=padding
            value = value.masked_fill(radar_pad_mask.unsqueeze(-1).unsqueeze(-1), 0.0)

        sampling_offsets = self.sampling_offsets(query).reshape(bs, Len_q, self.num_heads, self.num_points, 2)
        attention_weights = self.attention_weights(query).reshape(bs, Len_q, self.num_heads, self.num_points)
        attention_weights = F.softmax(attention_weights, dim=-1)

        # output = torch.einsum("bqhp,bvhp->bqhp", attention_weights, value)
        # query: [B, Q, C], value: [B, V, C] → 先轉成 [B, Q, H, D] and [B, V, H, D]
        Q = query.shape[1]
        query = query.view(bs, Q, self.num_heads, self.head_dim)
        value = value  # already in [B, V, H, D]
        scores = torch.einsum('bqhd,bvhd->bqhv', query, value)
        weights = F.softmax(scores, dim=-1)
        output = torch.einsum('bqhv,bvhd->bqhd', weights, value)

        
        output = output.reshape(bs, Q, -1)
        output = self.output_proj(output)

        return output
    



class TransformerDecoderLayer(nn.Module):
    def __init__(self,
                 d_model=256,
                 n_head=8,
                 dim_feedforward=1024,
                 dropout=0.,
                 activation="relu",
                 n_levels=4,
                 n_points=4,):
        super(TransformerDecoderLayer, self).__init__()

        # self attention
        self.self_attn = nn.MultiheadAttention(d_model, n_head, dropout=dropout, batch_first=True)
        self.dropout1 = nn.Dropout(dropout)
        self.norm1 = nn.LayerNorm(d_model)

        # cross attention
        self.cross_attn = MSDeformableAttention(d_model, n_head, n_levels, n_points)

        # 雷達數據的跨注意力機制
        in_dim=4
        self.radar_feature_embed = RadarFeatureEmbedding(input_dim=in_dim, embed_dim=d_model) # 不傳入高度資訊
        print("in_dim: ",in_dim)
        self.radar_cross_attn = RadarCrossAttention(d_model, n_head)

        self.dropout2 = nn.Dropout(dropout)
        self.norm2 = nn.LayerNorm(d_model)

        # ffn
        self.linear1 = nn.Linear(d_model, dim_feedforward)
        self.activation = getattr(F, activation)
        self.dropout3 = nn.Dropout(dropout)
        self.linear2 = nn.Linear(dim_feedforward, d_model)
        self.dropout4 = nn.Dropout(dropout)
        self.norm3 = nn.LayerNorm(d_model)

        # self._reset_parameters()

    # def _reset_parameters(self):
    #     linear_init_(self.linear1)
    #     linear_init_(self.linear2)
    #     xavier_uniform_(self.linear1.weight)
    #     xavier_uniform_(self.linear2.weight)

    def with_pos_embed(self, tensor, pos):
        return tensor if pos is None else tensor + pos

    def forward_ffn(self, tgt):
        return self.linear2(self.dropout3(self.activation(self.linear1(tgt))))

    # 加入 radar_feats
    def forward(self,
                tgt,
                reference_points,
                memory,
                memory_spatial_shapes,
                memory_level_start_index,
                radar_feats,
                radar_pad_mask=None,
                attn_mask=None,
                memory_mask=None,
                query_pos_embed=None
                ):
        # self attention
        q = k = self.with_pos_embed(tgt, query_pos_embed)

        # if attn_mask is not None:
        #     attn_mask = torch.where(
        #         attn_mask.to(torch.bool),
        #         torch.zeros_like(attn_mask),
        #         torch.full_like(attn_mask, float('-inf'), dtype=tgt.dtype))

        tgt2, _ = self.self_attn(q, k, value=tgt, attn_mask=attn_mask)
        # print(attn_mask.shape)
        # print(attn_mask)
        # print("@@@@@@@@@@@@@@@@@@")
        # print(memory_mask.shape)
        tgt = tgt + self.dropout1(tgt2)
        tgt = self.norm1(tgt)

        # cross attention
        tgt2 = self.cross_attn(\
            self.with_pos_embed(tgt, query_pos_embed), 
            reference_points, 
            memory, 
            memory_spatial_shapes, 
            memory_mask)
        
        # ----- 雷達嵌入 + 屏蔽 padding -----
        radar_embedded = self.radar_feature_embed(radar_feats)   # [B,Nmax,C]
        if radar_pad_mask is not None:
            radar_embedded = radar_embedded.masked_fill(radar_pad_mask.unsqueeze(-1), 0.0)

        # ----- 雷達 cross-attn（可選地帶 mask）-----
        radar_attn = self.radar_cross_attn(tgt, radar_embedded, radar_pad_mask=radar_pad_mask)

        # 將兩者進行融合（相加）
        tgt2 = tgt2 + radar_attn


        tgt = tgt + self.dropout2(tgt2)
        tgt = self.norm2(tgt)

        # ffn
        tgt2 = self.forward_ffn(tgt)
        tgt = tgt + self.dropout4(tgt2)
        tgt = self.norm3(tgt)

        return tgt


class TransformerDecoder(nn.Module):
    def __init__(self, hidden_dim, decoder_layer, num_layers, eval_idx=-1):
        super(TransformerDecoder, self).__init__()
        self.layers = nn.ModuleList([copy.deepcopy(decoder_layer) for _ in range(num_layers)])
        self.hidden_dim = hidden_dim
        self.num_layers = num_layers
        self.eval_idx = eval_idx if eval_idx >= 0 else num_layers + eval_idx


    def _pack_radar_list(self, radar_feats):
        """把 list of [Ni,4] -> (x_pad [B,Nmax,4], pad_mask [B,Nmax], True=padding)"""
        if not isinstance(radar_feats, (list, tuple)):
            return radar_feats, None

        B = len(radar_feats)
        device = radar_feats[0].device
        D = radar_feats[0].shape[1] if radar_feats[0].ndim == 2 else 4
        lens = [r.shape[0] for r in radar_feats]
        Nmax = max(lens) if lens else 0

        x_pad = torch.zeros(B, Nmax, D, device=device, dtype=radar_feats[0].dtype)
        pad_mask = torch.ones(B, Nmax, dtype=torch.bool, device=device)  # True=padding
        for i, r in enumerate(radar_feats):
            n = r.shape[0]
            if n > 0:
                x_pad[i, :n, :] = r
                pad_mask[i, :n] = False
        return x_pad, pad_mask


    def forward(self,
                tgt,
                ref_points_unact,
                memory,
                memory_spatial_shapes,
                memory_level_start_index,
                bbox_head,
                score_head,
                query_pos_head,
                radar_feats, # 新增radar_feats參數,list([Ni,4]) 或 [B,N,4]
                attn_mask=None,
                memory_mask=None):
        output = tgt
        dec_out_bboxes = []
        dec_out_logits = []
        ref_points_detach = F.sigmoid(ref_points_unact)

        # ==== 新增：把 list 打包成 [B,Nmax,4]，並取得 pad mask ====
        radar_feats, radar_pad_mask = self._pack_radar_list(radar_feats)  # radar_feats: [B,Nmax,4]

        for i, layer in enumerate(self.layers):
            ref_points_input = ref_points_detach.unsqueeze(2)
            query_pos_embed = query_pos_head(ref_points_detach)

            output = layer(output, ref_points_input, memory,
                           memory_spatial_shapes, memory_level_start_index,
                           radar_feats, # 傳入radar_feats
                           radar_pad_mask=radar_pad_mask,   # <<< 新增參數
                           attn_mask=attn_mask, 
                           memory_mask=memory_mask, 
                           query_pos_embed=query_pos_embed)

            inter_ref_bbox = F.sigmoid(bbox_head[i](output) + inverse_sigmoid(ref_points_detach))

            if self.training:
                dec_out_logits.append(score_head[i](output))
                if i == 0:
                    dec_out_bboxes.append(inter_ref_bbox)
                else:
                    dec_out_bboxes.append(F.sigmoid(bbox_head[i](output) + inverse_sigmoid(ref_points)))

            elif i == self.eval_idx:
                dec_out_logits.append(score_head[i](output))
                dec_out_bboxes.append(inter_ref_bbox)
                break

            ref_points = inter_ref_bbox
            ref_points_detach = inter_ref_bbox.detach(
            ) if self.training else inter_ref_bbox

        return torch.stack(dec_out_bboxes), torch.stack(dec_out_logits)


@register
class RTDETRTransformer(nn.Module):
    __share__ = ['num_classes']
    def __init__(self,
                 num_classes=80,
                 hidden_dim=256,
                 num_queries=300,
                 position_embed_type='sine',
                 feat_channels=[512, 1024, 2048],
                 feat_strides=[8, 16, 32],
                 num_levels=3,
                 num_decoder_points=4,
                 nhead=8,
                 num_decoder_layers=6,
                 dim_feedforward=1024,
                 dropout=0.,
                 activation="relu",
                 num_denoising=100,
                 label_noise_ratio=0.5,
                 box_noise_scale=1.0,
                 learnt_init_query=False,
                 eval_spatial_size=None,
                 eval_idx=-1,
                 eps=1e-2, 
                 aux_loss=True):

        super(RTDETRTransformer, self).__init__()
        assert position_embed_type in ['sine', 'learned'], \
            f'ValueError: position_embed_type not supported {position_embed_type}!'
        assert len(feat_channels) <= num_levels
        assert len(feat_strides) == len(feat_channels)
        for _ in range(num_levels - len(feat_strides)):
            feat_strides.append(feat_strides[-1] * 2)

        self.hidden_dim = hidden_dim
        self.nhead = nhead
        self.feat_strides = feat_strides
        self.num_levels = num_levels
        self.num_classes = num_classes
        self.num_queries = num_queries
        self.eps = eps
        self.num_decoder_layers = num_decoder_layers
        self.eval_spatial_size = eval_spatial_size
        self.aux_loss = aux_loss

        # backbone feature projection
        self._build_input_proj_layer(feat_channels)

        # Transformer module
        decoder_layer = TransformerDecoderLayer(hidden_dim, nhead, dim_feedforward, dropout, activation, num_levels, num_decoder_points)
        self.decoder = TransformerDecoder(hidden_dim, decoder_layer, num_decoder_layers, eval_idx)

        self.num_denoising = num_denoising
        self.label_noise_ratio = label_noise_ratio
        self.box_noise_scale = box_noise_scale
        # denoising part
        if num_denoising > 0: 
            # self.denoising_class_embed = nn.Embedding(num_classes, hidden_dim, padding_idx=num_classes-1) # TODO for load paddle weights
            self.denoising_class_embed = nn.Embedding(num_classes+1, hidden_dim, padding_idx=num_classes)

        # decoder embedding
        self.learnt_init_query = learnt_init_query
        if learnt_init_query:
            self.tgt_embed = nn.Embedding(num_queries, hidden_dim)
        self.query_pos_head = MLP(4, 2 * hidden_dim, hidden_dim, num_layers=2)

        # encoder head
        self.enc_output = nn.Sequential(
            nn.Linear(hidden_dim, hidden_dim),
            nn.LayerNorm(hidden_dim,)
        )
        self.enc_score_head = nn.Linear(hidden_dim, num_classes)
        self.enc_bbox_head = MLP(hidden_dim, hidden_dim, 4, num_layers=3)

        # decoder head
        self.dec_score_head = nn.ModuleList([
            nn.Linear(hidden_dim, num_classes)
            for _ in range(num_decoder_layers)
        ])
        self.dec_bbox_head = nn.ModuleList([
            MLP(hidden_dim, hidden_dim, 4, num_layers=3)
            for _ in range(num_decoder_layers)
        ])

        # init encoder output anchors and valid_mask
        if self.eval_spatial_size:
            self.anchors, self.valid_mask = self._generate_anchors()

        self._reset_parameters()

    def _reset_parameters(self):
        bias = bias_init_with_prob(0.01)

        init.constant_(self.enc_score_head.bias, bias)
        init.constant_(self.enc_bbox_head.layers[-1].weight, 0)
        init.constant_(self.enc_bbox_head.layers[-1].bias, 0)

        for cls_, reg_ in zip(self.dec_score_head, self.dec_bbox_head):
            init.constant_(cls_.bias, bias)
            init.constant_(reg_.layers[-1].weight, 0)
            init.constant_(reg_.layers[-1].bias, 0)
        
        # linear_init_(self.enc_output[0])
        init.xavier_uniform_(self.enc_output[0].weight)
        if self.learnt_init_query:
            init.xavier_uniform_(self.tgt_embed.weight)
        init.xavier_uniform_(self.query_pos_head.layers[0].weight)
        init.xavier_uniform_(self.query_pos_head.layers[1].weight)


    def _build_input_proj_layer(self, feat_channels):
        self.input_proj = nn.ModuleList()
        for in_channels in feat_channels:
            self.input_proj.append(
                nn.Sequential(OrderedDict([
                    ('conv', nn.Conv2d(in_channels, self.hidden_dim, 1, bias=False)), 
                    ('norm', nn.BatchNorm2d(self.hidden_dim,))])
                )
            )

        in_channels = feat_channels[-1]

        for _ in range(self.num_levels - len(feat_channels)):
            self.input_proj.append(
                nn.Sequential(OrderedDict([
                    ('conv', nn.Conv2d(in_channels, self.hidden_dim, 3, 2, padding=1, bias=False)),
                    ('norm', nn.BatchNorm2d(self.hidden_dim))])
                )
            )
            in_channels = self.hidden_dim

    def _get_encoder_input(self, feats):
        # get projection features
        proj_feats = [self.input_proj[i](feat) for i, feat in enumerate(feats)]
        if self.num_levels > len(proj_feats):
            len_srcs = len(proj_feats)
            for i in range(len_srcs, self.num_levels):
                if i == len_srcs:
                    proj_feats.append(self.input_proj[i](feats[-1]))
                else:
                    proj_feats.append(self.input_proj[i](proj_feats[-1]))

        # get encoder inputs
        feat_flatten = []
        spatial_shapes = []
        level_start_index = [0, ]
        for i, feat in enumerate(proj_feats):
            _, _, h, w = feat.shape
            # [b, c, h, w] -> [b, h*w, c]
            feat_flatten.append(feat.flatten(2).permute(0, 2, 1))
            # [num_levels, 2]
            spatial_shapes.append([h, w])
            # [l], start index of each level
            level_start_index.append(h * w + level_start_index[-1])

        # [b, l, c]
        feat_flatten = torch.concat(feat_flatten, 1)
        level_start_index.pop()
        return (feat_flatten, spatial_shapes, level_start_index)

    def _generate_anchors(self,
                          spatial_shapes=None,
                          grid_size=0.05,
                          dtype=torch.float32,
                          device='cpu'):
        if spatial_shapes is None:
            spatial_shapes = [[int(self.eval_spatial_size[0] / s), int(self.eval_spatial_size[1] / s)]
                for s in self.feat_strides
            ]
        anchors = []
        for lvl, (h, w) in enumerate(spatial_shapes):
            grid_y, grid_x = torch.meshgrid(\
                torch.arange(end=h, dtype=dtype), \
                torch.arange(end=w, dtype=dtype), indexing='ij')
            grid_xy = torch.stack([grid_x, grid_y], -1)
            valid_WH = torch.tensor([w, h]).to(dtype)
            grid_xy = (grid_xy.unsqueeze(0) + 0.5) / valid_WH
            wh = torch.ones_like(grid_xy) * grid_size * (2.0 ** lvl)
            anchors.append(torch.concat([grid_xy, wh], -1).reshape(-1, h * w, 4))

        anchors = torch.concat(anchors, 1).to(device)
        valid_mask = ((anchors > self.eps) * (anchors < 1 - self.eps)).all(-1, keepdim=True)
        anchors = torch.log(anchors / (1 - anchors))
        # anchors = torch.where(valid_mask, anchors, float('inf'))
        # anchors[valid_mask] = torch.inf # valid_mask [1, 8400, 1]
        anchors = torch.where(valid_mask, anchors, torch.inf)

        return anchors, valid_mask


    def _get_decoder_input(self,
                           memory,
                           spatial_shapes,
                           denoising_class=None,
                           denoising_bbox_unact=None):
        bs, _, _ = memory.shape
        # prepare input for decoder
        if self.training or self.eval_spatial_size is None:
            anchors, valid_mask = self._generate_anchors(spatial_shapes, device=memory.device)
        else:
            anchors, valid_mask = self.anchors.to(memory.device), self.valid_mask.to(memory.device)

        # memory = torch.where(valid_mask, memory, 0)
        memory = valid_mask.to(memory.dtype) * memory  # TODO fix type error for onnx export 

        output_memory = self.enc_output(memory)

        enc_outputs_class = self.enc_score_head(output_memory)
        enc_outputs_coord_unact = self.enc_bbox_head(output_memory) + anchors

        _, topk_ind = torch.topk(enc_outputs_class.max(-1).values, self.num_queries, dim=1)
        
        reference_points_unact = enc_outputs_coord_unact.gather(dim=1, \
            index=topk_ind.unsqueeze(-1).repeat(1, 1, enc_outputs_coord_unact.shape[-1]))

        enc_topk_bboxes = F.sigmoid(reference_points_unact)
        if denoising_bbox_unact is not None:
            reference_points_unact = torch.concat(
                [denoising_bbox_unact, reference_points_unact], 1)
        
        enc_topk_logits = enc_outputs_class.gather(dim=1, \
            index=topk_ind.unsqueeze(-1).repeat(1, 1, enc_outputs_class.shape[-1]))

        # extract region features
        if self.learnt_init_query:
            target = self.tgt_embed.weight.unsqueeze(0).tile([bs, 1, 1])
        else:
            target = output_memory.gather(dim=1, \
                index=topk_ind.unsqueeze(-1).repeat(1, 1, output_memory.shape[-1]))
            target = target.detach()

        if denoising_class is not None:
            target = torch.concat([denoising_class, target], 1)

        return target, reference_points_unact.detach(), enc_topk_bboxes, enc_topk_logits

    ########### RADAR ##############
    def forward(self, feats, radar_feats, targets=None):
    # def forward(self, feats, targets=None):

        # input projection and embedding
        (memory, spatial_shapes, level_start_index) = self._get_encoder_input(feats)
        
        # prepare denoising training
        if self.training and self.num_denoising > 0:
            denoising_class, denoising_bbox_unact, attn_mask, dn_meta = \
                get_contrastive_denoising_training_group(targets, \
                    self.num_classes, 
                    self.num_queries, 
                    self.denoising_class_embed, 
                    num_denoising=self.num_denoising, 
                    label_noise_ratio=self.label_noise_ratio, 
                    box_noise_scale=self.box_noise_scale, )
        else:
            denoising_class, denoising_bbox_unact, attn_mask, dn_meta = None, None, None, None

        target, init_ref_points_unact, enc_topk_bboxes, enc_topk_logits = \
            self._get_decoder_input(memory, spatial_shapes, denoising_class, denoising_bbox_unact)

        # decoder
        out_bboxes, out_logits = self.decoder(
            target,
            init_ref_points_unact,
            memory,
            spatial_shapes,
            level_start_index,
            self.dec_bbox_head,
            self.dec_score_head,
            self.query_pos_head,
            radar_feats=radar_feats, # 新增 radar_feats
            attn_mask=attn_mask)

        if self.training and dn_meta is not None:
            dn_out_bboxes, out_bboxes = torch.split(out_bboxes, dn_meta['dn_num_split'], dim=2)
            dn_out_logits, out_logits = torch.split(out_logits, dn_meta['dn_num_split'], dim=2)

        out = {'pred_logits': out_logits[-1], 'pred_boxes': out_bboxes[-1]}

        if self.training and self.aux_loss:
            out['aux_outputs'] = self._set_aux_loss(out_logits[:-1], out_bboxes[:-1])
            out['aux_outputs'].extend(self._set_aux_loss([enc_topk_logits], [enc_topk_bboxes]))
            
            if self.training and dn_meta is not None:
                out['dn_aux_outputs'] = self._set_aux_loss(dn_out_logits, dn_out_bboxes)
                out['dn_meta'] = dn_meta

        return out


    @torch.jit.unused
    def _set_aux_loss(self, outputs_class, outputs_coord):
        # this is a workaround to make torchscript happy, as torchscript
        # doesn't support dictionary with non-homogeneous values, such
        # as a dict having both a Tensor and a list.
        return [{'pred_logits': a, 'pred_boxes': b}
                for a, b in zip(outputs_class, outputs_coord)]







#################################################################
###################### 很多測試的東西 ##############################
#################################################################
# """by lyuwenyu
# """

# import math 
# import copy 
# from collections import OrderedDict

# import torch 
# import torch.nn as nn 
# import torch.nn.functional as F 
# import torch.nn.init as init 
# import numpy as np


# from .denoising import get_contrastive_denoising_training_group
# from .utils import deformable_attention_core_func, get_activation, inverse_sigmoid
# from .utils import bias_init_with_prob


# from src.core import register
# from .pointnet_utils import PointNetEncoder, STN3d, STN2d
# from .pointnet2_utils import PointNetSetAbstractionMsg, PointNetSetAbstraction
# from .SECOND import VoxelFeatureExtractor, get_paddings_indicator


# __all__ = ['RTDETRTransformer']



# class MLP(nn.Module):
#     def __init__(self, input_dim, hidden_dim, output_dim, num_layers, act='relu'):
#         super().__init__()
#         self.num_layers = num_layers
#         h = [hidden_dim] * (num_layers - 1)
#         self.layers = nn.ModuleList(nn.Linear(n, k) for n, k in zip([input_dim] + h, h + [output_dim]))
#         self.act = nn.Identity() if act is None else get_activation(act)

#     def forward(self, x):
#         for i, layer in enumerate(self.layers):
#             x = self.act(layer(x)) if i < self.num_layers - 1 else layer(x)
#         return x



# class MSDeformableAttention(nn.Module):
#     def __init__(self, embed_dim=256, num_heads=8, num_levels=4, num_points=4,):
#         """
#         Multi-Scale Deformable Attention Module
#         """
#         super(MSDeformableAttention, self).__init__()
#         self.embed_dim = embed_dim
#         self.num_heads = num_heads
#         self.num_levels = num_levels
#         self.num_points = num_points
#         self.total_points = num_heads * num_levels * num_points

#         self.head_dim = embed_dim // num_heads
#         assert self.head_dim * num_heads == self.embed_dim, "embed_dim must be divisible by num_heads"

#         self.sampling_offsets = nn.Linear(embed_dim, self.total_points * 2,)
#         self.attention_weights = nn.Linear(embed_dim, self.total_points)
#         self.value_proj = nn.Linear(embed_dim, embed_dim)
#         self.output_proj = nn.Linear(embed_dim, embed_dim)

#         self.ms_deformable_attn_core = deformable_attention_core_func

#         self._reset_parameters()


#     def _reset_parameters(self):
#         # sampling_offsets
#         init.constant_(self.sampling_offsets.weight, 0)
#         thetas = torch.arange(self.num_heads, dtype=torch.float32) * (2.0 * math.pi / self.num_heads)
#         grid_init = torch.stack([thetas.cos(), thetas.sin()], -1)
#         grid_init = grid_init / grid_init.abs().max(-1, keepdim=True).values
#         grid_init = grid_init.reshape(self.num_heads, 1, 1, 2).tile([1, self.num_levels, self.num_points, 1])
#         scaling = torch.arange(1, self.num_points + 1, dtype=torch.float32).reshape(1, 1, -1, 1)
#         grid_init *= scaling
#         self.sampling_offsets.bias.data[...] = grid_init.flatten()

#         # attention_weights
#         init.constant_(self.attention_weights.weight, 0)
#         init.constant_(self.attention_weights.bias, 0)

#         # proj
#         init.xavier_uniform_(self.value_proj.weight)
#         init.constant_(self.value_proj.bias, 0)
#         init.xavier_uniform_(self.output_proj.weight)
#         init.constant_(self.output_proj.bias, 0)


#     def forward(self,
#                 query,
#                 reference_points,
#                 value,
#                 value_spatial_shapes,
#                 value_mask=None):
#         """
#         Args:
#             query (Tensor): [bs, query_length, C]
#             reference_points (Tensor): [bs, query_length, n_levels, 2], range in [0, 1], top-left (0,0),
#                 bottom-right (1, 1), including padding area
#             value (Tensor): [bs, value_length, C]
#             value_spatial_shapes (List): [n_levels, 2], [(H_0, W_0), (H_1, W_1), ..., (H_{L-1}, W_{L-1})]
#             value_level_start_index (List): [n_levels], [0, H_0*W_0, H_0*W_0+H_1*W_1, ...]
#             value_mask (Tensor): [bs, value_length], True for non-padding elements, False for padding elements

#         Returns:
#             output (Tensor): [bs, Length_{query}, C]
#         """
#         bs, Len_q = query.shape[:2]
#         Len_v = value.shape[1]

#         value = self.value_proj(value)
#         if value_mask is not None:
#             value_mask = value_mask.astype(value.dtype).unsqueeze(-1)
#             value *= value_mask
#         value = value.reshape(bs, Len_v, self.num_heads, self.head_dim)

#         sampling_offsets = self.sampling_offsets(query).reshape(
#             bs, Len_q, self.num_heads, self.num_levels, self.num_points, 2)
#         attention_weights = self.attention_weights(query).reshape(
#             bs, Len_q, self.num_heads, self.num_levels * self.num_points)
#         attention_weights = F.softmax(attention_weights, dim=-1).reshape(
#             bs, Len_q, self.num_heads, self.num_levels, self.num_points)

#         if reference_points.shape[-1] == 2:
#             offset_normalizer = torch.tensor(value_spatial_shapes)
#             offset_normalizer = offset_normalizer.flip([1]).reshape(
#                 1, 1, 1, self.num_levels, 1, 2)
#             sampling_locations = reference_points.reshape(
#                 bs, Len_q, 1, self.num_levels, 1, 2
#             ) + sampling_offsets / offset_normalizer
#         elif reference_points.shape[-1] == 4:
#             sampling_locations = (
#                 reference_points[:, :, None, :, None, :2] + sampling_offsets /
#                 self.num_points * reference_points[:, :, None, :, None, 2:] * 0.5)
#         else:
#             raise ValueError(
#                 "Last dim of reference_points must be 2 or 4, but get {} instead.".
#                 format(reference_points.shape[-1]))

#         output = self.ms_deformable_attn_core(value, value_spatial_shapes, sampling_locations, attention_weights)

#         output = self.output_proj(output)

#         return output

# # ----SECOND Point VFE Layer ----
# # class VFELayer(nn.Module):
# #     def __init__(self, in_channels, out_channels, use_norm=True):
# #         super().__init__()
# #         self.units = out_channels // 2
# #         self.linear = nn.Linear(in_channels, self.units, bias=not use_norm)
# #         self.norm = nn.BatchNorm1d(self.units) if use_norm else nn.Identity()

# #     def forward(self, inputs):
# #         # inputs: [B, N, C]
# #         x = self.linear(inputs)                             # → [B, N, units]
# #         x = self.norm(x.transpose(1, 2)).transpose(1, 2)    # BN over feature dim
# #         pointwise = F.relu(x)
# #         maxpool = torch.max(pointwise, dim=1, keepdim=True)[0]   # → [B, 1, units]
# #         repeated = maxpool.expand(-1, pointwise.shape[1], -1)    # → [B, N, units]
# #         return torch.cat([pointwise, repeated], dim=-1)     # → [B, N, 2*units]


# # ----SECOND Voxel VFE Layer ----
# class VFELayer(nn.Module):
#     def __init__(self, in_channels, out_channels, use_norm=True):
#         super(VFELayer, self).__init__()
#         self.units = out_channels // 2
#         self.linear = nn.Linear(in_channels, self.units, bias=not use_norm)
#         self.norm = nn.BatchNorm1d(self.units) if use_norm else nn.Identity()

#     def forward(self, inputs):
#         voxel_count = inputs.shape[1]  # T
#         x = self.linear(inputs)
#         x = self.norm(x.permute(0, 2, 1)).permute(0, 2, 1)
#         pointwise = F.relu(x)

#         aggregated = torch.max(pointwise, dim=1, keepdim=True)[0]
#         repeated = aggregated.repeat(1, voxel_count, 1)

#         concatenated = torch.cat([pointwise, repeated], dim=2)
#         return concatenated  # [K, T, out_channels]

# # ----SECOND Simple Voxel Generator ----
# class SimpleVoxelGenerator:
#     def __init__(self, voxel_size=(0.2, 0.2, 0.4), point_cloud_range=(0, -40, -3, 70.4, 40, 1),
#                  max_num_points=32, max_voxels=20000):
#         self.voxel_size = np.array(voxel_size)
#         self.pc_range = np.array(point_cloud_range)
#         self.max_num_points = max_num_points
#         self.max_voxels = max_voxels

#     def generate(self, points):
#         mask = np.all((points[:, :3] >= self.pc_range[0:3]) &
#                       (points[:, :3] < self.pc_range[3:6]), axis=1)
#         points = points[mask]
#         voxel_coords = ((points[:, :3] - self.pc_range[0:3]) / self.voxel_size).astype(np.int32)

#         voxel_map = {}
#         for i, coord in enumerate(voxel_coords):
#             coord_key = tuple(coord[::-1])  # z,y,x
#             if coord_key not in voxel_map:
#                 voxel_map[coord_key] = []
#             if len(voxel_map[coord_key]) < self.max_num_points:
#                 voxel_map[coord_key].append(points[i])

#         voxels, coords, num_points = [], [], []
#         for k, v in voxel_map.items():
#             voxels.append(v + [[0]*points.shape[1]] * (self.max_num_points - len(v)))
#             coords.append(k)
#             num_points.append(len(v))

#         return (np.array(voxels)[:self.max_voxels],
#                 np.array(coords)[:self.max_voxels],
#                 np.array(num_points)[:self.max_voxels])

# # ----Pillar PFNLayer ----
# class PFNLayer(nn.Module):
#     def __init__(self, out_channels, last_layer=False):
#         super().__init__()
#         self.last_vfe = last_layer
#         self.out_channels = out_channels
#         if not self.last_vfe:
#             self.out_channels = out_channels // 2

#         self.linear = None
#         self.norm = None

#     def _init_layers(self, in_channels, device):
#         """動態建立 Linear & Norm"""
#         if self.linear is None:
#             # print(f"[INIT] PFNLayer in_channels = {in_channels}")
#             self.linear = nn.Linear(in_channels, self.out_channels, bias=False).to(device)
#             self.norm = nn.BatchNorm1d(self.out_channels).to(device)

#     def forward(self, inputs):
#         device = inputs.device
#         self._init_layers(inputs.shape[-1], device)

#         x = self.linear(inputs)
#         x = self.norm(x.permute(0, 2, 1).contiguous()).permute(0, 2, 1)
#         x = F.relu(x)

#         x_max = torch.max(x, dim=1, keepdim=True)[0]
#         if self.last_vfe:
#             return x_max
#         else:
#             x_repeat = x_max.repeat(1, inputs.shape[1], 1)
#             return torch.cat([x, x_repeat], dim=2)

# # =============================
# # 雷達特徵嵌入層 (RadarFeatureEmbedding)
# # 將 (x, y, z, vx, vy) 投影為 d_model 維度的嵌入向量
# # =============================
# class RadarFeatureEmbedding(nn.Module):
#     # =============================
#     # Linear + LayerNorm
#     # =============================
#     # def __init__(self, input_dim=5, embed_dim=256): 
#     #     super(RadarFeatureEmbedding, self).__init__()
#     #     self.fc = nn.Linear(input_dim, embed_dim)
#     #     self.norm = nn.LayerNorm(embed_dim)

#     # def forward(self, radar_feats):
#     #     # radar_feats: [batch_size, num_radar_points, 5]
#     #     embedded = self.fc(radar_feats)
#     #     embedded = self.norm(embedded)
#     #     return embedded

#     # =============================
#     # pointnet(x,y,vx,vy)
#     # =============================
#     # def __init__(self, input_dim=5, embed_dim=256):
#     #     super().__init__()
#     #     self.conv1 = nn.Conv1d(input_dim, 64, 1)
#     #     self.conv2 = nn.Conv1d(64, 128, 1)
#     #     self.conv3 = nn.Conv1d(128, embed_dim, 1)
#     #     self.bn1 = nn.BatchNorm1d(64)
#     #     self.bn2 = nn.BatchNorm1d(128)
#     #     self.bn3 = nn.BatchNorm1d(embed_dim)

#     # def forward(self, x):
#     #     # x: [B, N, C]
#     #     x = x.transpose(1, 2)  # → [B, C, N]
#     #     x = F.relu(self.bn1(self.conv1(x)))  # → [B, 64, N]
#     #     x = F.relu(self.bn2(self.conv2(x)))  # → [B, 128, N]
#     #     x = F.relu(self.bn3(self.conv3(x)))  # → [B, embed_dim, N]

#     #     # global feature: max pooling over all radar points
#     #     embedded = x.transpose(1, 2)  # → [B, N, embed_dim]
#     #     return embedded  # 若你要接 Decoder，這裡可以擴展成 [B, 1, embed_dim] 再 broadcast


#     # =============================
#     # pointnet_org
#     # pointnet(x, y, vx, vy) + Linear + LayerNorm
#     # =============================
#     # def __init__(self, input_dim=4, embed_dim=256):
#     #     super().__init__()
#     #     self.conv1 = nn.Conv1d(input_dim, 64, 1)
#     #     self.conv2 = nn.Conv1d(64, 128, 1)
#     #     self.conv3 = nn.Conv1d(128, 1024, 1)
#     #     self.bn1 = nn.BatchNorm1d(64)
#     #     self.bn2 = nn.BatchNorm1d(128)
#     #     self.bn3 = nn.BatchNorm1d(1024)
#     #     self.projector = nn.Linear(1024, embed_dim)  # 新增 projector
#     #     self.norm = nn.LayerNorm(embed_dim)          # 新增 LayerNorm

#     # def forward(self, x):
#     #     # x: [B, N, 4] (x, y, vx, vy)
#     #     x = x.transpose(1, 2)  # → [B, 4, N]
        
#     #     x = F.relu(self.bn1(self.conv1(x)))  # → [B, 64, N]
#     #     x = F.relu(self.bn2(self.conv2(x)))  # → [B, 128, N]
#     #     x = F.relu(self.bn3(self.conv3(x)))  # → [B, 1024, N]

#     #     x = x.transpose(1, 2)                # → [B, N, 1024]
#     #     x = self.projector(x)               # → [B, N, embed_dim]
#     #     x = self.norm(x)                    # → [B, N, embed_dim]
#     #     return x

#     # =============================
#     # pointnet+dummy_z(https://github.com/yanx27/Pointnet_Pointnet2_pytorch/blob/master/models/pointnet_utils.py)
#     # =============================
#     # def __init__(self, input_dim=5, embed_dim=256):
#     #     super().__init__()
#     #     self.stn = STN3d(3)
#     #     self.conv1 = nn.Conv1d(input_dim, 64, 1)
#     #     self.conv2 = nn.Conv1d(64, 128, 1)
#     #     self.conv3 = nn.Conv1d(128, 1024, 1)
#     #     self.bn1 = nn.BatchNorm1d(64)
#     #     self.bn2 = nn.BatchNorm1d(128)
#     #     self.bn3 = nn.BatchNorm1d(1024)
#     #     self.projector = nn.Linear(1024, embed_dim)  # ← 這裡轉成你要的維度
#     #     self.norm = nn.LayerNorm(embed_dim)

#     # def forward(self, x):
#     #     # x: [B, N, C=4]
#     #     x = x.transpose(1, 2)  # [B, C, N]
#     #     B, C, N = x.shape

#     #     dummy_z = torch.zeros(B, 1, N, device=x.device)
#     #     # dummy_z = torch.ones(B, 1, N, device=x.device)
#     #     xyz = torch.cat([x[:, :2, :], dummy_z], dim=1)
#     #     extra = x[:, 2:, :]

#     #     trans = self.stn(xyz)
#     #     xyz_trans = torch.bmm(trans, xyz)
#     #     x = torch.cat([xyz_trans[:, :2, :], extra], dim=1)

#     #     x = F.relu(self.bn1(self.conv1(x)))       # [B, 64, N]
#     #     x = F.relu(self.bn2(self.conv2(x)))       # [B, 128, N]
#     #     x = F.relu(self.bn3(self.conv3(x)))       # [B, 1024, N]

#     #     x = x.transpose(1, 2)                     # [B, N, 1024]
#     #     x = self.projector(x)                     # [B, N, embed_dim]
#     #     x = self.norm(x)                          # [B, N, embed_dim]
#     #     return x


#     # =============================
#     # pointnet+STN2d(https://github.com/yanx27/Pointnet_Pointnet2_pytorch/blob/master/models/pointnet_utils.py)
#     # =============================
#     def __init__(self, input_dim=4, embed_dim=256):
#         super().__init__()
#         self.stn = STN2d(2)  # 只對 x, y 做 2x2 變換
#         self.conv1 = nn.Conv1d(input_dim, 64, 1)
#         self.conv2 = nn.Conv1d(64, 128, 1)
#         self.conv3 = nn.Conv1d(128, 1024, 1)
#         self.bn1 = nn.BatchNorm1d(64)
#         self.bn2 = nn.BatchNorm1d(128)
#         self.bn3 = nn.BatchNorm1d(1024)
#         self.projector = nn.Linear(1024, embed_dim)
#         self.norm = nn.LayerNorm(embed_dim)

#     def forward(self, x):
#         # x: [B, N, 4] (x, y, vx, vy)
#         x = x.transpose(1, 2)  # → [B, 4, N]
#         B, C, N = x.shape

#         # === 1. 拿出 (x, y) 給 STN2d 做變換 ===
#         xy = x[:, :2, :]                           # → [B, 2, N]
#         extra = x[:, 2:, :]                        # → [B, 2, N]

#         trans = self.stn(xy)                       # → [B, 2, 2]
#         xy_trans = torch.bmm(trans, xy)            # → [B, 2, N]

#         # === 2. 拼回完整特徵 ===
#         x = torch.cat([xy_trans, extra], dim=1)    # → [B, 4, N]

#         # === 3. 通過 Conv 路徑 ===
#         x = F.relu(self.bn1(self.conv1(x)))        # → [B, 64, N]
#         x = F.relu(self.bn2(self.conv2(x)))        # → [B, 128, N]
#         x = F.relu(self.bn3(self.conv3(x)))        # → [B, 1024, N]

#         x = x.transpose(1, 2)                      # → [B, N, 1024]
#         x = self.projector(x)                      # → [B, N, embed_dim]
#         x = self.norm(x)
#         return x


#     # =============================
#     # pointnet+xyz(https://github.com/yanx27/Pointnet_Pointnet2_pytorch/blob/master/models/pointnet_utils.py)
#     # =============================
#     # def __init__(self, input_dim=5, embed_dim=256):
#     #     super().__init__()
#     #     self.stn = STN3d(3)
#     #     self.conv1 = nn.Conv1d(input_dim, 64, 1)
#     #     self.conv2 = nn.Conv1d(64, 128, 1)
#     #     self.conv3 = nn.Conv1d(128, 1024, 1)
#     #     self.bn1 = nn.BatchNorm1d(64)
#     #     self.bn2 = nn.BatchNorm1d(128)
#     #     self.bn3 = nn.BatchNorm1d(1024)
#     #     self.projector = nn.Linear(1024, embed_dim)  # ← 這裡轉成你要的維度
#     #     self.norm = nn.LayerNorm(embed_dim)

#     # def forward(self, x):
#     #     # x: [B, N, C=5] => (x, y, z, vx, vy)
#     #     x = x.transpose(1, 2)  # → [B, C=5, N]
#     #     B, C, N = x.shape

#     #     # === 拆出座標與其他欄位 ===
#     #     xyz = x[:, :3, :]        # [B, 3, N] → for STN3d
#     #     extra = x[:, 3:, :]      # [B, 2, N] → vx, vy

#     #     # === STN3d 對 xyz 做空間對齊 ===
#     #     trans = self.stn(xyz)               # → [B, 3, 3]
#     #     xyz_trans = torch.bmm(trans, xyz)   # → [B, 3, N]

#     #     # === 拼回 vx, vy 組成輸入 ===
#     #     x = torch.cat([xyz_trans, extra], dim=1)  # → [B, 5, N]

#     #     # === 通過 PointNet 主幹 ===
#     #     x = F.relu(self.bn1(self.conv1(x)))       # [B, 64, N]
#     #     x = F.relu(self.bn2(self.conv2(x)))       # [B, 128, N]
#     #     x = F.relu(self.bn3(self.conv3(x)))       # [B, 1024, N]

#     #     x = x.transpose(1, 2)                     # [B, N, 1024]
#     #     x = self.projector(x)                     # [B, N, embed_dim]
#     #     x = self.norm(x)                          # [B, N, embed_dim]
#     #     return x

#     # =============================
#     # (Conv1d+BN+ReLU)*3
#     # =============================
#     # def __init__(self, input_dim=4, embed_dim=256):
#     #     super().__init__()
#     #     # Point-wise encoding (e.g., simplified PointNet)
#     #     self.feat_extractor = nn.Sequential(
#     #         nn.Conv1d(input_dim, 64, kernel_size=1),
#     #         nn.BatchNorm1d(64),
#     #         nn.ReLU(),
#     #         nn.Conv1d(64, 128, kernel_size=1),
#     #         nn.BatchNorm1d(128),
#     #         nn.ReLU(),
#     #         nn.Conv1d(128, embed_dim, kernel_size=1),
#     #         nn.BatchNorm1d(embed_dim),
#     #         nn.ReLU()
#     #     )

#     # def forward(self, x):
#     #     """
#     #     Args:
#     #         x: [B, N, 4]  # radar points: x, y, vx, vy
#     #     Returns:
#     #         embedded: [B, N, embed_dim]
#     #     """
#     #     x = x.transpose(1, 2)  # [B, 4, N]
#     #     x = self.feat_extractor(x)  # [B, embed_dim, N]
#     #     x = x.transpose(1, 2)       # [B, N, embed_dim]
#     #     return x


#     # =============================
#     # SECOND + Point VFE Layer
#     # =============================
#     # def __init__(self, input_dim=4, embed_dim=256, use_norm=True, with_distance=True):
#     #     super().__init__()
#     #     self.with_distance = with_distance

#     #     base_dim = input_dim
#     #     if with_distance:
#     #         base_dim += 1
#     #     base_dim += 3  # add relative x, y, z

#     #     self.vfe1 = VFELayer(base_dim, 32, use_norm)
#     #     self.vfe2 = VFELayer(32, 128, use_norm)

#     #     self.linear = nn.Linear(128, embed_dim)
#     #     self.norm = nn.LayerNorm(embed_dim)

#     # def forward(self, x):
#     #     # x: [B, N, 4 or 5] → (e.g., x, y, vx, vy) or (x, y, z, vx, vy)
#     #     B, N, C = x.shape
#     #     pos = x[:, :, :3] if C >= 3 else F.pad(x[:, :, :2], (0,1))  # → [B, N, 3]
#     #     feat = x                                                   # → [B, N, C]

#     #     mean = pos.mean(dim=1, keepdim=True)                       # → [B, 1, 3]
#     #     relative = pos - mean                                      # → [B, N, 3]

#     #     if self.with_distance:
#     #         dist = torch.norm(pos, dim=2, keepdim=True)            # → [B, N, 1]
#     #         feat = torch.cat([feat, relative, dist], dim=-1)
#     #     else:
#     #         feat = torch.cat([feat, relative], dim=-1)             # → [B, N, C+3]

#     #     x = self.vfe1(feat)   # → [B, N, 32]
#     #     x = self.vfe2(x)      # → [B, N, 128]
#     #     x = F.relu(self.linear(x))  # → [B, N, embed_dim]
#     #     x = self.norm(x)
#     #     return x


#     # =============================
#     # Pointnet++
#     # =============================
#     # def __init__(self, input_dim=5, embed_dim=256):
#     #     super(RadarFeatureEmbedding, self).__init__()
#     #     self.sa1 = PointNetSetAbstractionMsg(
#     #         npoint=32,
#     #         radius_list=[0.1, 0.2, 0.4],
#     #         nsample_list=[8, 16, 32],
#     #         in_channel=input_dim - 2,
#     #         mlp_list=[
#     #             [32, 32, 64],
#     #             [64, 64, 128],
#     #             [64, 96, 128]
#     #         ]
#     #     )
#     #     self.fc1 = nn.Conv1d(64 + 128 + 128, 256, kernel_size=1)
#     #     self.bn1 = nn.BatchNorm1d(256)
#     #     self.drop1 = nn.Dropout(0.3)

#     # def forward(self, x):
#     #     B, N, C = x.shape

#     #     if C == 4:
#     #         #print("C==4")
#     #         xyz = F.pad(x[:, :, :2], (0, 1)).permute(0, 2, 1)
#     #         points = x[:, :, 2:].permute(0, 2, 1)
#     #     else:
#     #         print("C!=4,C==",C)
#     #         xyz = x[:, :, :3].permute(0, 2, 1)
#     #         points = x[:, :, 3:].permute(0, 2, 1)

#     #     l1_xyz, l1_points = self.sa1(xyz, points)

#     #     # 直接轉換每個 point 的 feature
#     #     x = self.drop1(F.relu(self.bn1(self.fc1(l1_points))))  # [B, 256, 32]
#     #     x = x.transpose(1, 2).contiguous()  # [B, 32, 256]
#     #     return x


#     # =============================
#     # SECOND + Voxel VFE Layer
#     # =============================
#     # def __init__(self, input_dim=5, embed_dim=256, use_norm=True, with_distance=True):
#     #     super().__init__()
#     #     self.with_distance = with_distance
#     #     self.voxel_gen = SimpleVoxelGenerator()
#     #     self.embed_dim = embed_dim
#     #     self.input_dim = input_dim
#     #     self.use_norm = use_norm

#     #     # 先暫時用 1 初始化，等 forward 時重新定義
#     #     self.vfe1 = None  
#     #     self.vfe2 = VFELayer(32, 128, use_norm)
#     #     self.linear = nn.Linear(128, embed_dim)
#     #     # self.norm = nn.LayerNorm(embed_dim)
#     #     self.norm = nn.BatchNorm1d(embed_dim)

#     # def _init_vfe1(self, feat_dim):
#     #     """動態初始化 vfe1，一次性建構"""
#     #     if self.vfe1 is None:
#     #         print(f"[INIT] VFELayer in_channels = {feat_dim}")
#     #         self.vfe1 = VFELayer(feat_dim, 32, self.use_norm).to(self.linear.weight.device)

#     # def forward(self, x):
#     #     B, N, C = x.shape
#     #     outputs = []

#     #     for b in range(B):
#     #         pts = x[b].detach().cpu().numpy()
#     #         voxels, coords, num_points = self.voxel_gen.generate(pts)

#     #         voxels_t = torch.tensor(voxels, dtype=torch.float32, device=x.device)
#     #         num_points_t = torch.tensor(num_points, dtype=torch.float32, device=x.device).view(-1, 1, 1)
#     #         pos_dim = 3 if C >= 3 else 2
#     #         voxel_mean = voxels_t[:, :, :pos_dim].sum(dim=1, keepdim=True) / num_points_t
#     #         relative = voxels_t[:, :, :pos_dim] - voxel_mean

#     #         if self.with_distance:
#     #             dist = torch.norm(voxels_t[:, :, :pos_dim], dim=2, keepdim=True)
#     #             feat = torch.cat([voxels_t, relative, dist], dim=-1)
#     #         else:
#     #             feat = torch.cat([voxels_t, relative], dim=-1)

#     #         # ==== 動態初始化 VFELayer ====
#     #         self._init_vfe1(feat.shape[-1])

#     #         x1 = self.vfe1(feat)
#     #         x2 = self.vfe2(x1)
#     #         voxelwise = torch.max(x2, dim=1)[0]

#     #         embed = F.relu(self.linear(voxelwise))
#     #         embed = self.norm(embed)

#     #         if embed.shape[0] < N:
#     #             pad = torch.zeros((N - embed.shape[0], self.embed_dim), device=x.device)
#     #             embed = torch.cat([embed, pad], dim=0)

#     #         outputs.append(embed[:N])

#     #     return torch.stack(outputs, dim=0)



#     # =============================
#     # SECOND + Voxel VFE Layer + get_paddings_indicator
#     # =============================
#     # def __init__(self, input_dim=5, embed_dim=256, use_norm=True, with_distance=True):
#     #     super().__init__()
#     #     self.with_distance = with_distance
#     #     self.voxel_gen = SimpleVoxelGenerator()
#     #     self.embed_dim = embed_dim
#     #     self.input_dim = input_dim
#     #     self.use_norm = use_norm

#     #     # 先暫時用 1 初始化，等 forward 時重新定義
#     #     self.vfe1 = None  
#     #     self.vfe2 = VFELayer(32, 128, use_norm)
#     #     self.linear = nn.Linear(128, embed_dim)
#     #     # self.norm = nn.LayerNorm(embed_dim)
#     #     self.norm = nn.BatchNorm1d(embed_dim)

#     # def _init_vfe1(self, feat_dim):
#     #     """動態初始化 vfe1，一次性建構"""
#     #     if self.vfe1 is None:
#     #         print(f"[INIT] VFELayer in_channels = {feat_dim}")
#     #         self.vfe1 = VFELayer(feat_dim, 32, self.use_norm).to(self.linear.weight.device)

#     # def forward(self, x):
#     #     B, N, C = x.shape
#     #     outputs = []

#     #     for b in range(B):
#     #         pts = x[b].detach().cpu().numpy()
#     #         voxels, coords, num_points = self.voxel_gen.generate(pts)

#     #         voxels_t = torch.tensor(voxels, dtype=torch.float32, device=x.device)
#     #         num_points_t = torch.tensor(num_points, dtype=torch.float32, device=x.device)

#     #         pos_dim = 3 if C >= 3 else 2
#     #         voxel_mean = voxels_t[:, :, :pos_dim].sum(dim=1, keepdim=True) / num_points_t.view(-1, 1, 1)
#     #         relative = voxels_t[:, :, :pos_dim] - voxel_mean

#     #         if self.with_distance:
#     #             dist = torch.norm(voxels_t[:, :, :pos_dim], dim=2, keepdim=True)
#     #             feat = torch.cat([voxels_t, relative, dist], dim=-1)
#     #         else:
#     #             feat = torch.cat([voxels_t, relative], dim=-1)

#     #         # ==== 動態初始化 VFELayer ====
#     #         self._init_vfe1(feat.shape[-1])
#     #         # === 加入 mask（與 SECOND 一致）===
#     #         voxel_count = feat.shape[1]
#     #         mask = get_paddings_indicator(num_points_t, voxel_count, axis=0).unsqueeze(-1).type_as(feat)

#     #         x1 = self.vfe1(feat) * mask
#     #         x2 = self.vfe2(x1) * mask
#     #         voxelwise = torch.max(x2, dim=1)[0]

#     #         embed = F.relu(self.linear(voxelwise))
#     #         embed = self.norm(embed)

#     #         if embed.shape[0] < N:
#     #             pad = torch.zeros((N - embed.shape[0], self.embed_dim), device=x.device)
#     #             embed = torch.cat([embed, pad], dim=0)

#     #         outputs.append(embed[:N])

#     #     return torch.stack(outputs, dim=0)



#     # =============================
#     # Pillar
#     # =============================
#     # def __init__(self, input_dim=5, embed_dim=256, num_filters=(64,), with_distance=True):
#     #     """
#     #     PillarNet 風格的雷達特徵提取 (支援多層 PFNLayer)
#     #     Args:
#     #         input_dim: 輸入特徵維度 (x, y, z, vx, vy)
#     #         embed_dim: 輸出特徵維度
#     #         num_filters: 每層 PFNLayer 的輸出維度，例如 (64,) 或 (64, 128)
#     #         with_distance: 是否加入點距離特徵
#     #     """
#     #     super().__init__()
#     #     self._with_distance = with_distance
#     #     self.embed_dim = embed_dim
#     #     self.input_dim = input_dim

#     #     # 原始點 + cluster(3) + center(2)
#     #     num_input_features = input_dim + 5
#     #     if with_distance:
#     #         num_input_features += 1

#     #     # === 動態建立多層 PFNLayer ===
#     #     layer_dims = [num_input_features] + list(num_filters) + [embed_dim]
#     #     self.pfn_layers = nn.ModuleList([
#     #         PFNLayer(out_channels=layer_dims[i + 1], last_layer=(i == len(layer_dims) - 2))
#     #         for i in range(len(layer_dims) - 1)
#     #     ])

#     #     # voxel/pillar 尺寸 & 偏移
#     #     self.vx, self.vy = 0.2, 0.2
#     #     self.x_offset = self.vx / 2 + 0.0
#     #     self.y_offset = self.vy / 2 - 40.0

#     #     # voxel 生成器
#     #     self.voxel_gen = SimpleVoxelGenerator()

#     # def forward(self, x):
#     #     """
#     #     Args:
#     #         x: [B, N, C] 雷達點雲
#     #     Returns:
#     #         pillar_embeds: [B, N, embed_dim]
#     #     """
#     #     B, N, _ = x.shape
#     #     outputs = []

#     #     for b in range(B):
#     #         # === 點雲 → voxel ===
#     #         pts = x[b].detach().cpu().numpy()
#     #         voxels, coords, num_points = self.voxel_gen.generate(pts)

#     #         voxels_t = torch.tensor(voxels, dtype=torch.float32, device=x.device)
#     #         num_voxels_t = torch.tensor(num_points, dtype=torch.float32, device=x.device)
#     #         coords_t = torch.tensor(coords, dtype=torch.int32, device=x.device)
#     #         dtype = voxels_t.dtype

#     #         # === cluster feature ===
#     #         points_mean = voxels_t[:, :, :3].sum(dim=1, keepdim=True) / num_voxels_t.view(-1, 1, 1)
#     #         f_cluster = voxels_t[:, :, :3] - points_mean

#     #         # === center feature ===
#     #         f_center = torch.zeros_like(voxels_t[:, :, :2])
#     #         if coords_t.shape[1] == 4:  # [batch, z, y, x]
#     #             x_idx = coords_t[:, 3]
#     #             y_idx = coords_t[:, 2]
#     #         else:  # [y, x, batch] 或其他 3 維結構
#     #             x_idx = coords_t[:, 1]
#     #             y_idx = coords_t[:, 0]

#     #         f_center[:, :, 0] = voxels_t[:, :, 0] - (
#     #             x_idx.to(dtype).unsqueeze(1) * self.vx + self.x_offset
#     #         )
#     #         f_center[:, :, 1] = voxels_t[:, :, 1] - (
#     #             y_idx.to(dtype).unsqueeze(1) * self.vy + self.y_offset
#     #         )

#     #         # === combine features ===
#     #         features_ls = [voxels_t, f_cluster, f_center]
#     #         if self._with_distance:
#     #             points_dist = torch.norm(voxels_t[:, :, :3], 2, 2, keepdim=True)
#     #             features_ls.append(points_dist)
#     #         features = torch.cat(features_ls, dim=-1)

#     #         # === mask empty pillars ===
#     #         voxel_count = features.shape[1]
#     #         mask = get_paddings_indicator(num_voxels_t, voxel_count, axis=0)
#     #         mask = torch.unsqueeze(mask, -1).type_as(features)
#     #         features *= mask

#     #         # === PFN Layers 聚合 ===
#     #         for pfn in self.pfn_layers:
#     #             features = pfn(features)

#     #         pillar_feat = features.squeeze()

#     #         # === 保證輸出維度對齊 ===
#     #         if pillar_feat.shape[0] < N:
#     #             pad = torch.zeros((N - pillar_feat.shape[0], self.embed_dim), device=x.device)
#     #             pillar_feat = torch.cat([pillar_feat, pad], dim=0)

#     #         outputs.append(pillar_feat[:N])

#     #     return torch.stack(outputs, dim=0)


# # =============================
# # 雷達數據的跨注意力機制 (RadarCrossAttention)
# # =============================
# class RadarCrossAttention(nn.Module):
#     def __init__(self, embed_dim=256, num_heads=8, num_points=4):
#         super(RadarCrossAttention, self).__init__()
#         self.embed_dim = embed_dim
#         self.num_heads = num_heads
#         self.num_points = num_points

#         self.head_dim = embed_dim // num_heads
#         assert self.head_dim * num_heads == self.embed_dim, "embed_dim must be divisible by num_heads"

#         self.sampling_offsets = nn.Linear(embed_dim, num_heads * num_points * 2)
#         self.attention_weights = nn.Linear(embed_dim, num_heads * num_points)
#         self.value_proj = nn.Linear(embed_dim, embed_dim)
#         self.output_proj = nn.Linear(embed_dim, embed_dim)

#         self._reset_parameters()

#     def _reset_parameters(self):
#         init.constant_(self.sampling_offsets.weight, 0)
#         init.constant_(self.sampling_offsets.bias, 0)
#         init.constant_(self.attention_weights.weight, 0)
#         init.constant_(self.attention_weights.bias, 0)
#         init.xavier_uniform_(self.value_proj.weight)
#         init.constant_(self.value_proj.bias, 0)
#         init.xavier_uniform_(self.output_proj.weight)
#         init.constant_(self.output_proj.bias, 0)

#     def forward(self, query, radar_feats):
#         # query: [batch_size, query_length, embed_dim]
#         # radar_feats: [batch_size, num_radar_points, embed_dim]
#         bs, Len_q, _ = query.shape
#         Len_v = radar_feats.shape[1]
#         value = self.value_proj(radar_feats).reshape(bs, Len_v, self.num_heads, self.head_dim)
#         sampling_offsets = self.sampling_offsets(query).reshape(bs, Len_q, self.num_heads, self.num_points, 2)
#         attention_weights = self.attention_weights(query).reshape(bs, Len_q, self.num_heads, self.num_points)
#         attention_weights = F.softmax(attention_weights, dim=-1)

#         # output = torch.einsum("bqhp,bvhp->bqhp", attention_weights, value)
#         # query: [B, Q, C], value: [B, V, C] → 先轉成 [B, Q, H, D] and [B, V, H, D]
#         Q = query.shape[1]
#         query = query.view(bs, Q, self.num_heads, self.head_dim)
#         value = value  # already in [B, V, H, D]
#         scores = torch.einsum('bqhd,bvhd->bqhv', query, value)
#         weights = F.softmax(scores, dim=-1)
#         output = torch.einsum('bqhv,bvhd->bqhd', weights, value)

        
#         output = output.reshape(bs, Q, -1)
#         output = self.output_proj(output)

#         return output
    



# class TransformerDecoderLayer(nn.Module):
#     def __init__(self,
#                  d_model=256,
#                  n_head=8,
#                  dim_feedforward=1024,
#                  dropout=0.,
#                  activation="relu",
#                  n_levels=4,
#                  n_points=4,):
#         super(TransformerDecoderLayer, self).__init__()

#         # self attention
#         self.self_attn = nn.MultiheadAttention(d_model, n_head, dropout=dropout, batch_first=True)
#         self.dropout1 = nn.Dropout(dropout)
#         self.norm1 = nn.LayerNorm(d_model)

#         # cross attention
#         self.cross_attn = MSDeformableAttention(d_model, n_head, n_levels, n_points)

#         # 雷達數據的跨注意力機制
#         in_dim=4
#         self.radar_feature_embed = RadarFeatureEmbedding(input_dim=in_dim, embed_dim=d_model) # 不傳入高度資訊
#         print("in_dim: ",in_dim)
#         self.radar_cross_attn = RadarCrossAttention(d_model, n_head)

#         self.dropout2 = nn.Dropout(dropout)
#         self.norm2 = nn.LayerNorm(d_model)

#         # ffn
#         self.linear1 = nn.Linear(d_model, dim_feedforward)
#         self.activation = getattr(F, activation)
#         self.dropout3 = nn.Dropout(dropout)
#         self.linear2 = nn.Linear(dim_feedforward, d_model)
#         self.dropout4 = nn.Dropout(dropout)
#         self.norm3 = nn.LayerNorm(d_model)

#         # self._reset_parameters()

#     # def _reset_parameters(self):
#     #     linear_init_(self.linear1)
#     #     linear_init_(self.linear2)
#     #     xavier_uniform_(self.linear1.weight)
#     #     xavier_uniform_(self.linear2.weight)

#     def with_pos_embed(self, tensor, pos):
#         return tensor if pos is None else tensor + pos

#     def forward_ffn(self, tgt):
#         return self.linear2(self.dropout3(self.activation(self.linear1(tgt))))

#     # 加入 radar_feats
#     def forward(self,
#                 tgt,
#                 reference_points,
#                 memory,
#                 memory_spatial_shapes,
#                 memory_level_start_index,
#                 radar_feats,
#                 attn_mask=None,
#                 memory_mask=None,
#                 query_pos_embed=None
#                 ):
#         # self attention
#         q = k = self.with_pos_embed(tgt, query_pos_embed)

#         # if attn_mask is not None:
#         #     attn_mask = torch.where(
#         #         attn_mask.to(torch.bool),
#         #         torch.zeros_like(attn_mask),
#         #         torch.full_like(attn_mask, float('-inf'), dtype=tgt.dtype))

#         tgt2, _ = self.self_attn(q, k, value=tgt, attn_mask=attn_mask)
#         # print(attn_mask.shape)
#         # print(attn_mask)
#         # print("@@@@@@@@@@@@@@@@@@")
#         # print(memory_mask.shape)
#         tgt = tgt + self.dropout1(tgt2)
#         tgt = self.norm1(tgt)

#         # cross attention
#         tgt2 = self.cross_attn(\
#             self.with_pos_embed(tgt, query_pos_embed), 
#             reference_points, 
#             memory, 
#             memory_spatial_shapes, 
#             memory_mask)
        
#         # 雷達數據嵌入
#         radar_embedded = self.radar_feature_embed(radar_feats)
#         # 雷達數據的跨注意力機制
#         radar_attn = self.radar_cross_attn(tgt, radar_embedded)
#         # 將兩者進行融合（相加）
#         tgt2 = tgt2 + radar_attn


#         tgt = tgt + self.dropout2(tgt2)
#         tgt = self.norm2(tgt)

#         # ffn
#         tgt2 = self.forward_ffn(tgt)
#         tgt = tgt + self.dropout4(tgt2)
#         tgt = self.norm3(tgt)

#         return tgt


# class TransformerDecoder(nn.Module):
#     def __init__(self, hidden_dim, decoder_layer, num_layers, eval_idx=-1):
#         super(TransformerDecoder, self).__init__()
#         self.layers = nn.ModuleList([copy.deepcopy(decoder_layer) for _ in range(num_layers)])
#         self.hidden_dim = hidden_dim
#         self.num_layers = num_layers
#         self.eval_idx = eval_idx if eval_idx >= 0 else num_layers + eval_idx

#     def forward(self,
#                 tgt,
#                 ref_points_unact,
#                 memory,
#                 memory_spatial_shapes,
#                 memory_level_start_index,
#                 bbox_head,
#                 score_head,
#                 query_pos_head,
#                 radar_feats, # 新增radar_feats參數
#                 attn_mask=None,
#                 memory_mask=None):
#         output = tgt
#         dec_out_bboxes = []
#         dec_out_logits = []
#         ref_points_detach = F.sigmoid(ref_points_unact)

#         for i, layer in enumerate(self.layers):
#             ref_points_input = ref_points_detach.unsqueeze(2)
#             query_pos_embed = query_pos_head(ref_points_detach)

#             output = layer(output, ref_points_input, memory,
#                            memory_spatial_shapes, memory_level_start_index,
#                            radar_feats, # 傳入radar_feats
#                            attn_mask, memory_mask, query_pos_embed)

#             inter_ref_bbox = F.sigmoid(bbox_head[i](output) + inverse_sigmoid(ref_points_detach))

#             if self.training:
#                 dec_out_logits.append(score_head[i](output))
#                 if i == 0:
#                     dec_out_bboxes.append(inter_ref_bbox)
#                 else:
#                     dec_out_bboxes.append(F.sigmoid(bbox_head[i](output) + inverse_sigmoid(ref_points)))

#             elif i == self.eval_idx:
#                 dec_out_logits.append(score_head[i](output))
#                 dec_out_bboxes.append(inter_ref_bbox)
#                 break

#             ref_points = inter_ref_bbox
#             ref_points_detach = inter_ref_bbox.detach(
#             ) if self.training else inter_ref_bbox

#         return torch.stack(dec_out_bboxes), torch.stack(dec_out_logits)


# @register
# class RTDETRTransformer(nn.Module):
#     __share__ = ['num_classes']
#     def __init__(self,
#                  num_classes=80,
#                  hidden_dim=256,
#                  num_queries=300,
#                  position_embed_type='sine',
#                  feat_channels=[512, 1024, 2048],
#                  feat_strides=[8, 16, 32],
#                  num_levels=3,
#                  num_decoder_points=4,
#                  nhead=8,
#                  num_decoder_layers=6,
#                  dim_feedforward=1024,
#                  dropout=0.,
#                  activation="relu",
#                  num_denoising=100,
#                  label_noise_ratio=0.5,
#                  box_noise_scale=1.0,
#                  learnt_init_query=False,
#                  eval_spatial_size=None,
#                  eval_idx=-1,
#                  eps=1e-2, 
#                  aux_loss=True):

#         super(RTDETRTransformer, self).__init__()
#         assert position_embed_type in ['sine', 'learned'], \
#             f'ValueError: position_embed_type not supported {position_embed_type}!'
#         assert len(feat_channels) <= num_levels
#         assert len(feat_strides) == len(feat_channels)
#         for _ in range(num_levels - len(feat_strides)):
#             feat_strides.append(feat_strides[-1] * 2)

#         self.hidden_dim = hidden_dim
#         self.nhead = nhead
#         self.feat_strides = feat_strides
#         self.num_levels = num_levels
#         self.num_classes = num_classes
#         self.num_queries = num_queries
#         self.eps = eps
#         self.num_decoder_layers = num_decoder_layers
#         self.eval_spatial_size = eval_spatial_size
#         self.aux_loss = aux_loss

#         # backbone feature projection
#         self._build_input_proj_layer(feat_channels)

#         # Transformer module
#         decoder_layer = TransformerDecoderLayer(hidden_dim, nhead, dim_feedforward, dropout, activation, num_levels, num_decoder_points)
#         self.decoder = TransformerDecoder(hidden_dim, decoder_layer, num_decoder_layers, eval_idx)

#         self.num_denoising = num_denoising
#         self.label_noise_ratio = label_noise_ratio
#         self.box_noise_scale = box_noise_scale
#         # denoising part
#         if num_denoising > 0: 
#             # self.denoising_class_embed = nn.Embedding(num_classes, hidden_dim, padding_idx=num_classes-1) # TODO for load paddle weights
#             self.denoising_class_embed = nn.Embedding(num_classes+1, hidden_dim, padding_idx=num_classes)

#         # decoder embedding
#         self.learnt_init_query = learnt_init_query
#         if learnt_init_query:
#             self.tgt_embed = nn.Embedding(num_queries, hidden_dim)
#         self.query_pos_head = MLP(4, 2 * hidden_dim, hidden_dim, num_layers=2)

#         # encoder head
#         self.enc_output = nn.Sequential(
#             nn.Linear(hidden_dim, hidden_dim),
#             nn.LayerNorm(hidden_dim,)
#         )
#         self.enc_score_head = nn.Linear(hidden_dim, num_classes)
#         self.enc_bbox_head = MLP(hidden_dim, hidden_dim, 4, num_layers=3)

#         # decoder head
#         self.dec_score_head = nn.ModuleList([
#             nn.Linear(hidden_dim, num_classes)
#             for _ in range(num_decoder_layers)
#         ])
#         self.dec_bbox_head = nn.ModuleList([
#             MLP(hidden_dim, hidden_dim, 4, num_layers=3)
#             for _ in range(num_decoder_layers)
#         ])

#         # init encoder output anchors and valid_mask
#         if self.eval_spatial_size:
#             self.anchors, self.valid_mask = self._generate_anchors()

#         self._reset_parameters()

#     def _reset_parameters(self):
#         bias = bias_init_with_prob(0.01)

#         init.constant_(self.enc_score_head.bias, bias)
#         init.constant_(self.enc_bbox_head.layers[-1].weight, 0)
#         init.constant_(self.enc_bbox_head.layers[-1].bias, 0)

#         for cls_, reg_ in zip(self.dec_score_head, self.dec_bbox_head):
#             init.constant_(cls_.bias, bias)
#             init.constant_(reg_.layers[-1].weight, 0)
#             init.constant_(reg_.layers[-1].bias, 0)
        
#         # linear_init_(self.enc_output[0])
#         init.xavier_uniform_(self.enc_output[0].weight)
#         if self.learnt_init_query:
#             init.xavier_uniform_(self.tgt_embed.weight)
#         init.xavier_uniform_(self.query_pos_head.layers[0].weight)
#         init.xavier_uniform_(self.query_pos_head.layers[1].weight)


#     def _build_input_proj_layer(self, feat_channels):
#         self.input_proj = nn.ModuleList()
#         for in_channels in feat_channels:
#             self.input_proj.append(
#                 nn.Sequential(OrderedDict([
#                     ('conv', nn.Conv2d(in_channels, self.hidden_dim, 1, bias=False)), 
#                     ('norm', nn.BatchNorm2d(self.hidden_dim,))])
#                 )
#             )

#         in_channels = feat_channels[-1]

#         for _ in range(self.num_levels - len(feat_channels)):
#             self.input_proj.append(
#                 nn.Sequential(OrderedDict([
#                     ('conv', nn.Conv2d(in_channels, self.hidden_dim, 3, 2, padding=1, bias=False)),
#                     ('norm', nn.BatchNorm2d(self.hidden_dim))])
#                 )
#             )
#             in_channels = self.hidden_dim

#     def _get_encoder_input(self, feats):
#         # get projection features
#         proj_feats = [self.input_proj[i](feat) for i, feat in enumerate(feats)]
#         if self.num_levels > len(proj_feats):
#             len_srcs = len(proj_feats)
#             for i in range(len_srcs, self.num_levels):
#                 if i == len_srcs:
#                     proj_feats.append(self.input_proj[i](feats[-1]))
#                 else:
#                     proj_feats.append(self.input_proj[i](proj_feats[-1]))

#         # get encoder inputs
#         feat_flatten = []
#         spatial_shapes = []
#         level_start_index = [0, ]
#         for i, feat in enumerate(proj_feats):
#             _, _, h, w = feat.shape
#             # [b, c, h, w] -> [b, h*w, c]
#             feat_flatten.append(feat.flatten(2).permute(0, 2, 1))
#             # [num_levels, 2]
#             spatial_shapes.append([h, w])
#             # [l], start index of each level
#             level_start_index.append(h * w + level_start_index[-1])

#         # [b, l, c]
#         feat_flatten = torch.concat(feat_flatten, 1)
#         level_start_index.pop()
#         return (feat_flatten, spatial_shapes, level_start_index)

#     def _generate_anchors(self,
#                           spatial_shapes=None,
#                           grid_size=0.05,
#                           dtype=torch.float32,
#                           device='cpu'):
#         if spatial_shapes is None:
#             spatial_shapes = [[int(self.eval_spatial_size[0] / s), int(self.eval_spatial_size[1] / s)]
#                 for s in self.feat_strides
#             ]
#         anchors = []
#         for lvl, (h, w) in enumerate(spatial_shapes):
#             grid_y, grid_x = torch.meshgrid(\
#                 torch.arange(end=h, dtype=dtype), \
#                 torch.arange(end=w, dtype=dtype), indexing='ij')
#             grid_xy = torch.stack([grid_x, grid_y], -1)
#             valid_WH = torch.tensor([w, h]).to(dtype)
#             grid_xy = (grid_xy.unsqueeze(0) + 0.5) / valid_WH
#             wh = torch.ones_like(grid_xy) * grid_size * (2.0 ** lvl)
#             anchors.append(torch.concat([grid_xy, wh], -1).reshape(-1, h * w, 4))

#         anchors = torch.concat(anchors, 1).to(device)
#         valid_mask = ((anchors > self.eps) * (anchors < 1 - self.eps)).all(-1, keepdim=True)
#         anchors = torch.log(anchors / (1 - anchors))
#         # anchors = torch.where(valid_mask, anchors, float('inf'))
#         # anchors[valid_mask] = torch.inf # valid_mask [1, 8400, 1]
#         anchors = torch.where(valid_mask, anchors, torch.inf)

#         return anchors, valid_mask


#     def _get_decoder_input(self,
#                            memory,
#                            spatial_shapes,
#                            denoising_class=None,
#                            denoising_bbox_unact=None):
#         bs, _, _ = memory.shape
#         # prepare input for decoder
#         if self.training or self.eval_spatial_size is None:
#             anchors, valid_mask = self._generate_anchors(spatial_shapes, device=memory.device)
#         else:
#             anchors, valid_mask = self.anchors.to(memory.device), self.valid_mask.to(memory.device)

#         # memory = torch.where(valid_mask, memory, 0)
#         memory = valid_mask.to(memory.dtype) * memory  # TODO fix type error for onnx export 

#         output_memory = self.enc_output(memory)

#         enc_outputs_class = self.enc_score_head(output_memory)
#         enc_outputs_coord_unact = self.enc_bbox_head(output_memory) + anchors

#         _, topk_ind = torch.topk(enc_outputs_class.max(-1).values, self.num_queries, dim=1)
        
#         reference_points_unact = enc_outputs_coord_unact.gather(dim=1, \
#             index=topk_ind.unsqueeze(-1).repeat(1, 1, enc_outputs_coord_unact.shape[-1]))

#         enc_topk_bboxes = F.sigmoid(reference_points_unact)
#         if denoising_bbox_unact is not None:
#             reference_points_unact = torch.concat(
#                 [denoising_bbox_unact, reference_points_unact], 1)
        
#         enc_topk_logits = enc_outputs_class.gather(dim=1, \
#             index=topk_ind.unsqueeze(-1).repeat(1, 1, enc_outputs_class.shape[-1]))

#         # extract region features
#         if self.learnt_init_query:
#             target = self.tgt_embed.weight.unsqueeze(0).tile([bs, 1, 1])
#         else:
#             target = output_memory.gather(dim=1, \
#                 index=topk_ind.unsqueeze(-1).repeat(1, 1, output_memory.shape[-1]))
#             target = target.detach()

#         if denoising_class is not None:
#             target = torch.concat([denoising_class, target], 1)

#         return target, reference_points_unact.detach(), enc_topk_bboxes, enc_topk_logits

#     ########### RADAR ##############
#     def forward(self, feats, radar_feats, targets=None):
#     # def forward(self, feats, targets=None):

#         # input projection and embedding
#         (memory, spatial_shapes, level_start_index) = self._get_encoder_input(feats)
        
#         # prepare denoising training
#         if self.training and self.num_denoising > 0:
#             denoising_class, denoising_bbox_unact, attn_mask, dn_meta = \
#                 get_contrastive_denoising_training_group(targets, \
#                     self.num_classes, 
#                     self.num_queries, 
#                     self.denoising_class_embed, 
#                     num_denoising=self.num_denoising, 
#                     label_noise_ratio=self.label_noise_ratio, 
#                     box_noise_scale=self.box_noise_scale, )
#         else:
#             denoising_class, denoising_bbox_unact, attn_mask, dn_meta = None, None, None, None

#         target, init_ref_points_unact, enc_topk_bboxes, enc_topk_logits = \
#             self._get_decoder_input(memory, spatial_shapes, denoising_class, denoising_bbox_unact)

#         # decoder
#         out_bboxes, out_logits = self.decoder(
#             target,
#             init_ref_points_unact,
#             memory,
#             spatial_shapes,
#             level_start_index,
#             self.dec_bbox_head,
#             self.dec_score_head,
#             self.query_pos_head,
#             radar_feats=radar_feats, # 新增 radar_feats
#             attn_mask=attn_mask)

#         if self.training and dn_meta is not None:
#             dn_out_bboxes, out_bboxes = torch.split(out_bboxes, dn_meta['dn_num_split'], dim=2)
#             dn_out_logits, out_logits = torch.split(out_logits, dn_meta['dn_num_split'], dim=2)

#         out = {'pred_logits': out_logits[-1], 'pred_boxes': out_bboxes[-1]}

#         if self.training and self.aux_loss:
#             out['aux_outputs'] = self._set_aux_loss(out_logits[:-1], out_bboxes[:-1])
#             out['aux_outputs'].extend(self._set_aux_loss([enc_topk_logits], [enc_topk_bboxes]))
            
#             if self.training and dn_meta is not None:
#                 out['dn_aux_outputs'] = self._set_aux_loss(dn_out_logits, dn_out_bboxes)
#                 out['dn_meta'] = dn_meta

#         return out


#     @torch.jit.unused
#     def _set_aux_loss(self, outputs_class, outputs_coord):
#         # this is a workaround to make torchscript happy, as torchscript
#         # doesn't support dictionary with non-homogeneous values, such
#         # as a dict having both a Tensor and a list.
#         return [{'pred_logits': a, 'pred_boxes': b}
#                 for a, b in zip(outputs_class, outputs_coord)]
