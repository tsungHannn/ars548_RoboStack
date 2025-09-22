import torch 
import torch.utils.data as data

from src.core import register


__all__ = ['DataLoader']


@register
class DataLoader(data.DataLoader):
    __inject__ = ['dataset', 'collate_fn']

    def __repr__(self) -> str:
        format_string = self.__class__.__name__ + "("
        for n in ['dataset', 'batch_size', 'num_workers', 'drop_last', 'collate_fn']:
            format_string += "\n"
            format_string += "    {0}: {1}".format(n, getattr(self, n))
        format_string += "\n)"
        return format_string



@register
def default_collate_fn(items):
    '''default collate_fn
    '''    
    return torch.cat([x[0][None] for x in items], dim=0), [x[1] for x in items]


############## RADAR ##############
# 新增 radar 專用的 collate_fn
@register
def radar_collate_fn(items):
    imgs, radars, targets = zip(*items)  # 對應 img, radar_feats, target
    imgs = torch.stack(imgs, dim=0)      # 假設尺寸一致
    radars = list(radars)                # 不同圖像的 radar 數量可不同
    return imgs, radars, list(targets)

############## RADAR + heatmap ##############
@register
def radar_hm_collate_fn(items):
    imgs, hm, radars, targets = zip(*items)  # 對應 img, radar_feats, target
    imgs = torch.stack(imgs, dim=0)      # 假設尺寸一致
    hm = torch.stack(hm, dim=0)      # 假設尺寸一致
    radars = list(radars)                # 不同圖像的 radar 數量可不同
    return imgs, hm, radars, list(targets)

############## RADAR + heatmap ##############
@register
def hm_collate_fn(items):
    imgs, hm, targets = zip(*items)  # 對應 img, radar_feats, target
    imgs = torch.stack(imgs, dim=0)      # 假設尺寸一致
    hm = torch.stack(hm, dim=0)      # 假設尺寸一致
    return imgs, hm, list(targets)