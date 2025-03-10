;; Auto-generated. Do not edit!


(when (boundp 'ars548_messages::YawRate)
  (if (not (find-package "ARS548_MESSAGES"))
    (make-package "ARS548_MESSAGES"))
  (shadow 'YawRate (find-package "ARS548_MESSAGES")))
(unless (find-package "ARS548_MESSAGES::YAWRATE")
  (make-package "ARS548_MESSAGES::YAWRATE"))

(in-package "ROS")
;;//! \htmlinclude YawRate.msg.html


(defclass ars548_messages::YawRate
  :super ros::object
  :slots (_yawrateerramp _yawrateerramp_invalidflag _qualifieryawrate _yawrate _yawrate_invalidflag _yawrateeventdataqualifier ))

(defmethod ars548_messages::YawRate
  (:init
   (&key
    ((:yawrateerramp __yawrateerramp) 0.0)
    ((:yawrateerramp_invalidflag __yawrateerramp_invalidflag) 0)
    ((:qualifieryawrate __qualifieryawrate) 0)
    ((:yawrate __yawrate) 0.0)
    ((:yawrate_invalidflag __yawrate_invalidflag) 0)
    ((:yawrateeventdataqualifier __yawrateeventdataqualifier) 0)
    )
   (send-super :init)
   (setq _yawrateerramp (float __yawrateerramp))
   (setq _yawrateerramp_invalidflag (round __yawrateerramp_invalidflag))
   (setq _qualifieryawrate (round __qualifieryawrate))
   (setq _yawrate (float __yawrate))
   (setq _yawrate_invalidflag (round __yawrate_invalidflag))
   (setq _yawrateeventdataqualifier (round __yawrateeventdataqualifier))
   self)
  (:yawrateerramp
   (&optional __yawrateerramp)
   (if __yawrateerramp (setq _yawrateerramp __yawrateerramp)) _yawrateerramp)
  (:yawrateerramp_invalidflag
   (&optional __yawrateerramp_invalidflag)
   (if __yawrateerramp_invalidflag (setq _yawrateerramp_invalidflag __yawrateerramp_invalidflag)) _yawrateerramp_invalidflag)
  (:qualifieryawrate
   (&optional __qualifieryawrate)
   (if __qualifieryawrate (setq _qualifieryawrate __qualifieryawrate)) _qualifieryawrate)
  (:yawrate
   (&optional __yawrate)
   (if __yawrate (setq _yawrate __yawrate)) _yawrate)
  (:yawrate_invalidflag
   (&optional __yawrate_invalidflag)
   (if __yawrate_invalidflag (setq _yawrate_invalidflag __yawrate_invalidflag)) _yawrate_invalidflag)
  (:yawrateeventdataqualifier
   (&optional __yawrateeventdataqualifier)
   (if __yawrateeventdataqualifier (setq _yawrateeventdataqualifier __yawrateeventdataqualifier)) _yawrateeventdataqualifier)
  (:serialization-length
   ()
   (+
    ;; float32 _yawrateerramp
    4
    ;; uint8 _yawrateerramp_invalidflag
    1
    ;; uint8 _qualifieryawrate
    1
    ;; float32 _yawrate
    4
    ;; uint8 _yawrate_invalidflag
    1
    ;; uint8 _yawrateeventdataqualifier
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _yawrateerramp
       (sys::poke _yawrateerramp (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _yawrateerramp_invalidflag
       (write-byte _yawrateerramp_invalidflag s)
     ;; uint8 _qualifieryawrate
       (write-byte _qualifieryawrate s)
     ;; float32 _yawrate
       (sys::poke _yawrate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _yawrate_invalidflag
       (write-byte _yawrate_invalidflag s)
     ;; uint8 _yawrateeventdataqualifier
       (write-byte _yawrateeventdataqualifier s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _yawrateerramp
     (setq _yawrateerramp (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _yawrateerramp_invalidflag
     (setq _yawrateerramp_invalidflag (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _qualifieryawrate
     (setq _qualifieryawrate (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _yawrate
     (setq _yawrate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _yawrate_invalidflag
     (setq _yawrate_invalidflag (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _yawrateeventdataqualifier
     (setq _yawrateeventdataqualifier (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ars548_messages::YawRate :md5sum-) "5e5ee89741e00a755558196ad380378e")
(setf (get ars548_messages::YawRate :datatype-) "ars548_messages/YawRate")
(setf (get ars548_messages::YawRate :definition-)
      "float32 yawrateerramp #(Unused) Error Amplitude of YawRate
uint8 yawrateerramp_invalidflag #(Unused) Invalid flags AccelLatErrAmp
uint8 qualifieryawrate #(Unused) YawRate qualifier
float32 yawrate #YawRate
uint8 yawrate_invalidflag #(Unused) Invalid flag Yaw Rate 
uint8 yawrateeventdataqualifier #(Unused) Event data qualifier YawRate
")



(provide :ars548_messages/YawRate "5e5ee89741e00a755558196ad380378e")


