# -*- coding: utf-8 -*-
# test.py
import time
import random
from mqtt_publisher import MQTTPublisher # 匯入 MQTTPublisher 類別

# --- MQTT 相關設定 ---
MQTT_BROKER = "1e1524b3c6e044db8652edb65d6641a0.s1.eu.hivemq.cloud"
MQTT_PORT = 8883
MQTT_CLIENT_ID = "python_mqtt_sender"

# HiveMQ Cloud 帳號憑證
MQTT_USERNAME = "School_publisher"
MQTT_PASSWORD = "Abcd1234"

# --- 主程式 ---
if __name__ == "__main__":
    # 建立 MQTT 發布者實例
    publisher = MQTTPublisher(MQTT_BROKER, MQTT_PORT, MQTT_CLIENT_ID, MQTT_USERNAME, MQTT_PASSWORD)
    
    try:
        # 連接到 MQTT Broker
        publisher.connect()

        while True:
            # 隨機生成三種不同的交通數據
            traffic_volume = random.randint(100, 500)
            average_speed = round(random.uniform(20.0, 80.0), 2)
            traffic_congestion = round(random.uniform(0.0, 1.0), 2)

            # 發布TOPIC
            publisher.publish_traffic_data(traffic_volume, average_speed, traffic_congestion)
            
            # 每 3 秒發送一次
            time.sleep(3)

    except KeyboardInterrupt:
        print("\n程式被手動終止。")
    except Exception as e:
        print(f"發生錯誤: {e}")
    finally:
        publisher.disconnect()