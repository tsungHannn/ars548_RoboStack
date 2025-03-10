; Auto-generated. Do not edit!


(cl:in-package ars548_messages-msg)


;//! \htmlinclude ObjectList.msg.html

(cl:defclass <ObjectList> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (crc
    :reader crc
    :initarg :crc
    :type cl:integer
    :initform 0)
   (length
    :reader length
    :initarg :length
    :type cl:integer
    :initform 0)
   (sqc
    :reader sqc
    :initarg :sqc
    :type cl:integer
    :initform 0)
   (dataid
    :reader dataid
    :initarg :dataid
    :type cl:integer
    :initform 0)
   (timestamp_nanoseconds
    :reader timestamp_nanoseconds
    :initarg :timestamp_nanoseconds
    :type cl:integer
    :initform 0)
   (timestamp_seconds
    :reader timestamp_seconds
    :initarg :timestamp_seconds
    :type cl:integer
    :initform 0)
   (timestamp_syncstatus
    :reader timestamp_syncstatus
    :initarg :timestamp_syncstatus
    :type cl:fixnum
    :initform 0)
   (eventdataqualifier
    :reader eventdataqualifier
    :initarg :eventdataqualifier
    :type cl:integer
    :initform 0)
   (extendedqualifier
    :reader extendedqualifier
    :initarg :extendedqualifier
    :type cl:fixnum
    :initform 0)
   (objectlist_numofobjects
    :reader objectlist_numofobjects
    :initarg :objectlist_numofobjects
    :type cl:fixnum
    :initform 0)
   (objectlist_objects
    :reader objectlist_objects
    :initarg :objectlist_objects
    :type (cl:vector ars548_messages-msg:Object)
   :initform (cl:make-array 50 :element-type 'ars548_messages-msg:Object :initial-element (cl:make-instance 'ars548_messages-msg:Object))))
)

