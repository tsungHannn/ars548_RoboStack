; Auto-generated. Do not edit!


(cl:in-package ars548_messages-msg)


;//! \htmlinclude SensorConfiguration.msg.html

(cl:defclass <SensorConfiguration> (roslisp-msg-protocol:ros-message)
  ((longitudinal
    :reader longitudinal
    :initarg :longitudinal
    :type cl:float
    :initform 0.0)
   (lateral
    :reader lateral
    :initarg :lateral
    :type cl:float
    :initform 0.0)
   (vertical
    :reader vertical
    :initarg :vertical
    :type cl:float
    :initform 0.0)
   (yaw
    :reader yaw
    :initarg :yaw
    :type cl:float
    :initform 0.0)
   (pitch
    :reader pitch
    :initarg :pitch
    :type cl:float
    :initform 0.0)
   (plugorientation
    :reader plugorientation
    :initarg :plugorientation
    :type cl:fixnum
    :initform 0)
   (length
    :reader length
    :initarg :length
    :type cl:float
    :initform 0.0)
   (width
    :reader width
    :initarg :width
    :type cl:float
    :initform 0.0)
   (height
    :reader height
    :initarg :height
    :type cl:float
    :initform 0.0)
   (wheelbase
    :reader wheelbase
    :initarg :wheelbase
    :type cl:float
    :initform 0.0)
   (maximumdistance
    :reader maximumdistance
    :initarg :maximumdistance
    :type cl:fixnum
    :initform 0)
   (frequencslot
    :reader frequencslot
    :initarg :frequencslot
    :type cl:fixnum
    :initform 0)
   (cycletime
    :reader cycletime
    :initarg :cycletime
    :type cl:fixnum
    :initform 0)
   (timeslot
    :reader timeslot
    :initarg :timeslot
    :type cl:fixnum
    :initform 0)
   (hcc
    :reader hcc
    :initarg :hcc
    :type cl:fixnum
    :initform 0)
   (powersave_standstill
    :reader powersave_standstill
    :initarg :powersave_standstill
    :type cl:fixnum
    :initform 0)
   (sensoripaddress_0
    :reader sensoripaddress_0
    :initarg :sensoripaddress_0
    :type cl:integer
    :initform 0)
   (sensoripaddress_1
    :reader sensoripaddress_1
    :initarg :sensoripaddress_1
    :type cl:integer
    :initform 0)
   (newsensormounting
    :reader newsensormounting
    :initarg :newsensormounting
    :type cl:fixnum
    :initform 0)
   (newvehicleparameters
    :reader newvehicleparameters
    :initarg :newvehicleparameters
    :type cl:fixnum
    :initform 0)
   (newradarparameters
    :reader newradarparameters
    :initarg :newradarparameters
    :type cl:fixnum
    :initform 0)
   (newnetworkconfiguration
    :reader newnetworkconfiguration
    :initarg :newnetworkconfiguration
    :type cl:fixnum
    :initform 0))
)

