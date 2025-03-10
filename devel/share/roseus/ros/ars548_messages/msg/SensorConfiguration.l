;; Auto-generated. Do not edit!


(when (boundp 'ars548_messages::SensorConfiguration)
  (if (not (find-package "ARS548_MESSAGES"))
    (make-package "ARS548_MESSAGES"))
  (shadow 'SensorConfiguration (find-package "ARS548_MESSAGES")))
(unless (find-package "ARS548_MESSAGES::SENSORCONFIGURATION")
  (make-package "ARS548_MESSAGES::SENSORCONFIGURATION"))

(in-package "ROS")
;;//! \htmlinclude SensorConfiguration.msg.html


(defclass ars548_messages::SensorConfiguration
  :super ros::object
  :slots (_longitudinal _lateral _vertical _yaw _pitch _plugorientation _length _width _height _wheelbase _maximumdistance _frequencslot _cycletime _timeslot _hcc _powersave_standstill _sensoripaddress_0 _sensoripaddress_1 _newsensormounting _newvehicleparameters _newradarparameters _newnetworkconfiguration ))

(defmethod ars548_messages::SensorConfiguration
  (:init
   (&key
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
    ((:maximumdistance __maximumdistance) 0)
    ((:frequencslot __frequencslot) 0)
    ((:cycletime __cycletime) 0)
    ((:timeslot __timeslot) 0)
    ((:hcc __hcc) 0)
    ((:powersave_standstill __powersave_standstill) 0)
    ((:sensoripaddress_0 __sensoripaddress_0) 0)
    ((:sensoripaddress_1 __sensoripaddress_1) 0)
    ((:newsensormounting __newsensormounting) 0)
    ((:newvehicleparameters __newvehicleparameters) 0)
    ((:newradarparameters __newradarparameters) 0)
    ((:newnetworkconfiguration __newnetworkconfiguration) 0)
    )
   (send-super :init)
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
   (setq _maximumdistance (round __maximumdistance))
   (setq _frequencslot (round __frequencslot))
   (setq _cycletime (round __cycletime))
   (setq _timeslot (round __timeslot))
   (setq _hcc (round __hcc))
   (setq _powersave_standstill (round __powersave_standstill))
   (setq _sensoripaddress_0 (round __sensoripaddress_0))
   (setq _sensoripaddress_1 (round __sensoripaddress_1))
   (setq _newsensormounting (round __newsensormounting))
   (setq _newvehicleparameters (round __newvehicleparameters))
   (setq _newradarparameters (round __newradarparameters))
   (setq _newnetworkconfiguration (round __newnetworkconfiguration))
   self)
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
  (:maximumdistance
   (&optional __maximumdistance)
   (if __maximumdistance (setq _maximumdistance __maximumdistance)) _maximumdistance)
  (:frequencslot
   (&optional __frequencslot)
   (if __frequencslot (setq _frequencslot __frequencslot)) _frequencslot)
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
  (:newsensormounting
   (&optional __newsensormounting)
   (if __newsensormounting (setq _newsensormounting __newsensormounting)) _newsensormounting)
  (:newvehicleparameters
   (&optional __newvehicleparameters)
   (if __newvehicleparameters (setq _newvehicleparameters __newvehicleparameters)) _newvehicleparameters)
  (:newradarparameters
   (&optional __newradarparameters)
   (if __newradarparameters (setq _newradarparameters __newradarparameters)) _newradarparameters)
  (:newnetworkconfiguration
   (&optional __newnetworkconfiguration)
   (if __newnetworkconfiguration (setq _newnetworkconfiguration __newnetworkconfiguration)) _newnetworkconfiguration)
  (:serialization-length
   ()
   (+
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
    ;; uint16 _maximumdistance
    2
    ;; uint8 _frequencslot
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
    ;; uint8 _newsensormounting
    1
    ;; uint8 _newvehicleparameters
    1
    ;; uint8 _newradarparameters
    1
    ;; uint8 _newnetworkconfiguration
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
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
     ;; uint16 _maximumdistance
       (write-word _maximumdistance s)
     ;; uint8 _frequencslot
       (write-byte _frequencslot s)
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
     ;; uint8 _newsensormounting
       (write-byte _newsensormounting s)
     ;; uint8 _newvehicleparameters
       (write-byte _newvehicleparameters s)
     ;; uint8 _newradarparameters
       (write-byte _newradarparameters s)
     ;; uint8 _newnetworkconfiguration
       (write-byte _newnetworkconfiguration s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
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
   ;; uint16 _maximumdistance
     (setq _maximumdistance (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _frequencslot
     (setq _frequencslot (sys::peek buf ptr- :char)) (incf ptr- 1)
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
   ;; uint8 _newsensormounting
     (setq _newsensormounting (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _newvehicleparameters
     (setq _newvehicleparameters (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _newradarparameters
     (setq _newradarparameters (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _newnetworkconfiguration
     (setq _newnetworkconfiguration (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ars548_messages::SensorConfiguration :md5sum-) "431839fe505be3082a74c763bbc714ec")
(setf (get ars548_messages::SensorConfiguration :datatype-) "ars548_messages/SensorConfiguration")
(setf (get ars548_messages::SensorConfiguration :definition-)
      "float32 longitudinal #Longitudinal sensor position (AUTOSAR)
float32 lateral #Lateral sensor position (AUTOSAR)
float32 vertical #Vertical sensor position (AUTOSAR)
float32 yaw #Sensor yaw angle (AUTOSAR)
float32 pitch #Sensor pitch angle (AUTOSAR)
uint8 plugorientation #Orientation of plug
float32 length #Vehicle length
float32 width #Vehicle width
float32 height #Vehicle height
float32 wheelbase #Vehicle wheelbase
uint16 maximumdistance #Maximum detection distance
uint8 frequencslot #Center frequency (if MaximumDistance < 190 m only Mid can be selected)
uint8 cycletime #Cycle time
uint8 timeslot #Cycle offset
uint8 hcc #Country code
uint8 powersave_standstill #Power saving in standstill
uint32 sensoripaddress_0 #Sensor IP address
uint32 sensoripaddress_1 #Reserved (Configure as 2852025457 or 169.254.116.113)
uint8 newsensormounting #Flag if new sensor mounting position shall be configured
uint8 newvehicleparameters #Flag if new vehicle parameters position shall be configured
uint8 newradarparameters #Flag if new radar parameter shall be configured
uint8 newnetworkconfiguration # Flag if new IP address shall be configured

")



(provide :ars548_messages/SensorConfiguration "431839fe505be3082a74c763bbc714ec")


