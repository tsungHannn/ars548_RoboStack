- [雷達、攝影機環境建置](#雷達攝影機環境建置)
- [設定遠端連線:](#設定遠端連線)
- [相機-雷達校正](#相機-雷達校正)
- [相機內參校正](#相機內參校正)


## 雷達、攝影機環境建置
![494689913_552456924250956_4257150307974944196_n](https://github.com/user-attachments/assets/0938145d-52ea-4b60-adff-3f5db6aa1491)

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
4. Install [RoboStack](https://robostack.github.io/GettingStarted.html)
    - 直接使用 yaml 建置 micromamba 環境 (舊版本)
        ```
        cd ars548_RoboStack/src/deploy
        micromamba env create -n ros -f env.yaml
        micromamba activate ros
        ```

        > 輸出目前 micromamba 環境: `micromamba env export > env.yaml`

    - 官網的RoboStack安裝:   
        ```bash
        # Create a ros-noetic desktop environment
        micromamba create -n ros -c conda-forge -c robostack-staging ros-noetic-desktop

        # Activate the environment
        micromamba activate ros

        # Installing tools for local development
        micromamba install -c conda-forge compilers cmake pkg-config make ninja colcon-common-extensions catkin_tools rosdep

        micromamba install -n ros -y -c conda-forge -c robostack-staging ros-noetic-desktop ros-noetic-compressed-image-transport ros-noetic-can-msgs
        ```

    可以在 bashrc 裡面加上 alias，之後開環境就不用每次都打`micromamba activate ros`
    ```bash
    alias ros="micromamba activate ros"
    ```
    之後新開 Terminal 後就可以直接打 `ros` 就進入 ROS 環境，不用打一串。
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


## 相機-雷達校正
- 開啟校正面板：
    - 可以透過指令 `python launch.py --control`，開啟主要程式同時開啟校正面板。
    - 也可以直接 `python projector.py` 開啟校正面板。
      
   ![image](https://github.com/user-attachments/assets/5d27916b-136d-403f-96de-57846302038e)

    

- 校正面板使用說明：
    - Calibration Scale：調整旋轉、平移的 step size。
    - Transformation Controls：直接調整外參的旋轉、平移，調整大小由 Calibration Scale 控制。
    - Auto Calibration：自動化校正功能。
      - 優化方法：SciPy 套件的求最小值之方式。可以參考 [Method](https://docs.scipy.org/doc/scipy/reference/generated/scipy.optimize.minimize.html)。
      - 取樣間隔：錄製時要間隔幾幀(1代表每一幀都儲存，數字愈大間隔愈久)。
        - e.g. 取樣間隔2 → 按下開始錄製後，經過 60 幀的話，只會儲存其中 30 幀，每間隔一幀才會儲存。
      - 使用方式：
        1. 選擇優化方法與取樣間隔。
        2. 按下開始錄製後，系統會開始錄製片段。
        3. 按下停止錄製後，系統會重播已錄製的片段。想要重新錄製的話可以按清除片段後，重新開始錄製。
        4. 按下開始優化後即開始計算最佳外參。(註: 畫面上有藍點、綠點、紅線代表正在進行優化)
    - Actions：校正結果不理想，可以 Reset 回到一開始的狀態。校正完成後按下 Save 則會將結果寫入檔案中。

## 相機內參校正
- 安裝校正工具 `micromamba install -c robostack-staging ros-noetic-camera-calibration`
- 開啟程式 `python launch.py --stream`
- 開啟新的 Terminal
- 執行校正程式 `rosrun camera_calibration cameracalibrator.py --size 9x6 --square 0.029 image:=/aravis_cam/image_color_calib`
    > --size：棋盤格的格子數量
    > --square：棋盤格的格子大小(單位：m)
    > 其他使用方式可參考[這裡](https://wiki.ros.org/camera_calibration/Tutorials/MonocularCalibration)

相機拍棋盤格：
![494329775_705407518666240_7509662502268488214_n](https://github.com/user-attachments/assets/38ad6af5-e044-4135-8613-ecd7a05afbf8)

執行畫面：
![Screenshot from 2025-05-05 14-25-49](https://github.com/user-attachments/assets/1ba62405-602f-460b-9c7e-e642cff47eb9)

使用不同角度拍攝棋盤格，之後按下 CALIBRATE 按鈕後，校正結果會在 Terminal：
![Screenshot from 2025-05-05 14-28-26_1](https://github.com/user-attachments/assets/8dec14b5-1774-4b88-848b-6c33a249644f)


    
