"""by lyuwenyu
"""

import torch 
import torch.nn as nn 
import torch.nn.functional as F 

import random 
import numpy as np 

from src.core import register


__all__ = ['RTDETR', ]


@register
class RTDETR(nn.Module):
    __inject__ = ['backbone', 'encoder', 'decoder', ]

    def __init__(self, backbone: nn.Module, encoder, decoder, multi_scale=None):
        super().__init__()
        self.backbone = backbone
        self.decoder = decoder
        self.encoder = encoder
        self.multi_scale = multi_scale
    
    ############### RADAR ###############
    # def forward(self, x, targets=None):
    def forward(self, x, radar_feats, targets=None):
        if self.multi_scale and self.training:
            sz = np.random.choice(self.multi_scale)
            x = F.interpolate(x, size=[sz, sz])
            
        x = self.backbone(x)
        x = self.encoder(x)        
        # samples = self.decoder(samples, targets)

        # 把 radar_feats 傳進 decoder
        outputs = self.decoder(x, radar_feats, targets)

        # print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        # print(radar_feats)
        # print("@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        # input("Check radar_feats")
        return outputs
    
    def deploy(self, ):
        self.eval()
        for m in self.modules():
            if hasattr(m, 'convert_to_deploy'):
                m.convert_to_deploy()
        return self 
