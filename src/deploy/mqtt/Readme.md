## 檔案說明

以下三個核心 Python 檔案，請將它們放在同一個資料夾下：

1.  **`mqtt_publisher.py`**：
    * **發布者核心模組。**
    * 將所有 MQTT 連線和發布的底層邏輯封裝在 `MQTTPublisher` 這個類別中。
    * 你**不需要修改**這個檔案的任何內容。

2.  **`mqtt_subscriber.py`**：
    * **訂閱者測試程式。**
    * 用來連接到 Broker，並接收和顯示從發布者端發出的數據。
    * 這是你們用來**驗證發布功能**是否正常運作的程式。

3.  **`test.py`**：
    * **發布者測試程式。**
    * 展示了如何使用 `MQTTPublisher` 類別來連接 Broker 並發布數據。
    * **這是你們整合主程式的參考範例。**

## 如何測試與使用

請按照以下步驟，將你們主程式所計算的 1.車流量 2. 平均車速 3. 壅塞程度 等結果透過 MQTT 發布出去，並在本地端驗證數據是否正確接收。

### 步驟 1：放置檔案

請將我提供的這三個檔案 (`mqtt_publisher.py`、`mqtt_subscriber.py 和 `test.py`)，放在與你的主程式相同目錄底下。

### 步驟 2：執行訂閱者程式 (接收端)

打開一個命令提示字元或終端機，運行 `mqtt_subscriber.py`。這個程式會連接到 MQTT Broker 並等待接收訊息。

預期結果： 程式會顯示「成功連接到 MQTT Broker!」，然後進入等待接收訊息的狀態。


           嘗試連接到 Broker: 1e1524b3c6e044db8652edb65d6641a0.s1.eu.hivemq.cloud:8883...
 
           已啟動訂閱模式，等待接收訊息...
           按下 Ctrl+C 即可終止程式。
           成功連接到 MQTT Broker!
           嘗試訂閱主題: ['test/traffic-volume', 'test/average-speed', 'test/traffic-congestion']
           ...

### 步驟 3： 整合MQTT功能到主程式 (可參考test.py寫法)

            (1) 匯入類別與設定連線:

                # 匯入 MQTT 類別
                from mqtt_publisher import MQTTPublisher

                # --- MQTT 相關設定 ---
                # Broker 地址以及Port請保持不變
                MQTT_BROKER = "1e1524b3c6e044db8652edb65d6641a0.s1.eu.hivemq.cloud"
                MQTT_PORT = 8883
                MQTT_CLIENT_ID = "python_mqtt_sender"  # 專案的唯一 ID, 可不改

                # 帳號憑證（使用我提供的帳號密碼）
                MQTT_USERNAME = "School_publisher"
                MQTT_PASSWORD = "Abcd1234"

            (1) 建立實例並連接 Broker: 在你們的主程式啟動部分，建立 MQTTPublisher 實例並呼叫 connect() 方法。

                # 建立 MQTT 發布者實例
                publisher = MQTTPublisher(MQTT_BROKER, MQTT_PORT, MQTT_CLIENT_ID, MQTT_USERNAME, MQTT_PASSWORD)

                try:
                    # 連接到 MQTT Broker
                    publisher.connect()
    
                    # ... 你的 AI 演算法主迴圈 ...

                except KeyboardInterrupt:
                    print("\n程式被手動終止。")
                finally:
                    # 確保在程式結束時安全地斷開連線
                    publisher.disconnect()


### 步驟 4： 發布運算結果(1.車流量 2. 平均車速 3. 壅塞程度) 


           # 在你的主迴圈中...
           while True:
               # 取得主程式計算出的三種交通數據替換掉   (請參考 test.py,  將用來隨機生成數據的程式碼替換成主程式運算的結果)
               traffic_volume = ...
               average_speed = ...
               traffic_congestion = ... 

               # 呼叫 MQTTPublisher 的發布方法來發布數據。
               publisher.publish_traffic_data(traffic_volume, average_speed, traffic_congestion)

