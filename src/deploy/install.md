# installation

```
conda create env -n ros python=3.11
conda install -n ros -y -c conda-forge -c robostack-staging ros-noetic-desktop ros-noetic-compressed-image-transport ros-noetic-can-msgs
pip install ultralytics
pip install git+https://github.com/eric-wieser/ros_numpy.git
pip install git+https://github.com/kadirnar/bytetrack-pip.git --no-deps
```