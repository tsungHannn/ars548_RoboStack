- [雷達、攝影機環境建置](#雷達攝影機環境建置)
- [設定遠端連線:](#設定遠端連線)
- [相機-雷達校正](#相機-雷達校正)
- [兩台電腦ROS連線](#兩台電腦ros連線)
- [相機內參校正](#相機內參校正)
- [單IPC連接多RSU](#單ipc連接多rsu)



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

    
## 兩台電腦ROS連線
- 用網路線連接兩台電腦，就可以分別連接雷達，避免兩台雷達連接同一台電腦，造成 ip conflict。
- 以下範例連接兩台電腦: ncsist1 與 ncsist2
- 網路孔 
<img width="679" height="565" alt="圖片1" src="https://github.com/user-attachments/assets/6ebcec68-c7a7-4917-b136-21d229cba3f3" />

### 設定
1. 網路線連接後，修改 ip 位置: ncsist1 改為 `192.168.2.10`；ncsist2 改為 `192.168.2.11`，如圖
   <img width="574" height="441" alt="image" src="https://github.com/user-attachments/assets/4df61502-8e9e-443c-b2c6-dfcebebd7685" />

1. 修改路徑/etc/hosts: `sudo vim /etc/hosts`
   - 新增內網ip與名稱 (**名稱都不能重複**)，如下: 新增 `192.168.2.10 ncsist1` 跟 `192.168.2.11 ncsist2`
      ```
      127.0.0.1       localhost
      127.0.1.1       ncsist-MIC-770V3W
      
      192.168.2.10 ncsist1
      192.168.2.11 ncsist2
      
      # The following lines are desirable for IPv6 capable hosts
      ::1     ip6-localhost ip6-loopback
      fe00::0 ip6-localnet
      ff00::0 ip6-mcastprefix
      ff02::1 ip6-allnodes
      ff02::2 ip6-allrouters
      ```
   - 兩台電腦都要設定
2. 修改.bashrc: `vim ~/.bashrc`
   - 新增 `ROS_HOSTNAME` 跟 `ROS_MASTER_URI`，其中 `ROS_HOSTNAME` 是當前電腦的名稱，`ROS_MASTER_URI` 是主要主機的ip(即要進行roscore的主機)。
   - 範例: 用 ncsist1 這台電腦作為 Master。
     在 ncsist1 的 .bashrc 加上:
     ```
     export ROS_HOSTNAME=ncsist1
     export ROS_MASTER_URI=http://192.168.2.10:11311
     ```
   - 在 ncsist2 的 .bashrc 加上:
     ```
     export ROS_HOSTNAME=ncsist2
     export ROS_MASTER_URI=http://192.168.2.10:11311
     ```
3. 兩台電腦都執行 `source ~/.bashrc`
4. 在 ncsist1 上執行 `roscore` 之後，另一台電腦就可以直接連上了
   > 在 ncsist2 上直接執行 `rostopic list` 就可以看到目前的 topic，不用 `roscore`

### 連線、錄製流程
1. 兩台電腦各別連接雷達、相機
2. 在 ncsist1 啟動程式 → roscore、發布雷達跟相機的 topic
   ```
   ros
   cd ars548_RoboStack
   echo "enp3s0" | sudo sh configurer.sh
   python launch.py --stream
   ```
3. 在 ncsist2 啟動程式 → 發布雷達跟相機的 topic
   ```
   # 跟ncsist1的啟動方式一樣
   ros
   cd ars548_RoboStack
   echo "enp3s0" | sudo sh configurer.sh
   python launch.py --stream
   ```
4. 在 ncsist1 的 RVIZ 畫面中看到不同 RSU 的畫面並錄製 ROS Bag

### 切換回單 RSU 連線
目前設定是必須兩台 IPC 連線才能順利執行，如果只需要一台電腦+一組 RSU 需另外設定
1. 修改 `.bashrc`
   ```
   vim ~/.bashrc
   # 註解掉最後兩行:
   # export ROS_HOSTNAME=ncsist1
   # export ROS_MASTER_URI=http://192.168.2.10:11311
   ```
2. 重新開啟 Terminal
3. [開啟程式](#連線錄製流程)
   ```
   ros
   cd ars548_RoboStack
   echo "enp3s0" | sudo sh configurer.sh
   python launch.py --stream
   ```
   > ncsist2 的 launch.py 裡面沒有執行 roscore，所以如果要用 ncsist2 執行單裝置連接，在執行 launch.py 之前要先執行 roscore


   
## 單IPC連接多RSU
- 如果要連兩個 RSU (Radar+Camera)，要另外設定
<img width="721" height="663" alt="圖片1" src="https://github.com/user-attachments/assets/25868c42-b5d3-45eb-a7b2-386e742f3275" />

- `/etc/netplan/01-network-manager-all.yaml`
   ```
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
       enp4s0f2:
           dhcp4: false
           dhcp6: false
           addresses:
           - 192.168.11.10/16
       enp4s0f3:
           dhcp4: false
           dhcp6: false
           addresses:
             - 10.13.2.169/24
   ```
- `/src/ars548_ros-noetic/ars548_driver/src/ars548_driver_node.cpp` 裡面要改成用 multi-threading 來開兩個 Driver。
```
// 創建執行緒來運行每個 driver
    std::thread thread1([&]() {
        Ars548_Driver driver1("224.0.2.2", "10.13.1.166", 42102, "ARS_548", "/radar1");
      // 參數: 雷達IP, 雷達Interface, 雷達Port, FieldName, TopicPrefix
      // 之後發布的topic前面會有TopicPrefix，用來區分兩台雷達裝置
    });
    
    std::thread thread2([&]() {
        Ars548_Driver driver2("224.0.2.2", "10.13.2.168", 42102, "ARS_548", "/radar2");
    });
```
- 連線:
  1. 網卡設定: 
      ```
      echo "enp3s0" | sudo sh configurer1.sh
      echo "enp4s0f3" | sudo sh configurer2.sh
      ```
   2. `python launch.py --stream`
- 雷達 IP: 雷達發送的 IP 目標都是 `224.0.2.2`，所以要在 driver 裡面指定，用網卡名稱來決定讀取哪一台雷達的資訊。
- 斷線問題: 因為雷達封包非常不穩定，如果掉太久原本的driver會直接抱錯，所以把Timeout的檢查刪掉了。
- 相機: 如果stream_camera.py啟動失敗，可以開SpinView來看有沒有正確讀到攝影機。看完之後把SpinView關掉，再重新`python stream_camera.py`。
