# """by lyuwenyu
# """

# import torch 
# import torch.nn as nn 
# import torch.nn.functional as F 

# import random 
# import numpy as np 

# from src.core import register


# __all__ = ['RTDETR', ]


# @register
# class RTDETR(nn.Module):
#     __inject__ = ['backbone', 'encoder', 'decoder', ]

#     def __init__(self, backbone: nn.Module, encoder, decoder, multi_scale=None):
#         super().__init__()
#         self.backbone = backbone
#         self.decoder = decoder
#         self.encoder = encoder
#         self.multi_scale = multi_scale
        
#     def forward(self, x, targets=None):
#         if self.multi_scale and self.training:
#             sz = np.random.choice(self.multi_scale)
#             x = F.interpolate(x, size=[sz, sz])
            
#         x = self.backbone(x)
#         x = self.encoder(x)        
#         x = self.decoder(x, targets)

#         return x
    
#     def deploy(self, ):
#         self.eval()
#         for m in self.modules():
#             if hasattr(m, 'convert_to_deploy'):
#                 m.convert_to_deploy()
#         return self 


############################################################################################
#################################### RADAR #################################################
############################################################################################
# """by lyuwenyu
# """

# import torch 
# import torch.nn as nn 
# import torch.nn.functional as F 

# import random 
# import numpy as np 

# from src.core import register


# __all__ = ['RTDETR', ]


# @register
# class RTDETR(nn.Module):
#     __inject__ = ['backbone', 'encoder', 'decoder', ]

#     def __init__(self, backbone: nn.Module, encoder, decoder, multi_scale=None):
#         super().__init__()
#         self.backbone = backbone
#         self.decoder = decoder
#         self.encoder = encoder
#         self.multi_scale = multi_scale
    
#     ############### RADAR ###############
#     # def forward(self, x, targets=None):
#     def forward(self, x, radar_feats, targets=None):
#         if self.multi_scale and self.training:
#             sz = np.random.choice(self.multi_scale)
#             x = F.interpolate(x, size=[sz, sz])
            
#         x = self.backbone(x)
#         x = self.encoder(x)        
#         # samples = self.decoder(samples, targets)

#         # 把 radar_feats 傳進 decoder
#         outputs = self.decoder(x, radar_feats, targets)

#         # print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
#         # print(radar_feats)
#         # print("@@@@@@@@@@@@@@@@@@@@@@@@@@@")
#         # input("Check radar_feats")
#         return outputs
    
#     def deploy(self, ):
#         self.eval()
#         for m in self.modules():
#             if hasattr(m, 'convert_to_deploy'):
#                 m.convert_to_deploy()
#         return self 




# ############################################################################################
# #################################### RADAR + heatmap #######################################
# ############################################################################################
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
    
    def forward(self, x, hm, radar_feats, targets=None):
        if hm.dim() == 3:     # (B,H,W) -> (B,1,H,W)
            hm = hm.unsqueeze(1)

        if self.multi_scale and self.training:
            sz = np.random.choice(self.multi_scale)
            x = F.interpolate(x, size=[sz, sz])
            hm = F.interpolate(hm, size=(sz, sz))
            
        # 把 heatmap 當第 4 個通道
        x = torch.cat([x, hm], dim=1)    # (B,4,H,W)
        x = self.backbone(x)
        x = self.encoder(x)        
        # 把 radar_feats 傳進 decoder
        outputs = self.decoder(x, radar_feats, targets)

        return outputs
    
    def deploy(self, ):
        self.eval()
        for m in self.modules():
            if hasattr(m, 'convert_to_deploy'):
                m.convert_to_deploy()
        return self 







############################################################################################
#################################### heatmap ###############################################
############################################################################################
# """by lyuwenyu
# """

# import torch 
# import torch.nn as nn 
# import torch.nn.functional as F 

# import random 
# import numpy as np 

# from src.core import register


# __all__ = ['RTDETR', ]


# @register
# class RTDETR(nn.Module):
#     __inject__ = ['backbone', 'encoder', 'decoder', ]

#     def __init__(self, backbone: nn.Module, encoder, decoder, multi_scale=None):
#         super().__init__()
#         self.backbone = backbone
#         self.decoder = decoder
#         self.encoder = encoder
#         self.multi_scale = multi_scale
    
#     def forward(self, x, hm, targets=None):
#         if hm.dim() == 3:     # (B,H,W) -> (B,1,H,W)
#             hm = hm.unsqueeze(1)

#         if self.multi_scale and self.training:
#             sz = np.random.choice(self.multi_scale)
#             x = F.interpolate(x, size=[sz, sz])
#             hm = F.interpolate(hm, size=(sz, sz))
            
#         # 把 heatmap 當第 4 個通道
#         x = torch.cat([x, hm], dim=1)    # (B,4,H,W)
#         x = self.backbone(x)
#         x = self.encoder(x)        
#         # 把 radar_feats 傳進 decoder
#         outputs = self.decoder(x, targets)

#         return outputs
    
#     def deploy(self, ):
#         self.eval()
#         for m in self.modules():
#             if hasattr(m, 'convert_to_deploy'):
#                 m.convert_to_deploy()
#         return self 