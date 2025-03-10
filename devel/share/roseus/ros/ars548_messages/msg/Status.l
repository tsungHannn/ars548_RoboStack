;; Auto-generated. Do not edit!


(when (boundp 'ars548_messages::Status)
  (if (not (find-package "ARS548_MESSAGES"))
    (make-package "ARS548_MESSAGES"))
  (shadow 'Status (find-package "ARS548_MESSAGES")))
(unless (find-package "ARS548_MESSAGES::STATUS")
  (make-package "ARS548_MESSAGES::STATUS"))

(in-package "ROS")
;;//! \htmlinclude Status.msg.html


(defclass ars548_messages::Status
  :super ros::object
  :slots (_timestamp_nanoseconds _timestamp_seconds _timestamp_syncstatus _swversion_major _swversion_minor _swversion_patch _longitudinal _lateral _vertical _yaw _pitch _plugorientation _length _width _height _wheelbase _maximundistance _frequencyslot _cycletime _timeslot _hcc _powersave_standstill _sensoripaddress_0 _sensoripaddress_1 _configurationcounter _status_longitudinalvelocity _status_longitudinalacceleration _status_lateralacceleration _status_yawrate _status_steeringangle _status_drivingdirection _status_characteristicspeed _status_radarstatus _status_voltagestatus _status_temperaturestatus _status_blockagestatus ))

(defmethod ars548_messages::Status
  (:init
   (&key
    ((:timestamp_nanoseconds __timestamp_nanoseconds) 0)
    ((:timestamp_seconds __timestamp_seconds) 0)
    ((:timestamp_syncstatus __timestamp_syncstatus) 0)
    ((:swversion_major __swversion_major) 0)
    ((:swversion_minor __swversion_minor) 0)
    ((:swversion_patch __swversion_patch) 0)
    ((:longitudinal __longitudinal) 0.0)
    ((:lateral __lateral) 0.0)
    ((:vertical __vertical) 0.0)
    ((:yaw __yaw) 0.0)
    ((:pitch __pitch) 0.0)
    ((:plugorientation __plugorientation) 0)
    ((:length __length) 0.0)
    ((:width __width) 0.0)
    ((:height __height) 0.0)
    ((:wheelbase __wheelbase) 0.0)
    ((:maximundistance __maximundistance) 0)
    ((:frequencyslot __frequencyslot) 0)
    ((:cycletime __cycletime) 0)
    ((:timeslot __timeslot) 0)
    ((:hcc __hcc) 0)
    ((:powersave_standstill __powersave_standstill) 0)
    ((:sensoripaddress_0 __sensoripaddress_0) 0)
    ((:sensoripaddress_1 __sensoripaddress_1) 0)
    ((:configurationcounter __configurationcounter) 0)
    ((:status_longitudinalvelocity __status_longitudinalvelocity) 0)
    ((:status_longitudinalacceleration __status_longitudinalacceleration) 0)
    ((:status_lateralacceleration __status_lateralacceleration) 0)
    ((:status_yawrate __status_yawrate) 0)
    ((:status_steeringangle __status_steeringangle) 0)
    ((:status_drivingdirection __status_drivingdirection) 0)
    ((:status_characteristicspeed __status_characteristicspeed) 0)
    ((:status_radarstatus __status_radarstatus) 0)
    ((:status_voltagestatus __status_voltagestatus) 0)
    ((:status_temperaturestatus __status_temperaturestatus) 0)
    ((:status_blockagestatus __status_blockagestatus) 0)
    )
   (send-super :init)
   (setq _timestamp_nanoseconds (round __timestamp_nanoseconds))
   (setq _timestamp_seconds (round __timestamp_seconds))
   (setq _timestamp_syncstatus (round __timestamp_syncstatus))
   (setq _swversion_major (round __swversion_major))
   (setq _swversion_minor (round __swversion_minor))
   (setq _swversion_patch (round __swversion_patch))
   (setq _longitudinal (float __longitudinal))
   (setq _lateral (float __lateral))
   (setq _vertical (float __vertical))
   (setq _yaw (float __yaw))
   (setq _pitch (float __pitch))
   (setq _plugorientation (round __plugorientation))
   (setq _length (float __length))
   (setq _width (float __width))
   (setq _height (float __height))
   (setq _wheelbase (float __wheelbase))
   (setq _maximundistance (round __maximundistance))
   (setq _frequencyslot (round __frequencyslot))
   (setq _cycletime (round __cycletime))
   (setq _timeslot (round __timeslot))
   (setq _hcc (round __hcc))
   (setq _powersave_standstill (round __powersave_standstill))
   (setq _sensoripaddress_0 (round __sensoripaddress_0))
   (setq _sensoripaddress_1 (round __sensoripaddress_1))
   (setq _configurationcounter (round __configurationcounter))
   (setq _status_longitudinalvelocity (round __status_longitudinalvelocity))
   (setq _status_longitudinalacceleration (round __status_longitudinalacceleration))
   (setq _status_lateralacceleration (round __status_lateralacceleration))
   (setq _status_yawrate (round __status_yawrate))
   (setq _status_steeringangle (round __status_steeringangle))
   (setq _status_drivingdirection (round __status_drivingdirection))
   (setq _status_characteristicspeed (round __status_characteristicspeed))
   (setq _status_radarstatus (round __status_radarstatus))
   (setq _status_voltagestatus (round __status_voltagestatus))
   (setq _status_temperaturestatus (round __status_temperaturestatus))
   (setq _status_blockagestatus (round __status_blockagestatus))
   self)
  (:timestamp_nanoseconds
   (&optional __timestamp_nanoseconds)
   (if __timestamp_nanoseconds (setq _timestamp_nanoseconds __timestamp_nanoseconds)) _timestamp_nanoseconds)
  (:timestamp_seconds
   (&optional __timestamp_seconds)
   (if __timestamp_seconds (setq _timestamp_seconds __timestamp_seconds)) _timestamp_seconds)
  (:timestamp_syncstatus
   (&optional __timestamp_syncstatus)
   (if __timestamp_syncstatus (setq _timestamp_syncstatus __timestamp_syncstatus)) _timestamp_syncstatus)
  (:swversion_major
   (&optional __swversion_major)
   (if __swversion_major (setq _swversion_major __swversion_major)) _swversion_major)
  (:swversion_minor
   (&optional __swversion_minor)
   (if __swversion_minor (setq _swversion_minor __swversion_minor)) _swversion_minor)
  (:swversion_patch
   (&optional __swversion_patch)
   (if __swversion_patch (setq _swversion_patch __swversion_patch)) _swversion_patch)
  (:longitudinal
   (&optional __longitudinal)
   (if __longitudinal (setq _longitudinal __longitudinal)) _longitudinal)
  (:lateral
   (&optional __lateral)
   (if __lateral (setq _lateral __lateral)) _lateral)
  (:vertical
   (&optional __vertical)
   (if __vertical (setq _vertical __vertical)) _vertical)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:plugorientation
   (&optional __plugorientation)
   (if __plugorientation (setq _plugorientation __plugorientation)) _plugorientation)
  (:length
   (&optional __length)
   (if __length (setq _length __length)) _length)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:wheelbase
   (&optional __wheelbase)
   (if __wheelbase (setq _wheelbase __wheelbase)) _wheelbase)
  (:maximundistance
   (&optional __maximundistance)
   (if __maximundistance (setq _maximundistance __maximundistance)) _maximundistance)
  (:frequencyslot
   (&optional __frequencyslot)
   (if __frequencyslot (setq _frequencyslot __frequencyslot)) _frequencyslot)
  (:cycletime
   (&optional __cycletime)
   (if __cycletime (setq _cycletime __cycletime)) _cycletime)
  (:timeslot
   (&optional __timeslot)
   (if __timeslot (setq _timeslot __timeslot)) _timeslot)
  (:hcc
   (&optional __hcc)
   (if __hcc (setq _hcc __hcc)) _hcc)
  (:powersave_standstill
   (&optional __powersave_standstill)
   (if __powersave_standstill (setq _powersave_standstill __powersave_standstill)) _powersave_standstill)
  (:sensoripaddress_0
   (&optional __sensoripaddress_0)
   (if __sensoripaddress_0 (setq _sensoripaddress_0 __sensoripaddress_0)) _sensoripaddress_0)
  (:sensoripaddress_1
   (&optional __sensoripaddress_1)
   (if __sensoripaddress_1 (setq _sensoripaddress_1 __sensoripaddress_1)) _sensoripaddress_1)
  (:configurationcounter
   (&optional __configurationcounter)
   (if __configurationcounter (setq _configurationcounter __configurationcounter)) _configurationcounter)
  (:status_longitudinalvelocity
   (&optional __status_longitudinalvelocity)
   (if __status_longitudinalvelocity (setq _status_longitudinalvelocity __status_longitudinalvelocity)) _status_longitudinalvelocity)
  (:status_longitudinalacceleration
   (&optional __status_longitudinalacceleration)
   (if __status_longitudinalacceleration (setq _status_longitudinalacceleration __status_longitudinalacceleration)) _status_longitudinalacceleration)
  (:status_lateralacceleration
   (&optional __status_lateralacceleration)
   (if __status_lateralacceleration (setq _status_lateralacceleration __status_lateralacceleration)) _status_lateralacceleration)
  (:status_yawrate
   (&optional __status_yawrate)
   (if __status_yawrate (setq _status_yawrate __status_yawrate)) _status_yawrate)
  (:status_steeringangle
   (&optional __status_steeringangle)
   (if __status_steeringangle (setq _status_steeringangle __status_steeringangle)) _status_steeringangle)
  (:status_drivingdirection
   (&optional __status_drivingdirection)
   (if __status_drivingdirection (setq _status_drivingdirection __status_drivingdirection)) _status_drivingdirection)
  (:status_characteristicspeed
   (&optional __status_characteristicspeed)
   (if __status_characteristicspeed (setq _status_characteristicspeed __status_characteristicspeed)) _status_characteristicspeed)
  (:status_radarstatus
   (&optional __status_radarstatus)
   (if __status_radarstatus (setq _status_radarstatus __status_radarstatus)) _status_radarstatus)
  (:status_voltagestatus
   (&optional __status_voltagestatus)
   (if __status_voltagestatus (setq _status_voltagestatus __status_voltagestatus)) _status_voltagestatus)
  (:status_temperaturestatus
   (&optional __status_temperaturestatus)
   (if __status_temperaturestatus (setq _status_temperaturestatus __status_temperaturestatus)) _status_temperaturestatus)
  (:status_blockagestatus
   (&optional __status_blockagestatus)
   (if __status_blockagestatus (setq _status_blockagestatus __status_blockagestatus)) _status_blockagestatus)
  (:serialization-length
   ()
   (+
    ;; uint32 _timestamp_nanoseconds
    4
    ;; uint32 _timestamp_seconds
    4
    ;; uint8 _timestamp_syncstatus
    1
    ;; uint8 _swversion_major
    1
    ;; uint8 _swversion_minor
    1
    ;; uint8 _swversion_patch
    1
    ;; float32 _longitudinal
    4
    ;; float32 _lateral
    4
    ;; float32 _vertical
    4
    ;; float32 _yaw
    4
    ;; float32 _pitch
    4
    ;; uint8 _plugorientation
    1
    ;; float32 _length
    4
    ;; float32 _width
    4
    ;; float32 _height
    4
    ;; float32 _wheelbase
    4
    ;; uint16 _maximundistance
    2
    ;; uint8 _frequencyslot
    1
    ;; uint8 _cycletime
    1
    ;; uint8 _timeslot
    1
    ;; uint8 _hcc
    1
    ;; uint8 _powersave_standstill
    1
    ;; uint32 _sensoripaddress_0
    4
    ;; uint32 _sensoripaddress_1
    4
    ;; uint8 _configurationcounter
    1
    ;; uint8 _status_longitudinalvelocity
    1
    ;; uint8 _status_longitudinalacceleration
    1
    ;; uint8 _status_lateralacceleration
    1
    ;; uint8 _status_yawrate
    1
    ;; uint8 _status_steeringangle
    1
    ;; uint8 _status_drivingdirection
    1
    ;; uint8 _status_characteristicspeed
    1
    ;; uint8 _status_radarstatus
    1
    ;; uint8 _status_voltagestatus
    1
    ;; uint8 _status_temperaturestatus
    1
    ;; uint8 _status_blockagestatus
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _timestamp_nanoseconds
       (write-long _timestamp_nanoseconds s)
     ;; uint32 _timestamp_seconds
       (write-long _timestamp_seconds s)
     ;; uint8 _timestamp_syncstatus
       (write-byte _timestamp_syncstatus s)
     ;; uint8 _swversion_major
       (write-byte _swversion_major s)
     ;; uint8 _swversion_minor
       (write-byte _swversion_minor s)
     ;; uint8 _swversion_patch
       (write-byte _swversion_patch s)
     ;; float32 _longitudinal
       (sys::poke _longitudinal (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _lateral
       (sys::poke _lateral (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vertical
       (sys::poke _vertical (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _plugorientation
       (write-byte _plugorientation s)
     ;; float32 _length
       (sys::poke _length (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _width
       (sys::poke _width (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _height
       (sys::poke _height (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _wheelbase
       (sys::poke _wheelbase (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint16 _maximundistance
       (write-word _maximundistance s)
     ;; uint8 _frequencyslot
       (write-byte _frequencyslot s)
     ;; uint8 _cycletime
       (write-byte _cycletime s)
     ;; uint8 _timeslot
       (write-byte _timeslot s)
     ;; uint8 _hcc
       (write-byte _hcc s)
     ;; uint8 _powersave_standstill
       (write-byte _powersave_standstill s)
     ;; uint32 _sensoripaddress_0
       (write-long _sensoripaddress_0 s)
     ;; uint32 _sensoripaddress_1
       (write-long _sensoripaddress_1 s)
     ;; uint8 _configurationcounter
       (write-byte _configurationcounter s)
     ;; uint8 _status_longitudinalvelocity
       (write-byte _status_longitudinalvelocity s)
     ;; uint8 _status_longitudinalacceleration
       (write-byte _status_longitudinalacceleration s)
     ;; uint8 _status_lateralacceleration
       (write-byte _status_lateralacceleration s)
     ;; uint8 _status_yawrate
       (write-byte _status_yawrate s)
     ;; uint8 _status_steeringangle
       (write-byte _status_steeringangle s)
     ;; uint8 _status_drivingdirection
       (write-byte _status_drivingdirection s)
     ;; uint8 _status_characteristicspeed
       (write-byte _status_characteristicspeed s)
     ;; uint8 _status_radarstatus
       (write-byte _status_radarstatus s)
     ;; uint8 _status_voltagestatus
       (write-byte _status_voltagestatus s)
     ;; uint8 _status_temperaturestatus
       (write-byte _status_temperaturestatus s)
     ;; uint8 _status_blockagestatus
       (write-byte _status_blockagestatus s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _timestamp_nanoseconds
     (setq _timestamp_nanoseconds (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _timestamp_seconds
     (setq _timestamp_seconds (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _timestamp_syncstatus
     (setq _timestamp_syncstatus (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _swversion_major
     (setq _swversion_major (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _swversion_minor
     (setq _swversion_minor (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _swversion_patch
     (setq _swversion_patch (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _longitudinal
     (setq _longitudinal (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _lateral
     (setq _lateral (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vertical
     (setq _vertical (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pitch
     (setq _pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _plugorientation
     (setq _plugorientation (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _length
     (setq _length (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _width
     (setq _width (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _height
     (setq _height (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _wheelbase
     (setq _wheelbase (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint16 _maximundistance
     (setq _maximundistance (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _frequencyslot
     (setq _frequencyslot (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _cycletime
     (setq _cycletime (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _timeslot
     (setq _timeslot (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _hcc
     (setq _hcc (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _powersave_standstill
     (setq _powersave_standstill (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint32 _sensoripaddress_0
     (setq _sensoripaddress_0 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _sensoripaddress_1
     (setq _sensoripaddress_1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _configurationcounter
     (setq _configurationcounter (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _status_longitudinalvelocity
     (setq _status_longitudinalvelocity (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _status_longitudinalacceleration
     (setq _status_longitudinalacceleration (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _status_lateralacceleration
     (setq _status_lateralacceleration (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _status_yawrate
     (setq _status_yawrate (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _status_steeringangle
     (setq _status_steeringangle (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _status_drivingdirection
     (setq _status_drivingdirection (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _status_characteristicspeed
     (setq _status_characteristicspeed (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _status_radarstatus
     (setq _status_radarstatus (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _status_voltagestatus
     (setq _status_voltagestatus (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _status_temperaturestatus
     (setq _status_temperaturestatus (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _status_blockagestatus
     (setq _status_blockagestatus (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ars548_messages::Status :md5sum-) "434403d6c9393e6a7279af521716619e")
(setf (get ars548_messages::Status :datatype-) "ars548_messages/Status")
(setf (get ars548_messages::Status :definition-)
      "uint32 timestamp_nanoseconds #Timestamp Nanoseconds
uint32 timestamp_seconds #Timestamp Seconds
uint8 timestamp_syncstatus #Timestamp Sync Status
uint8 swversion_major #Software version (major)
uint8 swversion_minor #Software version (minor)
uint8 swversion_patch #Software version (patch)
float32 longitudinal #Longitudinal sensor position (AUTOSAR)
float32 lateral #Lateral sensor position (AUTOSAR)
float32 vertical #Vertical sensor position (AUTOSAR)
float32 yaw #Sensor yaw angle (AUTOSAR)
float32 pitch #Sensor pitch angle (AUTOSAR)
uint8 plugorientation #Orientation of plug
float32 length #Vehicle length
float32 width #Vehicle width
float32 height #Vehicle height
float32 wheelbase #Vehicle wheelbase
uint16 maximundistance #Maximum detection distance
uint8 frequencyslot #Center frequency
uint8 cycletime #Cycle time
uint8 timeslot #Cycle offset
uint8 hcc #Country code
uint8 powersave_standstill #Power saving in standstill
uint32 sensoripaddress_0 #Sensor IP address
uint32 sensoripaddress_1 #Reserved
uint8 configurationcounter #Counter that counts up if new configuration has been received and accepted
uint8 status_longitudinalvelocity #Signals if current VDY is OK or timed out
uint8 status_longitudinalacceleration #Signals if current VDY is OK or timed out
uint8 status_lateralacceleration #Signals if current VDY is OK or timed out
uint8 status_yawrate #Signals if current VDY is OK or timed out
uint8 status_steeringangle #Signals if current VDY is OK or timed out
uint8 status_drivingdirection #Signals if current VDY is OK or timed out
uint8 status_characteristicspeed #(Unused) Signals if current VDY is OK or timed out.
uint8 status_radarstatus #Signals if Radar Status is OK
uint8 status_voltagestatus # Bitfield to report under- and overvoltage errors
uint8 status_temperaturestatus #Bitfield to report under- and overtemperature errors
uint8 status_blockagestatus #Current blockage state and blockage self test state.
")



(provide :ars548_messages/Status "434403d6c9393e6a7279af521716619e")


