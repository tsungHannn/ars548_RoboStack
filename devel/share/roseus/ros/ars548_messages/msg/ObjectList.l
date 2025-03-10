;; Auto-generated. Do not edit!


(when (boundp 'ars548_messages::ObjectList)
  (if (not (find-package "ARS548_MESSAGES"))
    (make-package "ARS548_MESSAGES"))
  (shadow 'ObjectList (find-package "ARS548_MESSAGES")))
(unless (find-package "ARS548_MESSAGES::OBJECTLIST")
  (make-package "ARS548_MESSAGES::OBJECTLIST"))

(in-package "ROS")
;;//! \htmlinclude ObjectList.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ars548_messages::ObjectList
  :super ros::object
  :slots (_header _crc _length _sqc _dataid _timestamp_nanoseconds _timestamp_seconds _timestamp_syncstatus _eventdataqualifier _extendedqualifier _objectlist_numofobjects _objectlist_objects ))

(defmethod ars548_messages::ObjectList
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:crc __crc) 0)
    ((:length __length) 0)
    ((:sqc __sqc) 0)
    ((:dataid __dataid) 0)
    ((:timestamp_nanoseconds __timestamp_nanoseconds) 0)
    ((:timestamp_seconds __timestamp_seconds) 0)
    ((:timestamp_syncstatus __timestamp_syncstatus) 0)
    ((:eventdataqualifier __eventdataqualifier) 0)
    ((:extendedqualifier __extendedqualifier) 0)
    ((:objectlist_numofobjects __objectlist_numofobjects) 0)
    ((:objectlist_objects __objectlist_objects) (let (r) (dotimes (i 50) (push (instance ars548_messages::Object :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _crc (round __crc))
   (setq _length (round __length))
   (setq _sqc (round __sqc))
   (setq _dataid (round __dataid))
   (setq _timestamp_nanoseconds (round __timestamp_nanoseconds))
   (setq _timestamp_seconds (round __timestamp_seconds))
   (setq _timestamp_syncstatus (round __timestamp_syncstatus))
   (setq _eventdataqualifier (round __eventdataqualifier))
   (setq _extendedqualifier (round __extendedqualifier))
   (setq _objectlist_numofobjects (round __objectlist_numofobjects))
   (setq _objectlist_objects __objectlist_objects)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:crc
   (&optional __crc)
   (if __crc (setq _crc __crc)) _crc)
  (:length
   (&optional __length)
   (if __length (setq _length __length)) _length)
  (:sqc
   (&optional __sqc)
   (if __sqc (setq _sqc __sqc)) _sqc)
  (:dataid
   (&optional __dataid)
   (if __dataid (setq _dataid __dataid)) _dataid)
  (:timestamp_nanoseconds
   (&optional __timestamp_nanoseconds)
   (if __timestamp_nanoseconds (setq _timestamp_nanoseconds __timestamp_nanoseconds)) _timestamp_nanoseconds)
  (:timestamp_seconds
   (&optional __timestamp_seconds)
   (if __timestamp_seconds (setq _timestamp_seconds __timestamp_seconds)) _timestamp_seconds)
  (:timestamp_syncstatus
   (&optional __timestamp_syncstatus)
   (if __timestamp_syncstatus (setq _timestamp_syncstatus __timestamp_syncstatus)) _timestamp_syncstatus)
  (:eventdataqualifier
   (&optional __eventdataqualifier)
   (if __eventdataqualifier (setq _eventdataqualifier __eventdataqualifier)) _eventdataqualifier)
  (:extendedqualifier
   (&optional __extendedqualifier)
   (if __extendedqualifier (setq _extendedqualifier __extendedqualifier)) _extendedqualifier)
  (:objectlist_numofobjects
   (&optional __objectlist_numofobjects)
   (if __objectlist_numofobjects (setq _objectlist_numofobjects __objectlist_numofobjects)) _objectlist_numofobjects)
  (:objectlist_objects
   (&rest __objectlist_objects)
   (if (keywordp (car __objectlist_objects))
       (send* _objectlist_objects __objectlist_objects)
     (progn
       (if __objectlist_objects (setq _objectlist_objects (car __objectlist_objects)))
       _objectlist_objects)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint64 _crc
    8
    ;; uint32 _length
    4
    ;; uint32 _sqc
    4
    ;; uint32 _dataid
    4
    ;; uint32 _timestamp_nanoseconds
    4
    ;; uint32 _timestamp_seconds
    4
    ;; uint8 _timestamp_syncstatus
    1
    ;; uint32 _eventdataqualifier
    4
    ;; uint8 _extendedqualifier
    1
    ;; uint8 _objectlist_numofobjects
    1
    ;; ars548_messages/Object[50] _objectlist_objects
    (apply #'+ (send-all _objectlist_objects :serialization-length))
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint64 _crc
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _crc (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _crc) (= (length (_crc . bv)) 2)) ;; bignum
              (write-long (ash (elt (_crc . bv) 0) 0) s)
              (write-long (ash (elt (_crc . bv) 1) -1) s))
             ((and (class _crc) (= (length (_crc . bv)) 1)) ;; big1
              (write-long (elt (_crc . bv) 0) s)
              (write-long (if (>= _crc 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _crc s)(write-long (if (>= _crc 0) 0 #xffffffff) s)))
     ;; uint32 _length
       (write-long _length s)
     ;; uint32 _sqc
       (write-long _sqc s)
     ;; uint32 _dataid
       (write-long _dataid s)
     ;; uint32 _timestamp_nanoseconds
       (write-long _timestamp_nanoseconds s)
     ;; uint32 _timestamp_seconds
       (write-long _timestamp_seconds s)
     ;; uint8 _timestamp_syncstatus
       (write-byte _timestamp_syncstatus s)
     ;; uint32 _eventdataqualifier
       (write-long _eventdataqualifier s)
     ;; uint8 _extendedqualifier
       (write-byte _extendedqualifier s)
     ;; uint8 _objectlist_numofobjects
       (write-byte _objectlist_numofobjects s)
     ;; ars548_messages/Object[50] _objectlist_objects
     (dolist (elem _objectlist_objects)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint64 _crc
     
#+(or :alpha :irix6 :x86_64)
      (setf _crc (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _crc (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; uint32 _length
     (setq _length (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _sqc
     (setq _sqc (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _dataid
     (setq _dataid (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _timestamp_nanoseconds
     (setq _timestamp_nanoseconds (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _timestamp_seconds
     (setq _timestamp_seconds (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _timestamp_syncstatus
     (setq _timestamp_syncstatus (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint32 _eventdataqualifier
     (setq _eventdataqualifier (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _extendedqualifier
     (setq _extendedqualifier (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _objectlist_numofobjects
     (setq _objectlist_numofobjects (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; ars548_messages/Object[50] _objectlist_objects
   (dotimes (i 50)
     (send (elt _objectlist_objects i) :deserialize buf ptr-) (incf ptr- (send (elt _objectlist_objects i) :serialization-length))
     )
   ;;
   self)
  )

(setf (get ars548_messages::ObjectList :md5sum-) "c5aad967b1571bd050514e2ef3500c86")
(setf (get ars548_messages::ObjectList :datatype-) "ars548_messages/ObjectList")
(setf (get ars548_messages::ObjectList :definition-)
      "std_msgs/Header header
uint64 crc #Checksum (E2E Profile 7) (Reserved)
uint32 length #Len (E2E Profile 7) (Reserved)
uint32 sqc #SQC (E2E Profile 7) (Reserved)
uint32 dataid #Data ID (E2E Profile 7) (Reserved)
uint32 timestamp_nanoseconds #Timestamp Nanoseconds
uint32 timestamp_seconds #Timestamp Seconds
uint8 timestamp_syncstatus #Timestamp Sync Status
uint32 eventdataqualifier #(unused) Event Data Qualifier
uint8 extendedqualifier #(unused) Extended Qualifier 
uint8 objectlist_numofobjects #Number of Objects
Object[50] objectlist_objects #Object Array
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: ars548_messages/Object
uint16 u_statussensor #tbd
uint32 u_id #Unique ID of object
uint16 u_age #Age of object
uint8 u_statusmeasurement #Object Status
uint8 u_statusmovement #Object Movement Status
uint16 u_position_invalidflags #tbd
uint8 u_position_reference #Reference point position
float32 u_position_x #X Position of reference point
float32 u_position_x_std #X Position Std
float32 u_position_y #Y Position of reference point
float32 u_position_y_std #Y Position Std
float32 u_position_z #Z Position of reference point
float32 u_position_z_std #Z Position Std
float32 u_position_covariancexy #Covariance X Y
float32 u_position_orientation #Object Orientation
float32 u_position_orientation_std #Orientation Std
uint8 u_existence_invalidflags #unused
float32 u_existence_probability #Probability of Existence
float32 u_existence_ppv #unused
uint8 u_classification_car #Car Classification Probability
uint8 u_classification_truck #Truck Classification Probability
uint8 u_classification_motorcycle #Motorcycle Classification Probability
uint8 u_classification_bicycle #Bicycle Classification Probability
uint8 u_classification_pedestrian #Pedestrian Classification Probability
uint8 u_classification_animal #Animal Classification Probability
uint8 u_classification_hazard #Hazard Classification Probability
uint8 u_classification_unknown #Unknown Classification Probability
uint8 u_classification_overdrivable #unused
uint8 u_classification_underdrivable #unused
uint8 u_dynamics_absvel_invalidflags #unused
float32 f_dynamics_absvel_x #X Absolute Velocity
float32 f_dynamics_absvel_x_std #X Absolute Velocity Std
float32 f_dynamics_absvel_y #Y Absolute Velocity
float32 f_dynamics_absvel_y_std #Y Absolute Velocity Std
float32 f_dynamics_absvel_covariancexy #Covariance Absolute Velocity X Y
uint8 u_dynamics_relvel_invalidflags #unused
float32 f_dynamics_relvel_x #X Relative Velocity
float32 f_dynamics_relvel_x_std #X Relative Velocity Std
float32 f_dynamics_relvel_y #Y Relative Velocity
float32 f_dynamics_relvel_y_std #Y Relative Velocity Std
float32 f_dynamics_relvel_covariancexy #Covariance Relative Velocity X Y
uint8 u_dynamics_absaccel_invalidflags #unused
float32 f_dynamics_absaccel_x #X Absolute Acceleration
float32 f_dynamics_absaccel_x_std #X Absolute Acceleration Std
float32 f_dynamics_absaccel_y #Y Absolute Acceleration
float32 f_dynamics_absaccel_y_std #Y Absolute Acceleration Std
float32 f_dynamics_absaccel_covariancexy #Covariance Absolute Acceleration X Y
uint8 u_dynamics_relaccel_invalidflags #unused
float32 f_dynamics_relaccel_x #X Relative Acceleration
float32 f_dynamics_relaccel_x_std #X Relative Acceleration Std
float32 f_dynamics_relaccel_y #Y Relative Acceleration
float32 f_dynamics_relaccel_y_std #Y Relative Acceleration Std
float32 f_dynamics_relaccel_covariancexy #Covariance Relative Acceleration X Y
uint8 u_dynamics_orientation_invalidflags #unused
float32 u_dynamics_orientation_rate_mean #Object Orientation Rate
float32 u_dynamics_orientation_rate_std #Orientation Rate Std
uint32 u_shape_length_status #(unused) Shape Length Status
uint8 u_shape_length_edge_invalidflags #(unused) Invalid Flags Shape Length 
float32 u_shape_length_edge_mean #Mean Shape Length
float32 u_shape_length_edge_std #(unused) Shape Length Std
uint32 u_shape_width_status #(unused) Shape Width Status 
uint8 u_shape_width_edge_invalidflags #(unused) Invalid Flags Shape Width
float32 u_shape_width_edge_mean #Mean Shape Width
float32 u_shape_width_edge_std #(unused) Shape Width Std 
")



(provide :ars548_messages/ObjectList "c5aad967b1571bd050514e2ef3500c86")


