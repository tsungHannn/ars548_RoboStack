;; Auto-generated. Do not edit!


(when (boundp 'ars548_messages::AccelerationLongitudinalCoG)
  (if (not (find-package "ARS548_MESSAGES"))
    (make-package "ARS548_MESSAGES"))
  (shadow 'AccelerationLongitudinalCoG (find-package "ARS548_MESSAGES")))
(unless (find-package "ARS548_MESSAGES::ACCELERATIONLONGITUDINALCOG")
  (make-package "ARS548_MESSAGES::ACCELERATIONLONGITUDINALCOG"))

(in-package "ROS")
;;//! \htmlinclude AccelerationLongitudinalCoG.msg.html


(defclass ars548_messages::AccelerationLongitudinalCoG
  :super ros::object
  :slots (_accelerationlongitudinalerramp _accelerationlongitudinalerramp_invalidflag _qualifieraccelerationlongitudinal _accelerationlongitudinal _accelerationlongitudinal_invalidflag _accelerationlongitudinaleventdataqualifier ))

(defmethod ars548_messages::AccelerationLongitudinalCoG
  (:init
   (&key
    ((:accelerationlongitudinalerramp __accelerationlongitudinalerramp) 0.0)
    ((:accelerationlongitudinalerramp_invalidflag __accelerationlongitudinalerramp_invalidflag) 0)
    ((:qualifieraccelerationlongitudinal __qualifieraccelerationlongitudinal) 0)
    ((:accelerationlongitudinal __accelerationlongitudinal) 0.0)
    ((:accelerationlongitudinal_invalidflag __accelerationlongitudinal_invalidflag) 0)
    ((:accelerationlongitudinaleventdataqualifier __accelerationlongitudinaleventdataqualifier) 0)
    )
   (send-super :init)
   (setq _accelerationlongitudinalerramp (float __accelerationlongitudinalerramp))
   (setq _accelerationlongitudinalerramp_invalidflag (round __accelerationlongitudinalerramp_invalidflag))
   (setq _qualifieraccelerationlongitudinal (round __qualifieraccelerationlongitudinal))
   (setq _accelerationlongitudinal (float __accelerationlongitudinal))
   (setq _accelerationlongitudinal_invalidflag (round __accelerationlongitudinal_invalidflag))
   (setq _accelerationlongitudinaleventdataqualifier (round __accelerationlongitudinaleventdataqualifier))
   self)
  (:accelerationlongitudinalerramp
   (&optional __accelerationlongitudinalerramp)
   (if __accelerationlongitudinalerramp (setq _accelerationlongitudinalerramp __accelerationlongitudinalerramp)) _accelerationlongitudinalerramp)
  (:accelerationlongitudinalerramp_invalidflag
   (&optional __accelerationlongitudinalerramp_invalidflag)
   (if __accelerationlongitudinalerramp_invalidflag (setq _accelerationlongitudinalerramp_invalidflag __accelerationlongitudinalerramp_invalidflag)) _accelerationlongitudinalerramp_invalidflag)
  (:qualifieraccelerationlongitudinal
   (&optional __qualifieraccelerationlongitudinal)
   (if __qualifieraccelerationlongitudinal (setq _qualifieraccelerationlongitudinal __qualifieraccelerationlongitudinal)) _qualifieraccelerationlongitudinal)
  (:accelerationlongitudinal
   (&optional __accelerationlongitudinal)
   (if __accelerationlongitudinal (setq _accelerationlongitudinal __accelerationlongitudinal)) _accelerationlongitudinal)
  (:accelerationlongitudinal_invalidflag
   (&optional __accelerationlongitudinal_invalidflag)
   (if __accelerationlongitudinal_invalidflag (setq _accelerationlongitudinal_invalidflag __accelerationlongitudinal_invalidflag)) _accelerationlongitudinal_invalidflag)
  (:accelerationlongitudinaleventdataqualifier
   (&optional __accelerationlongitudinaleventdataqualifier)
   (if __accelerationlongitudinaleventdataqualifier (setq _accelerationlongitudinaleventdataqualifier __accelerationlongitudinaleventdataqualifier)) _accelerationlongitudinaleventdataqualifier)
  (:serialization-length
   ()
   (+
    ;; float32 _accelerationlongitudinalerramp
    4
    ;; uint8 _accelerationlongitudinalerramp_invalidflag
    1
    ;; uint8 _qualifieraccelerationlongitudinal
    1
    ;; float32 _accelerationlongitudinal
    4
    ;; uint8 _accelerationlongitudinal_invalidflag
    1
    ;; uint8 _accelerationlongitudinaleventdataqualifier
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _accelerationlongitudinalerramp
       (sys::poke _accelerationlongitudinalerramp (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _accelerationlongitudinalerramp_invalidflag
       (write-byte _accelerationlongitudinalerramp_invalidflag s)
     ;; uint8 _qualifieraccelerationlongitudinal
       (write-byte _qualifieraccelerationlongitudinal s)
     ;; float32 _accelerationlongitudinal
       (sys::poke _accelerationlongitudinal (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _accelerationlongitudinal_invalidflag
       (write-byte _accelerationlongitudinal_invalidflag s)
     ;; uint8 _accelerationlongitudinaleventdataqualifier
       (write-byte _accelerationlongitudinaleventdataqualifier s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _accelerationlongitudinalerramp
     (setq _accelerationlongitudinalerramp (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _accelerationlongitudinalerramp_invalidflag
     (setq _accelerationlongitudinalerramp_invalidflag (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _qualifieraccelerationlongitudinal
     (setq _qualifieraccelerationlongitudinal (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _accelerationlongitudinal
     (setq _accelerationlongitudinal (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _accelerationlongitudinal_invalidflag
     (setq _accelerationlongitudinal_invalidflag (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _accelerationlongitudinaleventdataqualifier
     (setq _accelerationlongitudinaleventdataqualifier (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ars548_messages::AccelerationLongitudinalCoG :md5sum-) "0eafbbce434bfbd2d5decf0da9141fd7")
(setf (get ars548_messages::AccelerationLongitudinalCoG :datatype-) "ars548_messages/AccelerationLongitudinalCoG")
(setf (get ars548_messages::AccelerationLongitudinalCoG :definition-)
      "float32 accelerationlongitudinalerramp #(Unused) Error amplitude of longitudinal acceleration
uint8 accelerationlongitudinalerramp_invalidflag #(Unused) Invalid Flags AccelLongErrAmp 
uint8 qualifieraccelerationlongitudinal #(Unused) Longitudinal Acceleration Qualifier 
float32 accelerationlongitudinal #Longitudinal Acceleration
uint8 accelerationlongitudinal_invalidflag #(Unused) Invalid Flag Longitudinal Acceleration 
uint8 accelerationlongitudinaleventdataqualifier #(Unused) Event Data Qualifier Longitudinal Acceleration 


")



(provide :ars548_messages/AccelerationLongitudinalCoG "0eafbbce434bfbd2d5decf0da9141fd7")


