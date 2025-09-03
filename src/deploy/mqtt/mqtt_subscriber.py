# -*- coding: utf-8 -*-
# mqtt_subscriber.py
import paho.mqtt.client as mqtt
import time
import json

# --- MQTT 相關設定 ---
#MQTT_BROKER = "127.0.0.1"                                                        # 連接到本機上正在執行的 MQTT 服務, 需替換成您的 MQTT Broker 地址
MQTT_BROKER = "1e1524b3c6e044db8652edb65d6641a0.s1.eu.hivemq.cloud"               # 這裡使用 HiveMQ Cloud 測試 broker (中科院)
MQTT_PORT = 8883                                                                  # MQTT 預設端口
# 訂閱TOPIC
MQTT_TOPIC_VOLUME = "test/traffic-volume"                                         # 車流量
MQTT_TOPIC_SPEED = "test/average-speed"                                           # 平均車速
MQTT_TOPIC_CONGESTION = "test/traffic-congestion"                                 # 雍塞程度

# 客戶端 ID，建議使用唯一值
MQTT_CLIENT_ID = "python_mqtt_subscriber"

# HiveMQ Cloud 測試 broker (中科院) 帳號憑證
MQTT_USERNAME = "School_subscriber"
MQTT_PASSWORD = "Abcd1234"

# --- 連線成功回調函數 ---
def on_connect(client, userdata, flags, rc):
    # rc (result code) 代表連接結果，0 表示成功連接
    if rc == 0:
        print("成功連接到 MQTT Broker!")
        # 連接成功後，一次訂閱多個主題
        topic_list = [
            (MQTT_TOPIC_VOLUME, 1),
            (MQTT_TOPIC_SPEED, 1),
            (MQTT_TOPIC_CONGESTION, 1)
        ]
        print(f"嘗試訂閱主題: {[topic[0] for topic in topic_list]}")
        client.subscribe(topic_list)
    else:
        print(f"連接失敗，錯誤代碼: {rc}")
        print("請檢查 Broker 地址、端口或網路連接。")

# --- 收到訊息回調函數 ---
def on_message(client, userdata, msg):
    # 解析 JSON 訊息並計算延遲
    try:
        # 記錄接收時間
        timestamp_receive = time.time() 
        
        # 解析收到的 JSON 數據
        payload = json.loads(msg.payload.decode())
        timestamp_send = payload.get("timestamp")
        
        # 驗證數據
        if timestamp_send:
            latency = (timestamp_receive - timestamp_send) * 1000 # 轉換為毫秒
            print(f"--- 收到訊息 ---")
            print(f"主題 (Topic): {msg.topic}")
            print(f"內容 (Payload): {payload}")
            print(f"延遲時間: {latency:.2f} ms")                  # 印出延遲，保留兩位小數
            print(f"QoS: {msg.qos}")
            print(f"Retain: {msg.retain}")                        # 是否為保留訊息
            print("-" * 20)
        else:
            print("警告：收到的訊息缺少時間戳記。")
            
    except json.JSONDecodeError:
        print("錯誤：無法解析 JSON 格式的訊息。")


# --- 主程式 ---
if __name__ == "__main__":
    # 建立 MQTT 客戶端實例
    # CallbackAPIVersion.VERSION1 指定了回調函數的 API 版本
    client = mqtt.Client(mqtt.CallbackAPIVersion.VERSION1, MQTT_CLIENT_ID)

    # 設定回調函數
    client.on_connect = on_connect  # 連接成功時調用
    client.on_message = on_message  # 收到訊息時調用

    # 設定使用者名稱和密碼
    client.username_pw_set(MQTT_USERNAME, MQTT_PASSWORD)

    # 啟用 TLS/SSL 加密
    client.tls_set()

    # 連接到 MQTT Broker
    print(f"嘗試連接到 Broker: {MQTT_BROKER}:{MQTT_PORT}...")
    try:
        client.connect(MQTT_BROKER, MQTT_PORT, 60) # 保持連線最長 60 秒
    except Exception as e:
        print(f"連接錯誤: {e}")
        print("請確認網路連線或 Broker 是否正常運作。")
        exit() # 連接失敗則退出程式

    # 啟動網路迴圈，這會處理連線、重連和訊息接收
    # loop_forever() 會阻塞主線程，直到手動斷開連接或發生錯誤
    # 如果您希望程式在背景運行並執行其他操作，可以使用 client.loop_start()
    print("\n已啟動訂閱模式，等待接收訊息...")
    print("按下 Ctrl+C 即可終止程式。")

    try:
        client.loop_forever() # 保持連接並持續監聽訊息
    except KeyboardInterrupt:
        print("\n程式被手動終止。")
    except Exception as e:
        print(f"發生錯誤: {e}")
    finally:
        # 斷開連接
        print("斷開與 MQTT Broker 的連接。")
        client.disconnect()
        # loop_forever() 退出後不需要再調用 loop_stop()
        # 但如果使用 loop_start() 則需要 client.loop_stop()