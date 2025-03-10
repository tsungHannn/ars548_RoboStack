; Auto-generated. Do not edit!


(cl:in-package ars548_messages-msg)


;//! \htmlinclude AccelerationLateralCoG.msg.html

(cl:defclass <AccelerationLateralCoG> (roslisp-msg-protocol:ros-message)
  ((accelerationlateralerramp
    :reader accelerationlateralerramp
    :initarg :accelerationlateralerramp
    :type cl:float
    :initform 0.0)
   (accelerationlateralerramp_invalidflag
    :reader accelerationlateralerramp_invalidflag
    :initarg :accelerationlateralerramp_invalidflag
    :type cl:fixnum
    :initform 0)
   (qualifieraccelerationlateral
    :reader qualifieraccelerationlateral
    :initarg :qualifieraccelerationlateral
    :type cl:fixnum
    :initform 0)
   (accelerationlateral
    :reader accelerationlateral
    :initarg :accelerationlateral
    :type cl:float
    :initform 0.0)
   (accelerationlateral_invalidflag
    :reader accelerationlateral_invalidflag
    :initarg :accelerationlateral_invalidflag
    :type cl:fixnum
    :initform 0)
   (accelerationlateraleventdataqualifier
    :reader accelerationlateraleventdataqualifier
    :initarg :accelerationlateraleventdataqualifier
    :type cl:fixnum
    :initform 0))
)

(cl:defclass AccelerationLateralCoG (<AccelerationLateralCoG>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AccelerationLateralCoG>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AccelerationLateralCoG)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ars548_messages-msg:<AccelerationLateralCoG> is deprecated: use ars548_messages-msg:AccelerationLateralCoG instead.")))

(cl:ensure-generic-function 'accelerationlateralerramp-val :lambda-list '(m))
(cl:defmethod accelerationlateralerramp-val ((m <AccelerationLateralCoG>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:accelerationlateralerramp-val is deprecated.  Use ars548_messages-msg:accelerationlateralerramp instead.")
  (accelerationlateralerramp m))

(cl:ensure-generic-function 'accelerationlateralerramp_invalidflag-val :lambda-list '(m))
(cl:defmethod accelerationlateralerramp_invalidflag-val ((m <AccelerationLateralCoG>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:accelerationlateralerramp_invalidflag-val is deprecated.  Use ars548_messages-msg:accelerationlateralerramp_invalidflag instead.")
  (accelerationlateralerramp_invalidflag m))

(cl:ensure-generic-function 'qualifieraccelerationlateral-val :lambda-list '(m))
(cl:defmethod qualifieraccelerationlateral-val ((m <AccelerationLateralCoG>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:qualifieraccelerationlateral-val is deprecated.  Use ars548_messages-msg:qualifieraccelerationlateral instead.")
  (qualifieraccelerationlateral m))

(cl:ensure-generic-function 'accelerationlateral-val :lambda-list '(m))
(cl:defmethod accelerationlateral-val ((m <AccelerationLateralCoG>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:accelerationlateral-val is deprecated.  Use ars548_messages-msg:accelerationlateral instead.")
  (accelerationlateral m))

(cl:ensure-generic-function 'accelerationlateral_invalidflag-val :lambda-list '(m))
(cl:defmethod accelerationlateral_invalidflag-val ((m <AccelerationLateralCoG>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:accelerationlateral_invalidflag-val is deprecated.  Use ars548_messages-msg:accelerationlateral_invalidflag instead.")
  (accelerationlateral_invalidflag m))

(cl:ensure-generic-function 'accelerationlateraleventdataqualifier-val :lambda-list '(m))
(cl:defmethod accelerationlateraleventdataqualifier-val ((m <AccelerationLateralCoG>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:accelerationlateraleventdataqualifier-val is deprecated.  Use ars548_messages-msg:accelerationlateraleventdataqualifier instead.")
  (accelerationlateraleventdataqualifier m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AccelerationLateralCoG>) ostream)
  "Serializes a message object of type '<AccelerationLateralCoG>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'accelerationlateralerramp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'accelerationlateralerramp_invalidflag)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'qualifieraccelerationlateral)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'accelerationlateral))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'accelerationlateral_invalidflag)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'accelerationlateraleventdataqualifier)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AccelerationLateralCoG>) istream)
  "Deserializes a message object of type '<AccelerationLateralCoG>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'accelerationlateralerramp) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'accelerationlateralerramp_invalidflag)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'qualifieraccelerationlateral)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'accelerationlateral) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'accelerationlateral_invalidflag)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'accelerationlateraleventdataqualifier)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AccelerationLateralCoG>)))
  "Returns string type for a message object of type '<AccelerationLateralCoG>"
  "ars548_messages/AccelerationLateralCoG")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AccelerationLateralCoG)))
  "Returns string type for a message object of type 'AccelerationLateralCoG"
  "ars548_messages/AccelerationLateralCoG")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AccelerationLateralCoG>)))
  "Returns md5sum for a message object of type '<AccelerationLateralCoG>"
  "9d1e6bf3d430a2b77911a476ca617783")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AccelerationLateralCoG)))
  "Returns md5sum for a message object of type 'AccelerationLateralCoG"
  "9d1e6bf3d430a2b77911a476ca617783")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AccelerationLateralCoG>)))
  "Returns full string definition for message of type '<AccelerationLateralCoG>"
  (cl:format cl:nil "float32 accelerationlateralerramp #(Unused) Error Amplitude of Lateral Acceleration ~%uint8 accelerationlateralerramp_invalidflag #(Unused) Invalid Flags AccelLatErrAmp  ~%uint8 qualifieraccelerationlateral #(Unused) Lateral Acceleration Qualifier ~%float32 accelerationlateral #Lateral Acceleration~%uint8 accelerationlateral_invalidflag #(Unused) Invalid Flag Lateral Acceleration ~%uint8 accelerationlateraleventdataqualifier #(Unused) Event Data Qualifier Lateral Acceleration ~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AccelerationLateralCoG)))
  "Returns full string definition for message of type 'AccelerationLateralCoG"
  (cl:format cl:nil "float32 accelerationlateralerramp #(Unused) Error Amplitude of Lateral Acceleration ~%uint8 accelerationlateralerramp_invalidflag #(Unused) Invalid Flags AccelLatErrAmp  ~%uint8 qualifieraccelerationlateral #(Unused) Lateral Acceleration Qualifier ~%float32 accelerationlateral #Lateral Acceleration~%uint8 accelerationlateral_invalidflag #(Unused) Invalid Flag Lateral Acceleration ~%uint8 accelerationlateraleventdataqualifier #(Unused) Event Data Qualifier Lateral Acceleration ~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AccelerationLateralCoG>))
  (cl:+ 0
     4
     1
     1
     4
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AccelerationLateralCoG>))
  "Converts a ROS message object to a list"
  (cl:list 'AccelerationLateralCoG
    (cl:cons ':accelerationlateralerramp (accelerationlateralerramp msg))
    (cl:cons ':accelerationlateralerramp_invalidflag (accelerationlateralerramp_invalidflag msg))
    (cl:cons ':qualifieraccelerationlateral (qualifieraccelerationlateral msg))
    (cl:cons ':accelerationlateral (accelerationlateral msg))
    (cl:cons ':accelerationlateral_invalidflag (accelerationlateral_invalidflag msg))
    (cl:cons ':accelerationlateraleventdataqualifier (accelerationlateraleventdataqualifier msg))
))
