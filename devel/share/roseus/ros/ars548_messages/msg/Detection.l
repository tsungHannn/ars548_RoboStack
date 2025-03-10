;; Auto-generated. Do not edit!


(when (boundp 'ars548_messages::Detection)
  (if (not (find-package "ARS548_MESSAGES"))
    (make-package "ARS548_MESSAGES"))
  (shadow 'Detection (find-package "ARS548_MESSAGES")))
(unless (find-package "ARS548_MESSAGES::DETECTION")
  (make-package "ARS548_MESSAGES::DETECTION"))

(in-package "ROS")
;;//! \htmlinclude Detection.msg.html


(defclass ars548_messages::Detection
  :super ros::object
  :slots (_f_azimuthangle _f_azimuthanglestd _u_invalidflags _f_elevationangle _f_elevationanglestd _f_range _f_rangestd _f_rangerate _f_rangeratestd _s_rcs _u_measurementid _u_positivepredictivevalue _u_classification _u_multitargetprobabilitym _u_objectid _u_ambiguityflag _u_sortindex ))

(defmethod ars548_messages::Detection
  (:init
   (&key
    ((:f_azimuthangle __f_azimuthangle) 0.0)
    ((:f_azimuthanglestd __f_azimuthanglestd) 0.0)
    ((:u_invalidflags __u_invalidflags) 0)
    ((:f_elevationangle __f_elevationangle) 0.0)
    ((:f_elevationanglestd __f_elevationanglestd) 0.0)
    ((:f_range __f_range) 0.0)
    ((:f_rangestd __f_rangestd) 0.0)
    ((:f_rangerate __f_rangerate) 0.0)
    ((:f_rangeratestd __f_rangeratestd) 0.0)
    ((:s_rcs __s_rcs) 0)
    ((:u_measurementid __u_measurementid) 0)
    ((:u_positivepredictivevalue __u_positivepredictivevalue) 0)
    ((:u_classification __u_classification) 0)
    ((:u_multitargetprobabilitym __u_multitargetprobabilitym) 0)
    ((:u_objectid __u_objectid) 0)
    ((:u_ambiguityflag __u_ambiguityflag) 0)
    ((:u_sortindex __u_sortindex) 0)
    )
   (send-super :init)
   (setq _f_azimuthangle (float __f_azimuthangle))
   (setq _f_azimuthanglestd (float __f_azimuthanglestd))
   (setq _u_invalidflags (round __u_invalidflags))
   (setq _f_elevationangle (float __f_elevationangle))
   (setq _f_elevationanglestd (float __f_elevationanglestd))
   (setq _f_range (float __f_range))
   (setq _f_rangestd (float __f_rangestd))
   (setq _f_rangerate (float __f_rangerate))
   (setq _f_rangeratestd (float __f_rangeratestd))
   (setq _s_rcs (round __s_rcs))
   (setq _u_measurementid (round __u_measurementid))
   (setq _u_positivepredictivevalue (round __u_positivepredictivevalue))
   (setq _u_classification (round __u_classification))
   (setq _u_multitargetprobabilitym (round __u_multitargetprobabilitym))
   (setq _u_objectid (round __u_objectid))
   (setq _u_ambiguityflag (round __u_ambiguityflag))
   (setq _u_sortindex (round __u_sortindex))
   self)
  (:f_azimuthangle
   (&optional __f_azimuthangle)
   (if __f_azimuthangle (setq _f_azimuthangle __f_azimuthangle)) _f_azimuthangle)
  (:f_azimuthanglestd
   (&optional __f_azimuthanglestd)
   (if __f_azimuthanglestd (setq _f_azimuthanglestd __f_azimuthanglestd)) _f_azimuthanglestd)
  (:u_invalidflags
   (&optional __u_invalidflags)
   (if __u_invalidflags (setq _u_invalidflags __u_invalidflags)) _u_invalidflags)
  (:f_elevationangle
   (&optional __f_elevationangle)
   (if __f_elevationangle (setq _f_elevationangle __f_elevationangle)) _f_elevationangle)
  (:f_elevationanglestd
   (&optional __f_elevationanglestd)
   (if __f_elevationanglestd (setq _f_elevationanglestd __f_elevationanglestd)) _f_elevationanglestd)
  (:f_range
   (&optional __f_range)
   (if __f_range (setq _f_range __f_range)) _f_range)
  (:f_rangestd
   (&optional __f_rangestd)
   (if __f_rangestd (setq _f_rangestd __f_rangestd)) _f_rangestd)
  (:f_rangerate
   (&optional __f_rangerate)
   (if __f_rangerate (setq _f_rangerate __f_rangerate)) _f_rangerate)
  (:f_rangeratestd
   (&optional __f_rangeratestd)
   (if __f_rangeratestd (setq _f_rangeratestd __f_rangeratestd)) _f_rangeratestd)
  (:s_rcs
   (&optional __s_rcs)
   (if __s_rcs (setq _s_rcs __s_rcs)) _s_rcs)
  (:u_measurementid
   (&optional __u_measurementid)
   (if __u_measurementid (setq _u_measurementid __u_measurementid)) _u_measurementid)
  (:u_positivepredictivevalue
   (&optional __u_positivepredictivevalue)
   (if __u_positivepredictivevalue (setq _u_positivepredictivevalue __u_positivepredictivevalue)) _u_positivepredictivevalue)
  (:u_classification
   (&optional __u_classification)
   (if __u_classification (setq _u_classification __u_classification)) _u_classification)
  (:u_multitargetprobabilitym
   (&optional __u_multitargetprobabilitym)
   (if __u_multitargetprobabilitym (setq _u_multitargetprobabilitym __u_multitargetprobabilitym)) _u_multitargetprobabilitym)
  (:u_objectid
   (&optional __u_objectid)
   (if __u_objectid (setq _u_objectid __u_objectid)) _u_objectid)
  (:u_ambiguityflag
   (&optional __u_ambiguityflag)
   (if __u_ambiguityflag (setq _u_ambiguityflag __u_ambiguityflag)) _u_ambiguityflag)
  (:u_sortindex
   (&optional __u_sortindex)
   (if __u_sortindex (setq _u_sortindex __u_sortindex)) _u_sortindex)
  (:serialization-length
   ()
   (+
    ;; float32 _f_azimuthangle
    4
    ;; float32 _f_azimuthanglestd
    4
    ;; uint8 _u_invalidflags
    1
    ;; float32 _f_elevationangle
    4
    ;; float32 _f_elevationanglestd
    4
    ;; float32 _f_range
    4
    ;; float32 _f_rangestd
    4
    ;; float32 _f_rangerate
    4
    ;; float32 _f_rangeratestd
    4
    ;; int8 _s_rcs
    1
    ;; uint16 _u_measurementid
    2
    ;; uint8 _u_positivepredictivevalue
    1
    ;; uint8 _u_classification
    1
    ;; uint8 _u_multitargetprobabilitym
    1
    ;; uint16 _u_objectid
    2
    ;; uint8 _u_ambiguityflag
    1
    ;; uint16 _u_sortindex
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _f_azimuthangle
       (sys::poke _f_azimuthangle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _f_azimuthanglestd
       (sys::poke _f_azimuthanglestd (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _u_invalidflags
       (write-byte _u_invalidflags s)
     ;; float32 _f_elevationangle
       (sys::poke _f_elevationangle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _f_elevationanglestd
       (sys::poke _f_elevationanglestd (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _f_range
       (sys::poke _f_range (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _f_rangestd
       (sys::poke _f_rangestd (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _f_rangerate
       (sys::poke _f_rangerate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _f_rangeratestd
       (sys::poke _f_rangeratestd (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int8 _s_rcs
       (write-byte _s_rcs s)
     ;; uint16 _u_measurementid
       (write-word _u_measurementid s)
     ;; uint8 _u_positivepredictivevalue
       (write-byte _u_positivepredictivevalue s)
     ;; uint8 _u_classification
       (write-byte _u_classification s)
     ;; uint8 _u_multitargetprobabilitym
       (write-byte _u_multitargetprobabilitym s)
     ;; uint16 _u_objectid
       (write-word _u_objectid s)
     ;; uint8 _u_ambiguityflag
       (write-byte _u_ambiguityflag s)
     ;; uint16 _u_sortindex
       (write-word _u_sortindex s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _f_azimuthangle
     (setq _f_azimuthangle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _f_azimuthanglestd
     (setq _f_azimuthanglestd (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _u_invalidflags
     (setq _u_invalidflags (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _f_elevationangle
     (setq _f_elevationangle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _f_elevationanglestd
     (setq _f_elevationanglestd (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _f_range
     (setq _f_range (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _f_rangestd
     (setq _f_rangestd (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _f_rangerate
     (setq _f_rangerate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _f_rangeratestd
     (setq _f_rangeratestd (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int8 _s_rcs
     (setq _s_rcs (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _s_rcs 127) (setq _s_rcs (- _s_rcs 256)))
   ;; uint16 _u_measurementid
     (setq _u_measurementid (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _u_positivepredictivevalue
     (setq _u_positivepredictivevalue (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _u_classification
     (setq _u_classification (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _u_multitargetprobabilitym
     (setq _u_multitargetprobabilitym (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _u_objectid
     (setq _u_objectid (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _u_ambiguityflag
     (setq _u_ambiguityflag (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _u_sortindex
     (setq _u_sortindex (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get ars548_messages::Detection :md5sum-) "3760b05dc425bea9898067baeb462326")
(setf (get ars548_messages::Detection :datatype-) "ars548_messages/Detection")
(setf (get ars548_messages::Detection :definition-)
      "float32 f_azimuthangle #Unaligned Detection Azimuth Angle
float32 f_azimuthanglestd #Azimuth Angle Std
uint8 u_invalidflags #Detection Invalid Flags 
float32 f_elevationangle #Unaligned Detection Elevation Angle
float32 f_elevationanglestd #Elevation Angle Std
float32 f_range #Detection Radial Distance
float32 f_rangestd #Radial Distance Std
float32 f_rangerate #Detection Radial Velocity
float32 f_rangeratestd #Radial Velocity Std
int8 s_rcs #Detection RCS
uint16 u_measurementid #Detection ID
uint8 u_positivepredictivevalue #Existence Probability
uint8 u_classification #Detection Classification
uint8 u_multitargetprobabilitym #Multi-Target Probability
uint16 u_objectid #Associated Object ID
uint8 u_ambiguityflag #Probability for resolved velocity ambiguity
uint16 u_sortindex #tbd
")



(provide :ars548_messages/Detection "3760b05dc425bea9898067baeb462326")


