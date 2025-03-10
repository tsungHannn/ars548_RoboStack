;; Auto-generated. Do not edit!


(when (boundp 'ars548_messages::SteeringAngleFrontAxle)
  (if (not (find-package "ARS548_MESSAGES"))
    (make-package "ARS548_MESSAGES"))
  (shadow 'SteeringAngleFrontAxle (find-package "ARS548_MESSAGES")))
(unless (find-package "ARS548_MESSAGES::STEERINGANGLEFRONTAXLE")
  (make-package "ARS548_MESSAGES::STEERINGANGLEFRONTAXLE"))

(in-package "ROS")
;;//! \htmlinclude SteeringAngleFrontAxle.msg.html


(defclass ars548_messages::SteeringAngleFrontAxle
  :super ros::object
  :slots (_qualifiersteeringanglefrontaxle _steeringanglefrontaxleerramp _steeringanglefrontaxleerramp_invalidflag _steeringanglefrontaxle _steeringanglefrontaxle_invalidflag _steeringanglefrontaxleeventdataqualifier ))

(defmethod ars548_messages::SteeringAngleFrontAxle
  (:init
   (&key
    ((:qualifiersteeringanglefrontaxle __qualifiersteeringanglefrontaxle) 0)
    ((:steeringanglefrontaxleerramp __steeringanglefrontaxleerramp) 0.0)
    ((:steeringanglefrontaxleerramp_invalidflag __steeringanglefrontaxleerramp_invalidflag) 0)
    ((:steeringanglefrontaxle __steeringanglefrontaxle) 0.0)
    ((:steeringanglefrontaxle_invalidflag __steeringanglefrontaxle_invalidflag) 0)
    ((:steeringanglefrontaxleeventdataqualifier __steeringanglefrontaxleeventdataqualifier) 0)
    )
   (send-super :init)
   (setq _qualifiersteeringanglefrontaxle (round __qualifiersteeringanglefrontaxle))
   (setq _steeringanglefrontaxleerramp (float __steeringanglefrontaxleerramp))
   (setq _steeringanglefrontaxleerramp_invalidflag (round __steeringanglefrontaxleerramp_invalidflag))
   (setq _steeringanglefrontaxle (float __steeringanglefrontaxle))
   (setq _steeringanglefrontaxle_invalidflag (round __steeringanglefrontaxle_invalidflag))
   (setq _steeringanglefrontaxleeventdataqualifier (round __steeringanglefrontaxleeventdataqualifier))
   self)
  (:qualifiersteeringanglefrontaxle
   (&optional __qualifiersteeringanglefrontaxle)
   (if __qualifiersteeringanglefrontaxle (setq _qualifiersteeringanglefrontaxle __qualifiersteeringanglefrontaxle)) _qualifiersteeringanglefrontaxle)
  (:steeringanglefrontaxleerramp
   (&optional __steeringanglefrontaxleerramp)
   (if __steeringanglefrontaxleerramp (setq _steeringanglefrontaxleerramp __steeringanglefrontaxleerramp)) _steeringanglefrontaxleerramp)
  (:steeringanglefrontaxleerramp_invalidflag
   (&optional __steeringanglefrontaxleerramp_invalidflag)
   (if __steeringanglefrontaxleerramp_invalidflag (setq _steeringanglefrontaxleerramp_invalidflag __steeringanglefrontaxleerramp_invalidflag)) _steeringanglefrontaxleerramp_invalidflag)
  (:steeringanglefrontaxle
   (&optional __steeringanglefrontaxle)
   (if __steeringanglefrontaxle (setq _steeringanglefrontaxle __steeringanglefrontaxle)) _steeringanglefrontaxle)
  (:steeringanglefrontaxle_invalidflag
   (&optional __steeringanglefrontaxle_invalidflag)
   (if __steeringanglefrontaxle_invalidflag (setq _steeringanglefrontaxle_invalidflag __steeringanglefrontaxle_invalidflag)) _steeringanglefrontaxle_invalidflag)
  (:steeringanglefrontaxleeventdataqualifier
   (&optional __steeringanglefrontaxleeventdataqualifier)
   (if __steeringanglefrontaxleeventdataqualifier (setq _steeringanglefrontaxleeventdataqualifier __steeringanglefrontaxleeventdataqualifier)) _steeringanglefrontaxleeventdataqualifier)
  (:serialization-length
   ()
   (+
    ;; uint8 _qualifiersteeringanglefrontaxle
    1
    ;; float32 _steeringanglefrontaxleerramp
    4
    ;; uint8 _steeringanglefrontaxleerramp_invalidflag
    1
    ;; float32 _steeringanglefrontaxle
    4
    ;; uint8 _steeringanglefrontaxle_invalidflag
    1
    ;; uint8 _steeringanglefrontaxleeventdataqualifier
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _qualifiersteeringanglefrontaxle
       (write-byte _qualifiersteeringanglefrontaxle s)
     ;; float32 _steeringanglefrontaxleerramp
       (sys::poke _steeringanglefrontaxleerramp (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _steeringanglefrontaxleerramp_invalidflag
       (write-byte _steeringanglefrontaxleerramp_invalidflag s)
     ;; float32 _steeringanglefrontaxle
       (sys::poke _steeringanglefrontaxle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _steeringanglefrontaxle_invalidflag
       (write-byte _steeringanglefrontaxle_invalidflag s)
     ;; uint8 _steeringanglefrontaxleeventdataqualifier
       (write-byte _steeringanglefrontaxleeventdataqualifier s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _qualifiersteeringanglefrontaxle
     (setq _qualifiersteeringanglefrontaxle (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _steeringanglefrontaxleerramp
     (setq _steeringanglefrontaxleerramp (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _steeringanglefrontaxleerramp_invalidflag
     (setq _steeringanglefrontaxleerramp_invalidflag (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _steeringanglefrontaxle
     (setq _steeringanglefrontaxle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _steeringanglefrontaxle_invalidflag
     (setq _steeringanglefrontaxle_invalidflag (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _steeringanglefrontaxleeventdataqualifier
     (setq _steeringanglefrontaxleeventdataqualifier (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ars548_messages::SteeringAngleFrontAxle :md5sum-) "165f91e8ecdcab06db8015b2dbf74ced")
(setf (get ars548_messages::SteeringAngleFrontAxle :datatype-) "ars548_messages/SteeringAngleFrontAxle")
(setf (get ars548_messages::SteeringAngleFrontAxle :definition-)
      "uint8 qualifiersteeringanglefrontaxle #(unused) Steering angle front axle qualifier
float32 steeringanglefrontaxleerramp #(unused) Error amplitude of steering angle front axle
uint8 steeringanglefrontaxleerramp_invalidflag #(unused) Invalid flag steering angle front axle errAmp
float32 steeringanglefrontaxle #Steering angle front axle
uint8 steeringanglefrontaxle_invalidflag #(unused) Invalid flag steeting angle front axle
uint8 steeringanglefrontaxleeventdataqualifier #(unused) Event data qualifier steering angle front axle
")



(provide :ars548_messages/SteeringAngleFrontAxle "165f91e8ecdcab06db8015b2dbf74ced")


