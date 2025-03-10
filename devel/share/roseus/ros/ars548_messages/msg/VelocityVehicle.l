;; Auto-generated. Do not edit!


(when (boundp 'ars548_messages::VelocityVehicle)
  (if (not (find-package "ARS548_MESSAGES"))
    (make-package "ARS548_MESSAGES"))
  (shadow 'VelocityVehicle (find-package "ARS548_MESSAGES")))
(unless (find-package "ARS548_MESSAGES::VELOCITYVEHICLE")
  (make-package "ARS548_MESSAGES::VELOCITYVEHICLE"))

(in-package "ROS")
;;//! \htmlinclude VelocityVehicle.msg.html


(defclass ars548_messages::VelocityVehicle
  :super ros::object
  :slots (_statusvelocitynearstandstill _qualifiervelocityvehicle _velocityvehicleeventdataqualifier _velocityvehicle _velocityvehicle_invalidflag ))

(defmethod ars548_messages::VelocityVehicle
  (:init
   (&key
    ((:statusvelocitynearstandstill __statusvelocitynearstandstill) 0)
    ((:qualifiervelocityvehicle __qualifiervelocityvehicle) 0)
    ((:velocityvehicleeventdataqualifier __velocityvehicleeventdataqualifier) 0)
    ((:velocityvehicle __velocityvehicle) 0.0)
    ((:velocityvehicle_invalidflag __velocityvehicle_invalidflag) 0)
    )
   (send-super :init)
   (setq _statusvelocitynearstandstill (round __statusvelocitynearstandstill))
   (setq _qualifiervelocityvehicle (round __qualifiervelocityvehicle))
   (setq _velocityvehicleeventdataqualifier (round __velocityvehicleeventdataqualifier))
   (setq _velocityvehicle (float __velocityvehicle))
   (setq _velocityvehicle_invalidflag (round __velocityvehicle_invalidflag))
   self)
  (:statusvelocitynearstandstill
   (&optional __statusvelocitynearstandstill)
   (if __statusvelocitynearstandstill (setq _statusvelocitynearstandstill __statusvelocitynearstandstill)) _statusvelocitynearstandstill)
  (:qualifiervelocityvehicle
   (&optional __qualifiervelocityvehicle)
   (if __qualifiervelocityvehicle (setq _qualifiervelocityvehicle __qualifiervelocityvehicle)) _qualifiervelocityvehicle)
  (:velocityvehicleeventdataqualifier
   (&optional __velocityvehicleeventdataqualifier)
   (if __velocityvehicleeventdataqualifier (setq _velocityvehicleeventdataqualifier __velocityvehicleeventdataqualifier)) _velocityvehicleeventdataqualifier)
  (:velocityvehicle
   (&optional __velocityvehicle)
   (if __velocityvehicle (setq _velocityvehicle __velocityvehicle)) _velocityvehicle)
  (:velocityvehicle_invalidflag
   (&optional __velocityvehicle_invalidflag)
   (if __velocityvehicle_invalidflag (setq _velocityvehicle_invalidflag __velocityvehicle_invalidflag)) _velocityvehicle_invalidflag)
  (:serialization-length
   ()
   (+
    ;; uint8 _statusvelocitynearstandstill
    1
    ;; uint8 _qualifiervelocityvehicle
    1
    ;; uint8 _velocityvehicleeventdataqualifier
    1
    ;; float32 _velocityvehicle
    4
    ;; uint8 _velocityvehicle_invalidflag
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _statusvelocitynearstandstill
       (write-byte _statusvelocitynearstandstill s)
     ;; uint8 _qualifiervelocityvehicle
       (write-byte _qualifiervelocityvehicle s)
     ;; uint8 _velocityvehicleeventdataqualifier
       (write-byte _velocityvehicleeventdataqualifier s)
     ;; float32 _velocityvehicle
       (sys::poke _velocityvehicle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _velocityvehicle_invalidflag
       (write-byte _velocityvehicle_invalidflag s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _statusvelocitynearstandstill
     (setq _statusvelocitynearstandstill (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _qualifiervelocityvehicle
     (setq _qualifiervelocityvehicle (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _velocityvehicleeventdataqualifier
     (setq _velocityvehicleeventdataqualifier (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _velocityvehicle
     (setq _velocityvehicle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _velocityvehicle_invalidflag
     (setq _velocityvehicle_invalidflag (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ars548_messages::VelocityVehicle :md5sum-) "e3ed8fe15e904859bdc21697bcec872a")
(setf (get ars548_messages::VelocityVehicle :datatype-) "ars548_messages/VelocityVehicle")
(setf (get ars548_messages::VelocityVehicle :definition-)
      "uint8 statusvelocitynearstandstill #(unused) Velocity near standstill status
uint8 qualifiervelocityvehicle  #(unused) VelovityVehicle qualifier
uint8 velocityvehicleeventdataqualifier #(unused) Event data qualifier VelocityVehicle
float32 velocityvehicle # VelocityVehicle
uint8 velocityvehicle_invalidflag #(unused) Invalid flag VelocityVehicle
")



(provide :ars548_messages/VelocityVehicle "e3ed8fe15e904859bdc21697bcec872a")