(cl:defclass ObjectList (<ObjectList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ObjectList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ObjectList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ars548_messages-msg:<ObjectList> is deprecated: use ars548_messages-msg:ObjectList instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ObjectList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:header-val is deprecated.  Use ars548_messages-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'crc-val :lambda-list '(m))
(cl:defmethod crc-val ((m <ObjectList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:crc-val is deprecated.  Use ars548_messages-msg:crc instead.")
  (crc m))

(cl:ensure-generic-function 'length-val :lambda-list '(m))
(cl:defmethod length-val ((m <ObjectList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:length-val is deprecated.  Use ars548_messages-msg:length instead.")
  (length m))

(cl:ensure-generic-function 'sqc-val :lambda-list '(m))
(cl:defmethod sqc-val ((m <ObjectList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:sqc-val is deprecated.  Use ars548_messages-msg:sqc instead.")
  (sqc m))

(cl:ensure-generic-function 'dataid-val :lambda-list '(m))
(cl:defmethod dataid-val ((m <ObjectList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:dataid-val is deprecated.  Use ars548_messages-msg:dataid instead.")
  (dataid m))

(cl:ensure-generic-function 'timestamp_nanoseconds-val :lambda-list '(m))
(cl:defmethod timestamp_nanoseconds-val ((m <ObjectList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:timestamp_nanoseconds-val is deprecated.  Use ars548_messages-msg:timestamp_nanoseconds instead.")
  (timestamp_nanoseconds m))

(cl:ensure-generic-function 'timestamp_seconds-val :lambda-list '(m))
(cl:defmethod timestamp_seconds-val ((m <ObjectList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:timestamp_seconds-val is deprecated.  Use ars548_messages-msg:timestamp_seconds instead.")
  (timestamp_seconds m))

(cl:ensure-generic-function 'timestamp_syncstatus-val :lambda-list '(m))
(cl:defmethod timestamp_syncstatus-val ((m <ObjectList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:timestamp_syncstatus-val is deprecated.  Use ars548_messages-msg:timestamp_syncstatus instead.")
  (timestamp_syncstatus m))

(cl:ensure-generic-function 'eventdataqualifier-val :lambda-list '(m))
(cl:defmethod eventdataqualifier-val ((m <ObjectList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:eventdataqualifier-val is deprecated.  Use ars548_messages-msg:eventdataqualifier instead.")
  (eventdataqualifier m))

(cl:ensure-generic-function 'extendedqualifier-val :lambda-list '(m))
(cl:defmethod extendedqualifier-val ((m <ObjectList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:extendedqualifier-val is deprecated.  Use ars548_messages-msg:extendedqualifier instead.")
  (extendedqualifier m))

(cl:ensure-generic-function 'objectlist_numofobjects-val :lambda-list '(m))
(cl:defmethod objectlist_numofobjects-val ((m <ObjectList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:objectlist_numofobjects-val is deprecated.  Use ars548_messages-msg:objectlist_numofobjects instead.")
  (objectlist_numofobjects m))

(cl:ensure-generic-function 'objectlist_objects-val :lambda-list '(m))
(cl:defmethod objectlist_objects-val ((m <ObjectList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:objectlist_objects-val is deprecated.  Use ars548_messages-msg:objectlist_objects instead.")
  (objectlist_objects m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ObjectList>) ostream)
  "Serializes a message object of type '<ObjectList>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'crc)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'crc)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'crc)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'crc)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'crc)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'crc)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'crc)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'crc)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'length)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'length)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'length)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'length)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sqc)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'sqc)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'sqc)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'sqc)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dataid)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'dataid)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'dataid)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'dataid)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timestamp_nanoseconds)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timestamp_nanoseconds)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'timestamp_nanoseconds)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'timestamp_nanoseconds)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timestamp_seconds)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timestamp_seconds)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'timestamp_seconds)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'timestamp_seconds)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timestamp_syncstatus)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'eventdataqualifier)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'eventdataqualifier)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'eventdataqualifier)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'eventdataqualifier)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'extendedqualifier)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'objectlist_numofobjects)) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'objectlist_objects))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ObjectList>) istream)
  "Deserializes a message object of type '<ObjectList>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'crc)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'crc)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'crc)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'crc)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'crc)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'crc)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'crc)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'crc)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'length)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'length)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'length)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'length)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sqc)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'sqc)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'sqc)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'sqc)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dataid)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'dataid)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'dataid)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'dataid)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timestamp_nanoseconds)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timestamp_nanoseconds)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'timestamp_nanoseconds)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'timestamp_nanoseconds)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timestamp_seconds)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timestamp_seconds)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'timestamp_seconds)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'timestamp_seconds)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timestamp_syncstatus)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'eventdataqualifier)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'eventdataqualifier)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'eventdataqualifier)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'eventdataqualifier)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'extendedqualifier)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'objectlist_numofobjects)) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'objectlist_objects) (cl:make-array 50))
  (cl:let ((vals (cl:slot-value msg 'objectlist_objects)))
    (cl:dotimes (i 50)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ars548_messages-msg:Object))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ObjectList>)))
  "Returns string type for a message object of type '<ObjectList>"
  "ars548_messages/ObjectList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ObjectList)))
  "Returns string type for a message object of type 'ObjectList"
  "ars548_messages/ObjectList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ObjectList>)))
  "Returns md5sum for a message object of type '<ObjectList>"
  "c5aad967b1571bd050514e2ef3500c86")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ObjectList)))
  "Returns md5sum for a message object of type 'ObjectList"
  "c5aad967b1571bd050514e2ef3500c86")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ObjectList>)))
  "Returns full string definition for message of type '<ObjectList>"
  (cl:format cl:nil "std_msgs/Header header~%uint64 crc #Checksum (E2E Profile 7) (Reserved)~%uint32 length #Len (E2E Profile 7) (Reserved)~%uint32 sqc #SQC (E2E Profile 7) (Reserved)~%uint32 dataid #Data ID (E2E Profile 7) (Reserved)~%uint32 timestamp_nanoseconds #Timestamp Nanoseconds~%uint32 timestamp_seconds #Timestamp Seconds~%uint8 timestamp_syncstatus #Timestamp Sync Status~%uint32 eventdataqualifier #(unused) Event Data Qualifier~%uint8 extendedqualifier #(unused) Extended Qualifier ~%uint8 objectlist_numofobjects #Number of Objects~%Object[50] objectlist_objects #Object Array~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ars548_messages/Object~%uint16 u_statussensor #tbd~%uint32 u_id #Unique ID of object~%uint16 u_age #Age of object~%uint8 u_statusmeasurement #Object Status~%uint8 u_statusmovement #Object Movement Status~%uint16 u_position_invalidflags #tbd~%uint8 u_position_reference #Reference point position~%float32 u_position_x #X Position of reference point~%float32 u_position_x_std #X Position Std~%float32 u_position_y #Y Position of reference point~%float32 u_position_y_std #Y Position Std~%float32 u_position_z #Z Position of reference point~%float32 u_position_z_std #Z Position Std~%float32 u_position_covariancexy #Covariance X Y~%float32 u_position_orientation #Object Orientation~%float32 u_position_orientation_std #Orientation Std~%uint8 u_existence_invalidflags #unused~%float32 u_existence_probability #Probability of Existence~%float32 u_existence_ppv #unused~%uint8 u_classification_car #Car Classification Probability~%uint8 u_classification_truck #Truck Classification Probability~%uint8 u_classification_motorcycle #Motorcycle Classification Probability~%uint8 u_classification_bicycle #Bicycle Classification Probability~%uint8 u_classification_pedestrian #Pedestrian Classification Probability~%uint8 u_classification_animal #Animal Classification Probability~%uint8 u_classification_hazard #Hazard Classification Probability~%uint8 u_classification_unknown #Unknown Classification Probability~%uint8 u_classification_overdrivable #unused~%uint8 u_classification_underdrivable #unused~%uint8 u_dynamics_absvel_invalidflags #unused~%float32 f_dynamics_absvel_x #X Absolute Velocity~%float32 f_dynamics_absvel_x_std #X Absolute Velocity Std~%float32 f_dynamics_absvel_y #Y Absolute Velocity~%float32 f_dynamics_absvel_y_std #Y Absolute Velocity Std~%float32 f_dynamics_absvel_covariancexy #Covariance Absolute Velocity X Y~%uint8 u_dynamics_relvel_invalidflags #unused~%float32 f_dynamics_relvel_x #X Relative Velocity~%float32 f_dynamics_relvel_x_std #X Relative Velocity Std~%float32 f_dynamics_relvel_y #Y Relative Velocity~%float32 f_dynamics_relvel_y_std #Y Relative Velocity Std~%float32 f_dynamics_relvel_covariancexy #Covariance Relative Velocity X Y~%uint8 u_dynamics_absaccel_invalidflags #unused~%float32 f_dynamics_absaccel_x #X Absolute Acceleration~%float32 f_dynamics_absaccel_x_std #X Absolute Acceleration Std~%float32 f_dynamics_absaccel_y #Y Absolute Acceleration~%float32 f_dynamics_absaccel_y_std #Y Absolute Acceleration Std~%float32 f_dynamics_absaccel_covariancexy #Covariance Absolute Acceleration X Y~%uint8 u_dynamics_relaccel_invalidflags #unused~%float32 f_dynamics_relaccel_x #X Relative Acceleration~%float32 f_dynamics_relaccel_x_std #X Relative Acceleration Std~%float32 f_dynamics_relaccel_y #Y Relative Acceleration~%float32 f_dynamics_relaccel_y_std #Y Relative Acceleration Std~%float32 f_dynamics_relaccel_covariancexy #Covariance Relative Acceleration X Y~%uint8 u_dynamics_orientation_invalidflags #unused~%float32 u_dynamics_orientation_rate_mean #Object Orientation Rate~%float32 u_dynamics_orientation_rate_std #Orientation Rate Std~%uint32 u_shape_length_status #(unused) Shape Length Status~%uint8 u_shape_length_edge_invalidflags #(unused) Invalid Flags Shape Length ~%float32 u_shape_length_edge_mean #Mean Shape Length~%float32 u_shape_length_edge_std #(unused) Shape Length Std~%uint32 u_shape_width_status #(unused) Shape Width Status ~%uint8 u_shape_width_edge_invalidflags #(unused) Invalid Flags Shape Width~%float32 u_shape_width_edge_mean #Mean Shape Width~%float32 u_shape_width_edge_std #(unused) Shape Width Std ~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ObjectList)))
  "Returns full string definition for message of type 'ObjectList"
  (cl:format cl:nil "std_msgs/Header header~%uint64 crc #Checksum (E2E Profile 7) (Reserved)~%uint32 length #Len (E2E Profile 7) (Reserved)~%uint32 sqc #SQC (E2E Profile 7) (Reserved)~%uint32 dataid #Data ID (E2E Profile 7) (Reserved)~%uint32 timestamp_nanoseconds #Timestamp Nanoseconds~%uint32 timestamp_seconds #Timestamp Seconds~%uint8 timestamp_syncstatus #Timestamp Sync Status~%uint32 eventdataqualifier #(unused) Event Data Qualifier~%uint8 extendedqualifier #(unused) Extended Qualifier ~%uint8 objectlist_numofobjects #Number of Objects~%Object[50] objectlist_objects #Object Array~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ars548_messages/Object~%uint16 u_statussensor #tbd~%uint32 u_id #Unique ID of object~%uint16 u_age #Age of object~%uint8 u_statusmeasurement #Object Status~%uint8 u_statusmovement #Object Movement Status~%uint16 u_position_invalidflags #tbd~%uint8 u_position_reference #Reference point position~%float32 u_position_x #X Position of reference point~%float32 u_position_x_std #X Position Std~%float32 u_position_y #Y Position of reference point~%float32 u_position_y_std #Y Position Std~%float32 u_position_z #Z Position of reference point~%float32 u_position_z_std #Z Position Std~%float32 u_position_covariancexy #Covariance X Y~%float32 u_position_orientation #Object Orientation~%float32 u_position_orientation_std #Orientation Std~%uint8 u_existence_invalidflags #unused~%float32 u_existence_probability #Probability of Existence~%float32 u_existence_ppv #unused~%uint8 u_classification_car #Car Classification Probability~%uint8 u_classification_truck #Truck Classification Probability~%uint8 u_classification_motorcycle #Motorcycle Classification Probability~%uint8 u_classification_bicycle #Bicycle Classification Probability~%uint8 u_classification_pedestrian #Pedestrian Classification Probability~%uint8 u_classification_animal #Animal Classification Probability~%uint8 u_classification_hazard #Hazard Classification Probability~%uint8 u_classification_unknown #Unknown Classification Probability~%uint8 u_classification_overdrivable #unused~%uint8 u_classification_underdrivable #unused~%uint8 u_dynamics_absvel_invalidflags #unused~%float32 f_dynamics_absvel_x #X Absolute Velocity~%float32 f_dynamics_absvel_x_std #X Absolute Velocity Std~%float32 f_dynamics_absvel_y #Y Absolute Velocity~%float32 f_dynamics_absvel_y_std #Y Absolute Velocity Std~%float32 f_dynamics_absvel_covariancexy #Covariance Absolute Velocity X Y~%uint8 u_dynamics_relvel_invalidflags #unused~%float32 f_dynamics_relvel_x #X Relative Velocity~%float32 f_dynamics_relvel_x_std #X Relative Velocity Std~%float32 f_dynamics_relvel_y #Y Relative Velocity~%float32 f_dynamics_relvel_y_std #Y Relative Velocity Std~%float32 f_dynamics_relvel_covariancexy #Covariance Relative Velocity X Y~%uint8 u_dynamics_absaccel_invalidflags #unused~%float32 f_dynamics_absaccel_x #X Absolute Acceleration~%float32 f_dynamics_absaccel_x_std #X Absolute Acceleration Std~%float32 f_dynamics_absaccel_y #Y Absolute Acceleration~%float32 f_dynamics_absaccel_y_std #Y Absolute Acceleration Std~%float32 f_dynamics_absaccel_covariancexy #Covariance Absolute Acceleration X Y~%uint8 u_dynamics_relaccel_invalidflags #unused~%float32 f_dynamics_relaccel_x #X Relative Acceleration~%float32 f_dynamics_relaccel_x_std #X Relative Acceleration Std~%float32 f_dynamics_relaccel_y #Y Relative Acceleration~%float32 f_dynamics_relaccel_y_std #Y Relative Acceleration Std~%float32 f_dynamics_relaccel_covariancexy #Covariance Relative Acceleration X Y~%uint8 u_dynamics_orientation_invalidflags #unused~%float32 u_dynamics_orientation_rate_mean #Object Orientation Rate~%float32 u_dynamics_orientation_rate_std #Orientation Rate Std~%uint32 u_shape_length_status #(unused) Shape Length Status~%uint8 u_shape_length_edge_invalidflags #(unused) Invalid Flags Shape Length ~%float32 u_shape_length_edge_mean #Mean Shape Length~%float32 u_shape_length_edge_std #(unused) Shape Length Std~%uint32 u_shape_width_status #(unused) Shape Width Status ~%uint8 u_shape_width_edge_invalidflags #(unused) Invalid Flags Shape Width~%float32 u_shape_width_edge_mean #Mean Shape Width~%float32 u_shape_width_edge_std #(unused) Shape Width Std ~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ObjectList>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     4
     4
     4
     4
     4
     1
     4
     1
     1
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'objectlist_objects) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ObjectList>))
  "Converts a ROS message object to a list"
  (cl:list 'ObjectList
    (cl:cons ':header (header msg))
    (cl:cons ':crc (crc msg))
    (cl:cons ':length (length msg))
    (cl:cons ':sqc (sqc msg))
    (cl:cons ':dataid (dataid msg))
    (cl:cons ':timestamp_nanoseconds (timestamp_nanoseconds msg))
    (cl:cons ':timestamp_seconds (timestamp_seconds msg))
    (cl:cons ':timestamp_syncstatus (timestamp_syncstatus msg))
    (cl:cons ':eventdataqualifier (eventdataqualifier msg))
    (cl:cons ':extendedqualifier (extendedqualifier msg))
    (cl:cons ':objectlist_numofobjects (objectlist_numofobjects msg))
    (cl:cons ':objectlist_objects (objectlist_objects msg))
))
