;; Auto-generated. Do not edit!


(when (boundp 'ars548_messages::AccelerationLateralCoG)
  (if (not (find-package "ARS548_MESSAGES"))
    (make-package "ARS548_MESSAGES"))
  (shadow 'AccelerationLateralCoG (find-package "ARS548_MESSAGES")))
(unless (find-package "ARS548_MESSAGES::ACCELERATIONLATERALCOG")
  (make-package "ARS548_MESSAGES::ACCELERATIONLATERALCOG"))

(in-package "ROS")
;;//! \htmlinclude AccelerationLateralCoG.msg.html


(defclass ars548_messages::AccelerationLateralCoG
  :super ros::object
  :slots (_accelerationlateralerramp _accelerationlateralerramp_invalidflag _qualifieraccelerationlateral _accelerationlateral _accelerationlateral_invalidflag _accelerationlateraleventdataqualifier ))

(defmethod ars548_messages::AccelerationLateralCoG
  (:init
   (&key
    ((:accelerationlateralerramp __accelerationlateralerramp) 0.0)
    ((:accelerationlateralerramp_invalidflag __accelerationlateralerramp_invalidflag) 0)
    ((:qualifieraccelerationlateral __qualifieraccelerationlateral) 0)
    ((:accelerationlateral __accelerationlateral) 0.0)
    ((:accelerationlateral_invalidflag __accelerationlateral_invalidflag) 0)
    ((:accelerationlateraleventdataqualifier __accelerationlateraleventdataqualifier) 0)
    )
   (send-super :init)
   (setq _accelerationlateralerramp (float __accelerationlateralerramp))
   (setq _accelerationlateralerramp_invalidflag (round __accelerationlateralerramp_invalidflag))
   (setq _qualifieraccelerationlateral (round __qualifieraccelerationlateral))
   (setq _accelerationlateral (float __accelerationlateral))
   (setq _accelerationlateral_invalidflag (round __accelerationlateral_invalidflag))
   (setq _accelerationlateraleventdataqualifier (round __accelerationlateraleventdataqualifier))
   self)
  (:accelerationlateralerramp
   (&optional __accelerationlateralerramp)
   (if __accelerationlateralerramp (setq _accelerationlateralerramp __accelerationlateralerramp)) _accelerationlateralerramp)
  (:accelerationlateralerramp_invalidflag
   (&optional __accelerationlateralerramp_invalidflag)
   (if __accelerationlateralerramp_invalidflag (setq _accelerationlateralerramp_invalidflag __accelerationlateralerramp_invalidflag)) _accelerationlateralerramp_invalidflag)
  (:qualifieraccelerationlateral
   (&optional __qualifieraccelerationlateral)
   (if __qualifieraccelerationlateral (setq _qualifieraccelerationlateral __qualifieraccelerationlateral)) _qualifieraccelerationlateral)
  (:accelerationlateral
   (&optional __accelerationlateral)
   (if __accelerationlateral (setq _accelerationlateral __accelerationlateral)) _accelerationlateral)
  (:accelerationlateral_invalidflag
   (&optional __accelerationlateral_invalidflag)
   (if __accelerationlateral_invalidflag (setq _accelerationlateral_invalidflag __accelerationlateral_invalidflag)) _accelerationlateral_invalidflag)
  (:accelerationlateraleventdataqualifier
   (&optional __accelerationlateraleventdataqualifier)
   (if __accelerationlateraleventdataqualifier (setq _accelerationlateraleventdataqualifier __accelerationlateraleventdataqualifier)) _accelerationlateraleventdataqualifier)
  (:serialization-length
   ()
   (+
    ;; float32 _accelerationlateralerramp
    4
    ;; uint8 _accelerationlateralerramp_invalidflag
    1
    ;; uint8 _qualifieraccelerationlateral
    1
    ;; float32 _accelerationlateral
    4
    ;; uint8 _accelerationlateral_invalidflag
    1
    ;; uint8 _accelerationlateraleventdataqualifier
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _accelerationlateralerramp
       (sys::poke _accelerationlateralerramp (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _accelerationlateralerramp_invalidflag
       (write-byte _accelerationlateralerramp_invalidflag s)
     ;; uint8 _qualifieraccelerationlateral
       (write-byte _qualifieraccelerationlateral s)
     ;; float32 _accelerationlateral
       (sys::poke _accelerationlateral (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _accelerationlateral_invalidflag
       (write-byte _accelerationlateral_invalidflag s)
     ;; uint8 _accelerationlateraleventdataqualifier
       (write-byte _accelerationlateraleventdataqualifier s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _accelerationlateralerramp
     (setq _accelerationlateralerramp (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _accelerationlateralerramp_invalidflag
     (setq _accelerationlateralerramp_invalidflag (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _qualifieraccelerationlateral
     (setq _qualifieraccelerationlateral (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _accelerationlateral
     (setq _accelerationlateral (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _accelerationlateral_invalidflag
     (setq _accelerationlateral_invalidflag (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _accelerationlateraleventdataqualifier
     (setq _accelerationlateraleventdataqualifier (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ars548_messages::AccelerationLateralCoG :md5sum-) "9d1e6bf3d430a2b77911a476ca617783")
(setf (get ars548_messages::AccelerationLateralCoG :datatype-) "ars548_messages/AccelerationLateralCoG")
(setf (get ars548_messages::AccelerationLateralCoG :definition-)
      "float32 accelerationlateralerramp #(Unused) Error Amplitude of Lateral Acceleration 
uint8 accelerationlateralerramp_invalidflag #(Unused) Invalid Flags AccelLatErrAmp  
uint8 qualifieraccelerationlateral #(Unused) Lateral Acceleration Qualifier 
float32 accelerationlateral #Lateral Acceleration
uint8 accelerationlateral_invalidflag #(Unused) Invalid Flag Lateral Acceleration 
uint8 accelerationlateraleventdataqualifier #(Unused) Event Data Qualifier Lateral Acceleration 
")



(provide :ars548_messages/AccelerationLateralCoG "9d1e6bf3d430a2b77911a476ca617783")


