# -*- coding: utf-8 -*-
# mqtt_publisher.py

import paho.mqtt.client as mqtt
import json
import time

class MQTTPublisher:
    """
    一個用於連接 MQTT Broker 並發布 JSON 格式數據的類別。
    """
    def __init__(self, broker, port, client_id, username, password):
        self.broker = broker
        self.port = port
        self.client_id = client_id
        self.username = username
        self.password = password
        self.client = None

    def on_connect(self, client, userdata, flags, rc):
        if rc == 0:
            print("成功連接到 MQTT Broker！")
        else:
            print(f"連接失敗，錯誤代碼: {rc}")

    def connect(self):
        """建立與 MQTT Broker 的連線並啟動網路迴圈。"""
        self.client = mqtt.Client(mqtt.CallbackAPIVersion.VERSION1, self.client_id)
        self.client.on_connect = self.on_connect
        self.client.username_pw_set(self.username, self.password)
        self.client.tls_set()
        
        try:
            self.client.connect(self.broker, self.port, 60)
            self.client.loop_start() # 在背景啟動網路迴圈
        except Exception as e:
            print(f"連接錯誤: {e}")
            raise # 拋出錯誤，讓主程式知道連線失敗

    # --- 方法 1: 單獨發布 ---
    def publish_data(self, topic, value):
        """
        將單一數值發布到指定的 MQTT 主題。
        :param topic: 要發布的 MQTT 主題，例如 "test/traffic-volume"
        :param value: 要發布的數值 (車流量、車速、壅塞度等)
        """
        if not self.client or not self.client.is_connected():
            print("警告：客戶端未連線，無法發布訊息。")
            return

        timestamp_send = time.time()
        payload = {
            "timestamp": timestamp_send,
            "value": value
        }
        
        message = json.dumps(payload)
        self.client.publish(topic, message, qos=2)
        print(f"發送訊息到主題 '{topic}': '{message}'")

    # --- 方法 2: 整合發布 ---
    def publish_traffic_data(self, traffic_volume, average_speed, traffic_congestion):
        """
        一次性將所有交通數據發布到各自的主題。
        :param traffic_volume: 車流量數值
        :param average_speed: 平均車速數值
        :param traffic_congestion: 壅塞度數值
        """
        if not self.client or not self.client.is_connected():
            print("警告：客戶端未連線，無法發布訊息。")
            return
        
        # 發布 traffic-volume 訊息
        payload_volume = {"timestamp": time.time(), "value": traffic_volume}
        message_volume = json.dumps(payload_volume)
        self.client.publish("test/traffic-volume", message_volume, qos=2)
        print(f"發送訊息到主題 'test/traffic-volume': '{message_volume}'")

        # 發布 average-speed 訊息
        payload_speed = {"timestamp": time.time(), "value": average_speed}
        message_speed = json.dumps(payload_speed)
        self.client.publish("test/average-speed", message_speed, qos=2)
        print(f"發送訊息到主題 'test/average-speed': '{message_speed}'")

        # 發布 traffic-congestion 訊息
        payload_congestion = {"timestamp": time.time(), "value": traffic_congestion}
        message_congestion = json.dumps(payload_congestion)
        self.client.publish("test/traffic-congestion", message_congestion, qos=2)
        print(f"發送訊息到主題 'test/traffic-congestion': '{message_congestion}'")

    def disconnect(self):
        """斷開與 MQTT Broker 的連線。"""
        if self.client:
            self.client.disconnect()
            self.client.loop_stop()
            print("已斷開與 MQTT Broker 的連接。")