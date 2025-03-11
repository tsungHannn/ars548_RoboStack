## 雷達、攝影機環境建置
1. 設定netplan: /etc/netplan/01-network-manager-all.yaml
   > 第一個eno1是為了遠端連線用，如果不用筆電連線的話可以不用設定
    ```yaml
    # Let NetworkManager manage all devices on this system
    network:
    version: 2
    renderer: NetworkManager
    ethernets:
        eno1:
            dhcp4: false
            dhcp6: false
            addresses:
            - 192.168.1.122/24
            routes:
            - to: default
              via: 192.168.1.1
        enp3s0:
            dhcp4: false
            dhcp6: false
            addresses:
            - 10.13.1.167/24
        enp4s0f0:
            dhcp4: false
            dhcp6: false
            addresses:
            - 169.254.224.225/16
            routes:
            - to: default
              via: 192.168.1.1
    ```
    設定完執行
    ```bash
    sudo netplan try
    ```
2. Install micromamba
    ```bash
    "${SHELL}" <(curl -L micro.mamba.pm/install.sh)
    ```
3. Install ffmpeg
    ```bash
    sudo apt-get install ffmpeg 
    ```
4. Install RoboStack
   ** Note: 官網更新的Dependence可能會有問題，先執行下一步，git clone ars548_RoboStack 之後 
    ```
    cd ars548_RoboStack/src/deploy
    micromamba env create -n ros -f env.yaml
    micromamba activate ros
    pip install ultralytics rotpy git+https://github.com/eric-wieser/ros_numpy.git
    ```

    輸出 micromamba 環境:
    `micromamba env export > env.yaml`


    官網的RoboStack安裝(Not Suggested):   
    ```bash
    # 直接安裝可能會有問題
    # Create a ros-noetic desktop environment
    micromamba create -n ros -c conda-forge -c robostack-staging ros-noetic-desktop

    # Activate the environment
    micromamba activate ros

    # Installing tools for local development
    micromamba install -c conda-forge compilers cmake pkg-config make ninja colcon-common-extensions catkin_tools rosdep

    micromamba install -n ros -y -c conda-forge -c robostack-staging ros-noetic-desktop ros-noetic-compressed-image-transport ros-noetic-can-msgs
    ```

    可以在 bashrc 裡面加上 alias，之後開環境就不用打一串指令
    ```bash
    alias ros="micromamba activate ros"
    ```
5. Install ars548_RoboStack
    ```bash
    git clone https://github.com/tsungHannn/ars548_RoboStack.git

    # Rebuild the environment
    rm -r build/ devel/ .catkin_workspace
    catkin_make

    # install python package
    pip install ultralytics
    pip install rotpy
    pip install git+https://github.com/eric-wieser/ros_numpy.git
    ```
    - 修改 src/deploy/launch.py 裡面的路徑
    ```
    pre_commands = ['micromamba activate ros && source ~/.ars548_RoboStack/devel/setup.bash]
                                                        ^^^^^^^HERE
    ```
6. Install tmux
   ```bash
   sudo apt install tmux
   ```
7. 雷達連線
    ```bash
    cd ars548_RoboStack/src/deploy
    echo "enp3s0" | sudo sh configurer.sh 
    ```
8. 執行程式
    ```bash
    python launch.py --stream --control
    ```
    參數選項:
    - --stream: 直接使用目前雷達與相機的資訊
    - --control: 開啟外參控制面板
    - --bag: 播放bag


## 設定遠端連線:
1. 設定netplan: /etc/netplan/01-network-manager-all.yaml
    ```yaml
    # Let NetworkManager manage all devices on this system
    network:
    version: 2
    renderer: NetworkManager
    ethernets:
        eno1:
        dhcp4: false
        dhcp6: false
        addresses:
        - 192.168.1.122/24
        routes:
        - to: default
            via: 192.168.1.1
    ```
2. Setting -> Sharing -> Remote Desktop (ON) 
    - Enable Legacy VNC Protocol (ON)
    - Remote Control (ON)
    - set Username & Password: ncsist
3. Setting -> Users -> Automatic Login (ON)
4. Set keyring default password empty: Application -> Passwords and Keys -> 左邊選單 右鍵點Login -> Change Password -> 輸入登入密碼之後新密碼留白
5. 每次開機之後密碼會自己重新設定為亂碼，須設定為固定密碼: 新增.config/autostart/password_fix.desktop
    ```
    [Desktop Entry]
    Type=Application
    Name=Password Fix  
    Comment=Corrects password in Settings > Users for use by Remmina
    Exec=/usr/bin/python3 -c "import keyring;keyring.set_password('login','ncsist','ncsist');"
    ```
6. 重新確認一下遠端連線的帳號密碼 Setting -> Sharing -> Rermote Desktop
7. 重開機之後應該就可以直接用筆電使用遠端桌面連線登入了


