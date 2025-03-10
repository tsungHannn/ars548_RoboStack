;; Auto-generated. Do not edit!


(when (boundp 'ars548_messages::DrivingDirection)
  (if (not (find-package "ARS548_MESSAGES"))
    (make-package "ARS548_MESSAGES"))
  (shadow 'DrivingDirection (find-package "ARS548_MESSAGES")))
(unless (find-package "ARS548_MESSAGES::DRIVINGDIRECTION")
  (make-package "ARS548_MESSAGES::DRIVINGDIRECTION"))

(in-package "ROS")
;;//! \htmlinclude DrivingDirection.msg.html


(defclass ars548_messages::DrivingDirection
  :super ros::object
  :slots (_drivingdirectionunconfirmed _drivingdirectionconfirmed ))

(defmethod ars548_messages::DrivingDirection
  (:init
   (&key
    ((:drivingdirectionunconfirmed __drivingdirectionunconfirmed) 0)
    ((:drivingdirectionconfirmed __drivingdirectionconfirmed) 0)
    )
   (send-super :init)
   (setq _drivingdirectionunconfirmed (round __drivingdirectionunconfirmed))
   (setq _drivingdirectionconfirmed (round __drivingdirectionconfirmed))
   self)
  (:drivingdirectionunconfirmed
   (&optional __drivingdirectionunconfirmed)
   (if __drivingdirectionunconfirmed (setq _drivingdirectionunconfirmed __drivingdirectionunconfirmed)) _drivingdirectionunconfirmed)
  (:drivingdirectionconfirmed
   (&optional __drivingdirectionconfirmed)
   (if __drivingdirectionconfirmed (setq _drivingdirectionconfirmed __drivingdirectionconfirmed)) _drivingdirectionconfirmed)
  (:serialization-length
   ()
   (+
    ;; uint8 _drivingdirectionunconfirmed
    1
    ;; uint8 _drivingdirectionconfirmed
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _drivingdirectionunconfirmed
       (write-byte _drivingdirectionunconfirmed s)
     ;; uint8 _drivingdirectionconfirmed
       (write-byte _drivingdirectionconfirmed s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _drivingdirectionunconfirmed
     (setq _drivingdirectionunconfirmed (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _drivingdirectionconfirmed
     (setq _drivingdirectionconfirmed (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ars548_messages::DrivingDirection :md5sum-) "ca13186e93f09072774d4d57d6065639")
(setf (get ars548_messages::DrivingDirection :datatype-) "ars548_messages/DrivingDirection")
(setf (get ars548_messages::DrivingDirection :definition-)
      "uint8 drivingdirectionunconfirmed #(unused) Unconfirmed driving direction
uint8 drivingdirectionconfirmed # Confirmed driving direction
")



(provide :ars548_messages/DrivingDirection "ca13186e93f09072774d4d57d6065639")