(cl:defclass SensorConfiguration (<SensorConfiguration>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SensorConfiguration>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SensorConfiguration)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ars548_messages-msg:<SensorConfiguration> is deprecated: use ars548_messages-msg:SensorConfiguration instead.")))

(cl:ensure-generic-function 'longitudinal-val :lambda-list '(m))
(cl:defmethod longitudinal-val ((m <SensorConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:longitudinal-val is deprecated.  Use ars548_messages-msg:longitudinal instead.")
  (longitudinal m))

(cl:ensure-generic-function 'lateral-val :lambda-list '(m))
(cl:defmethod lateral-val ((m <SensorConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:lateral-val is deprecated.  Use ars548_messages-msg:lateral instead.")
  (lateral m))

(cl:ensure-generic-function 'vertical-val :lambda-list '(m))
(cl:defmethod vertical-val ((m <SensorConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:vertical-val is deprecated.  Use ars548_messages-msg:vertical instead.")
  (vertical m))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <SensorConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:yaw-val is deprecated.  Use ars548_messages-msg:yaw instead.")
  (yaw m))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <SensorConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:pitch-val is deprecated.  Use ars548_messages-msg:pitch instead.")
  (pitch m))

(cl:ensure-generic-function 'plugorientation-val :lambda-list '(m))
(cl:defmethod plugorientation-val ((m <SensorConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:plugorientation-val is deprecated.  Use ars548_messages-msg:plugorientation instead.")
  (plugorientation m))

(cl:ensure-generic-function 'length-val :lambda-list '(m))
(cl:defmethod length-val ((m <SensorConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:length-val is deprecated.  Use ars548_messages-msg:length instead.")
  (length m))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <SensorConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:width-val is deprecated.  Use ars548_messages-msg:width instead.")
  (width m))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <SensorConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:height-val is deprecated.  Use ars548_messages-msg:height instead.")
  (height m))

(cl:ensure-generic-function 'wheelbase-val :lambda-list '(m))
(cl:defmethod wheelbase-val ((m <SensorConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:wheelbase-val is deprecated.  Use ars548_messages-msg:wheelbase instead.")
  (wheelbase m))

(cl:ensure-generic-function 'maximumdistance-val :lambda-list '(m))
(cl:defmethod maximumdistance-val ((m <SensorConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:maximumdistance-val is deprecated.  Use ars548_messages-msg:maximumdistance instead.")
  (maximumdistance m))

(cl:ensure-generic-function 'frequencslot-val :lambda-list '(m))
(cl:defmethod frequencslot-val ((m <SensorConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:frequencslot-val is deprecated.  Use ars548_messages-msg:frequencslot instead.")
  (frequencslot m))

(cl:ensure-generic-function 'cycletime-val :lambda-list '(m))
(cl:defmethod cycletime-val ((m <SensorConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:cycletime-val is deprecated.  Use ars548_messages-msg:cycletime instead.")
  (cycletime m))

(cl:ensure-generic-function 'timeslot-val :lambda-list '(m))
(cl:defmethod timeslot-val ((m <SensorConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:timeslot-val is deprecated.  Use ars548_messages-msg:timeslot instead.")
  (timeslot m))

(cl:ensure-generic-function 'hcc-val :lambda-list '(m))
(cl:defmethod hcc-val ((m <SensorConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:hcc-val is deprecated.  Use ars548_messages-msg:hcc instead.")
  (hcc m))

(cl:ensure-generic-function 'powersave_standstill-val :lambda-list '(m))
(cl:defmethod powersave_standstill-val ((m <SensorConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:powersave_standstill-val is deprecated.  Use ars548_messages-msg:powersave_standstill instead.")
  (powersave_standstill m))

(cl:ensure-generic-function 'sensoripaddress_0-val :lambda-list '(m))
(cl:defmethod sensoripaddress_0-val ((m <SensorConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:sensoripaddress_0-val is deprecated.  Use ars548_messages-msg:sensoripaddress_0 instead.")
  (sensoripaddress_0 m))

(cl:ensure-generic-function 'sensoripaddress_1-val :lambda-list '(m))
(cl:defmethod sensoripaddress_1-val ((m <SensorConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:sensoripaddress_1-val is deprecated.  Use ars548_messages-msg:sensoripaddress_1 instead.")
  (sensoripaddress_1 m))

(cl:ensure-generic-function 'newsensormounting-val :lambda-list '(m))
(cl:defmethod newsensormounting-val ((m <SensorConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:newsensormounting-val is deprecated.  Use ars548_messages-msg:newsensormounting instead.")
  (newsensormounting m))

(cl:ensure-generic-function 'newvehicleparameters-val :lambda-list '(m))
(cl:defmethod newvehicleparameters-val ((m <SensorConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:newvehicleparameters-val is deprecated.  Use ars548_messages-msg:newvehicleparameters instead.")
  (newvehicleparameters m))

(cl:ensure-generic-function 'newradarparameters-val :lambda-list '(m))
(cl:defmethod newradarparameters-val ((m <SensorConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:newradarparameters-val is deprecated.  Use ars548_messages-msg:newradarparameters instead.")
  (newradarparameters m))

(cl:ensure-generic-function 'newnetworkconfiguration-val :lambda-list '(m))
(cl:defmethod newnetworkconfiguration-val ((m <SensorConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:newnetworkconfiguration-val is deprecated.  Use ars548_messages-msg:newnetworkconfiguration instead.")
  (newnetworkconfiguration m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SensorConfiguration>) ostream)
  "Serializes a message object of type '<SensorConfiguration>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'longitudinal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'lateral))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vertical))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'plugorientation)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'length))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'width))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'height))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'wheelbase))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'maximumdistance)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'maximumdistance)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'frequencslot)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cycletime)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timeslot)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'hcc)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'powersave_standstill)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sensoripaddress_0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'sensoripaddress_0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'sensoripaddress_0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'sensoripaddress_0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sensoripaddress_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'sensoripaddress_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'sensoripaddress_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'sensoripaddress_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'newsensormounting)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'newvehicleparameters)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'newradarparameters)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'newnetworkconfiguration)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SensorConfiguration>) istream)
  "Deserializes a message object of type '<SensorConfiguration>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'longitudinal) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lateral) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vertical) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'plugorientation)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'length) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'width) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'height) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wheelbase) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'maximumdistance)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'maximumdistance)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'frequencslot)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cycletime)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timeslot)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'hcc)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'powersave_standstill)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sensoripaddress_0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'sensoripaddress_0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'sensoripaddress_0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'sensoripaddress_0)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sensoripaddress_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'sensoripaddress_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'sensoripaddress_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'sensoripaddress_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'newsensormounting)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'newvehicleparameters)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'newradarparameters)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'newnetworkconfiguration)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SensorConfiguration>)))
  "Returns string type for a message object of type '<SensorConfiguration>"
  "ars548_messages/SensorConfiguration")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SensorConfiguration)))
  "Returns string type for a message object of type 'SensorConfiguration"
  "ars548_messages/SensorConfiguration")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SensorConfiguration>)))
  "Returns md5sum for a message object of type '<SensorConfiguration>"
  "431839fe505be3082a74c763bbc714ec")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SensorConfiguration)))
  "Returns md5sum for a message object of type 'SensorConfiguration"
  "431839fe505be3082a74c763bbc714ec")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SensorConfiguration>)))
  "Returns full string definition for message of type '<SensorConfiguration>"
  (cl:format cl:nil "float32 longitudinal #Longitudinal sensor position (AUTOSAR)~%float32 lateral #Lateral sensor position (AUTOSAR)~%float32 vertical #Vertical sensor position (AUTOSAR)~%float32 yaw #Sensor yaw angle (AUTOSAR)~%float32 pitch #Sensor pitch angle (AUTOSAR)~%uint8 plugorientation #Orientation of plug~%float32 length #Vehicle length~%float32 width #Vehicle width~%float32 height #Vehicle height~%float32 wheelbase #Vehicle wheelbase~%uint16 maximumdistance #Maximum detection distance~%uint8 frequencslot #Center frequency (if MaximumDistance < 190 m only Mid can be selected)~%uint8 cycletime #Cycle time~%uint8 timeslot #Cycle offset~%uint8 hcc #Country code~%uint8 powersave_standstill #Power saving in standstill~%uint32 sensoripaddress_0 #Sensor IP address~%uint32 sensoripaddress_1 #Reserved (Configure as 2852025457 or 169.254.116.113)~%uint8 newsensormounting #Flag if new sensor mounting position shall be configured~%uint8 newvehicleparameters #Flag if new vehicle parameters position shall be configured~%uint8 newradarparameters #Flag if new radar parameter shall be configured~%uint8 newnetworkconfiguration # Flag if new IP address shall be configured~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SensorConfiguration)))
  "Returns full string definition for message of type 'SensorConfiguration"
  (cl:format cl:nil "float32 longitudinal #Longitudinal sensor position (AUTOSAR)~%float32 lateral #Lateral sensor position (AUTOSAR)~%float32 vertical #Vertical sensor position (AUTOSAR)~%float32 yaw #Sensor yaw angle (AUTOSAR)~%float32 pitch #Sensor pitch angle (AUTOSAR)~%uint8 plugorientation #Orientation of plug~%float32 length #Vehicle length~%float32 width #Vehicle width~%float32 height #Vehicle height~%float32 wheelbase #Vehicle wheelbase~%uint16 maximumdistance #Maximum detection distance~%uint8 frequencslot #Center frequency (if MaximumDistance < 190 m only Mid can be selected)~%uint8 cycletime #Cycle time~%uint8 timeslot #Cycle offset~%uint8 hcc #Country code~%uint8 powersave_standstill #Power saving in standstill~%uint32 sensoripaddress_0 #Sensor IP address~%uint32 sensoripaddress_1 #Reserved (Configure as 2852025457 or 169.254.116.113)~%uint8 newsensormounting #Flag if new sensor mounting position shall be configured~%uint8 newvehicleparameters #Flag if new vehicle parameters position shall be configured~%uint8 newradarparameters #Flag if new radar parameter shall be configured~%uint8 newnetworkconfiguration # Flag if new IP address shall be configured~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SensorConfiguration>))
  (cl:+ 0
     4
     4
     4
     4
     4
     1
     4
     4
     4
     4
     2
     1
     1
     1
     1
     1
     4
     4
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SensorConfiguration>))
  "Converts a ROS message object to a list"
  (cl:list 'SensorConfiguration
    (cl:cons ':longitudinal (longitudinal msg))
    (cl:cons ':lateral (lateral msg))
    (cl:cons ':vertical (vertical msg))
    (cl:cons ':yaw (yaw msg))
    (cl:cons ':pitch (pitch msg))
    (cl:cons ':plugorientation (plugorientation msg))
    (cl:cons ':length (length msg))
    (cl:cons ':width (width msg))
    (cl:cons ':height (height msg))
    (cl:cons ':wheelbase (wheelbase msg))
    (cl:cons ':maximumdistance (maximumdistance msg))
    (cl:cons ':frequencslot (frequencslot msg))
    (cl:cons ':cycletime (cycletime msg))
    (cl:cons ':timeslot (timeslot msg))
    (cl:cons ':hcc (hcc msg))
    (cl:cons ':powersave_standstill (powersave_standstill msg))
    (cl:cons ':sensoripaddress_0 (sensoripaddress_0 msg))
    (cl:cons ':sensoripaddress_1 (sensoripaddress_1 msg))
    (cl:cons ':newsensormounting (newsensormounting msg))
    (cl:cons ':newvehicleparameters (newvehicleparameters msg))
    (cl:cons ':newradarparameters (newradarparameters msg))
    (cl:cons ':newnetworkconfiguration (newnetworkconfiguration msg))
))
