import numpy as np
import yaml

class NestedObject:
    """
    A class that converts nested JSON structures (dicts, lists) into
    Python objects with attribute access.
    """
    def __init__(self, obj):
        for key, value in obj.items():
            # Convert value to NestedObject if it's a dict
            if isinstance(value, dict):
                setattr(self, key, NestedObject(value))
            # Convert value to list of NestedObjects if it's a list of dicts
            elif isinstance(value, list) and all(isinstance(item, dict) for item in value):
                setattr(self, key, [NestedObject(item) for item in value])
            # Otherwise set the value directly
            else:
                setattr(self, key, value)
    
    def __repr__(self):
        attrs = ', '.join(f"{key}={repr(value)}" for key, value in self.__dict__.items())
        return f"NestedObject({attrs})"
    
    def to_dict(self):
        result = {}
        for key, value in self.__dict__.items():
            if isinstance(value, NestedObject):
                result[key] = value.to_dict()
            elif isinstance(value, list):
                result[key] = [
                    item.to_dict() if isinstance(item, NestedObject) else item
                    for item in value
                ]
            else:
                result[key] = value
        return result

def transform_to_numpy(d):
    for k, v in d.items():
        if isinstance(v, list):
            d[k] = np.array(v)
        elif isinstance(v, dict):
            transform_to_numpy(v)
        return d

def json_to_object(d):
    d = transform_to_numpy(d)
    return NestedObject(d)


def yaml_to_object(filepath):
    with open(filepath, 'r') as f:
        data = yaml.safe_load(f)  # 讀取 YAML，變成 dict
    return json_to_object(data)   



