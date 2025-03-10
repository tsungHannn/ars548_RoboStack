;; Auto-generated. Do not edit!


(when (boundp 'ars548_messages::CharacteristicSpeed)
  (if (not (find-package "ARS548_MESSAGES"))
    (make-package "ARS548_MESSAGES"))
  (shadow 'CharacteristicSpeed (find-package "ARS548_MESSAGES")))
(unless (find-package "ARS548_MESSAGES::CHARACTERISTICSPEED")
  (make-package "ARS548_MESSAGES::CHARACTERISTICSPEED"))

(in-package "ROS")
;;//! \htmlinclude CharacteristicSpeed.msg.html


(defclass ars548_messages::CharacteristicSpeed
  :super ros::object
  :slots (_characteristicspeederramp _qualifiercharacteristicspeed _characteristicspeed ))

(defmethod ars548_messages::CharacteristicSpeed
  (:init
   (&key
    ((:characteristicspeederramp __characteristicspeederramp) 0)
    ((:qualifiercharacteristicspeed __qualifiercharacteristicspeed) 0)
    ((:characteristicspeed __characteristicspeed) 0)
    )
   (send-super :init)
   (setq _characteristicspeederramp (round __characteristicspeederramp))
   (setq _qualifiercharacteristicspeed (round __qualifiercharacteristicspeed))
   (setq _characteristicspeed (round __characteristicspeed))
   self)
  (:characteristicspeederramp
   (&optional __characteristicspeederramp)
   (if __characteristicspeederramp (setq _characteristicspeederramp __characteristicspeederramp)) _characteristicspeederramp)
  (:qualifiercharacteristicspeed
   (&optional __qualifiercharacteristicspeed)
   (if __qualifiercharacteristicspeed (setq _qualifiercharacteristicspeed __qualifiercharacteristicspeed)) _qualifiercharacteristicspeed)
  (:characteristicspeed
   (&optional __characteristicspeed)
   (if __characteristicspeed (setq _characteristicspeed __characteristicspeed)) _characteristicspeed)
  (:serialization-length
   ()
   (+
    ;; uint8 _characteristicspeederramp
    1
    ;; uint8 _qualifiercharacteristicspeed
    1
    ;; uint8 _characteristicspeed
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _characteristicspeederramp
       (write-byte _characteristicspeederramp s)
     ;; uint8 _qualifiercharacteristicspeed
       (write-byte _qualifiercharacteristicspeed s)
     ;; uint8 _characteristicspeed
       (write-byte _characteristicspeed s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _characteristicspeederramp
     (setq _characteristicspeederramp (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _qualifiercharacteristicspeed
     (setq _qualifiercharacteristicspeed (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _characteristicspeed
     (setq _characteristicspeed (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ars548_messages::CharacteristicSpeed :md5sum-) "08f85cc48916f7bc1371d09df58338bd")
(setf (get ars548_messages::CharacteristicSpeed :datatype-) "ars548_messages/CharacteristicSpeed")
(setf (get ars548_messages::CharacteristicSpeed :definition-)
      "uint8 characteristicspeederramp #(Unused) Error amplitude of characteristic speed
uint8  qualifiercharacteristicspeed #(Unused) Characteristic speed qualifier
uint8 characteristicspeed # Characteristic speed
")



(provide :ars548_messages/CharacteristicSpeed "08f85cc48916f7bc1371d09df58338bd")


