; Auto-generated. Do not edit!


(cl:in-package ars548_messages-msg)


;//! \htmlinclude AccelerationLongitudinalCoG.msg.html

(cl:defclass <AccelerationLongitudinalCoG> (roslisp-msg-protocol:ros-message)
  ((accelerationlongitudinalerramp
    :reader accelerationlongitudinalerramp
    :initarg :accelerationlongitudinalerramp
    :type cl:float
    :initform 0.0)
   (accelerationlongitudinalerramp_invalidflag
    :reader accelerationlongitudinalerramp_invalidflag
    :initarg :accelerationlongitudinalerramp_invalidflag
    :type cl:fixnum
    :initform 0)
   (qualifieraccelerationlongitudinal
    :reader qualifieraccelerationlongitudinal
    :initarg :qualifieraccelerationlongitudinal
    :type cl:fixnum
    :initform 0)
   (accelerationlongitudinal
    :reader accelerationlongitudinal
    :initarg :accelerationlongitudinal
    :type cl:float
    :initform 0.0)
   (accelerationlongitudinal_invalidflag
    :reader accelerationlongitudinal_invalidflag
    :initarg :accelerationlongitudinal_invalidflag
    :type cl:fixnum
    :initform 0)
   (accelerationlongitudinaleventdataqualifier
    :reader accelerationlongitudinaleventdataqualifier
    :initarg :accelerationlongitudinaleventdataqualifier
    :type cl:fixnum
    :initform 0))
)

(cl:defclass AccelerationLongitudinalCoG (<AccelerationLongitudinalCoG>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AccelerationLongitudinalCoG>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AccelerationLongitudinalCoG)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ars548_messages-msg:<AccelerationLongitudinalCoG> is deprecated: use ars548_messages-msg:AccelerationLongitudinalCoG instead.")))

(cl:ensure-generic-function 'accelerationlongitudinalerramp-val :lambda-list '(m))
(cl:defmethod accelerationlongitudinalerramp-val ((m <AccelerationLongitudinalCoG>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:accelerationlongitudinalerramp-val is deprecated.  Use ars548_messages-msg:accelerationlongitudinalerramp instead.")
  (accelerationlongitudinalerramp m))

(cl:ensure-generic-function 'accelerationlongitudinalerramp_invalidflag-val :lambda-list '(m))
(cl:defmethod accelerationlongitudinalerramp_invalidflag-val ((m <AccelerationLongitudinalCoG>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:accelerationlongitudinalerramp_invalidflag-val is deprecated.  Use ars548_messages-msg:accelerationlongitudinalerramp_invalidflag instead.")
  (accelerationlongitudinalerramp_invalidflag m))

(cl:ensure-generic-function 'qualifieraccelerationlongitudinal-val :lambda-list '(m))
(cl:defmethod qualifieraccelerationlongitudinal-val ((m <AccelerationLongitudinalCoG>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:qualifieraccelerationlongitudinal-val is deprecated.  Use ars548_messages-msg:qualifieraccelerationlongitudinal instead.")
  (qualifieraccelerationlongitudinal m))

(cl:ensure-generic-function 'accelerationlongitudinal-val :lambda-list '(m))
(cl:defmethod accelerationlongitudinal-val ((m <AccelerationLongitudinalCoG>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:accelerationlongitudinal-val is deprecated.  Use ars548_messages-msg:accelerationlongitudinal instead.")
  (accelerationlongitudinal m))

(cl:ensure-generic-function 'accelerationlongitudinal_invalidflag-val :lambda-list '(m))
(cl:defmethod accelerationlongitudinal_invalidflag-val ((m <AccelerationLongitudinalCoG>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:accelerationlongitudinal_invalidflag-val is deprecated.  Use ars548_messages-msg:accelerationlongitudinal_invalidflag instead.")
  (accelerationlongitudinal_invalidflag m))

(cl:ensure-generic-function 'accelerationlongitudinaleventdataqualifier-val :lambda-list '(m))
(cl:defmethod accelerationlongitudinaleventdataqualifier-val ((m <AccelerationLongitudinalCoG>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:accelerationlongitudinaleventdataqualifier-val is deprecated.  Use ars548_messages-msg:accelerationlongitudinaleventdataqualifier instead.")
  (accelerationlongitudinaleventdataqualifier m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AccelerationLongitudinalCoG>) ostream)
  "Serializes a message object of type '<AccelerationLongitudinalCoG>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'accelerationlongitudinalerramp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'accelerationlongitudinalerramp_invalidflag)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'qualifieraccelerationlongitudinal)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'accelerationlongitudinal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'accelerationlongitudinal_invalidflag)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'accelerationlongitudinaleventdataqualifier)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AccelerationLongitudinalCoG>) istream)
  "Deserializes a message object of type '<AccelerationLongitudinalCoG>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'accelerationlongitudinalerramp) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'accelerationlongitudinalerramp_invalidflag)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'qualifieraccelerationlongitudinal)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'accelerationlongitudinal) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'accelerationlongitudinal_invalidflag)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'accelerationlongitudinaleventdataqualifier)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AccelerationLongitudinalCoG>)))
  "Returns string type for a message object of type '<AccelerationLongitudinalCoG>"
  "ars548_messages/AccelerationLongitudinalCoG")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AccelerationLongitudinalCoG)))
  "Returns string type for a message object of type 'AccelerationLongitudinalCoG"
  "ars548_messages/AccelerationLongitudinalCoG")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AccelerationLongitudinalCoG>)))
  "Returns md5sum for a message object of type '<AccelerationLongitudinalCoG>"
  "0eafbbce434bfbd2d5decf0da9141fd7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AccelerationLongitudinalCoG)))
  "Returns md5sum for a message object of type 'AccelerationLongitudinalCoG"
  "0eafbbce434bfbd2d5decf0da9141fd7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AccelerationLongitudinalCoG>)))
  "Returns full string definition for message of type '<AccelerationLongitudinalCoG>"
  (cl:format cl:nil "float32 accelerationlongitudinalerramp #(Unused) Error amplitude of longitudinal acceleration~%uint8 accelerationlongitudinalerramp_invalidflag #(Unused) Invalid Flags AccelLongErrAmp ~%uint8 qualifieraccelerationlongitudinal #(Unused) Longitudinal Acceleration Qualifier ~%float32 accelerationlongitudinal #Longitudinal Acceleration~%uint8 accelerationlongitudinal_invalidflag #(Unused) Invalid Flag Longitudinal Acceleration ~%uint8 accelerationlongitudinaleventdataqualifier #(Unused) Event Data Qualifier Longitudinal Acceleration ~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AccelerationLongitudinalCoG)))
  "Returns full string definition for message of type 'AccelerationLongitudinalCoG"
  (cl:format cl:nil "float32 accelerationlongitudinalerramp #(Unused) Error amplitude of longitudinal acceleration~%uint8 accelerationlongitudinalerramp_invalidflag #(Unused) Invalid Flags AccelLongErrAmp ~%uint8 qualifieraccelerationlongitudinal #(Unused) Longitudinal Acceleration Qualifier ~%float32 accelerationlongitudinal #Longitudinal Acceleration~%uint8 accelerationlongitudinal_invalidflag #(Unused) Invalid Flag Longitudinal Acceleration ~%uint8 accelerationlongitudinaleventdataqualifier #(Unused) Event Data Qualifier Longitudinal Acceleration ~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AccelerationLongitudinalCoG>))
  (cl:+ 0
     4
     1
     1
     4
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AccelerationLongitudinalCoG>))
  "Converts a ROS message object to a list"
  (cl:list 'AccelerationLongitudinalCoG
    (cl:cons ':accelerationlongitudinalerramp (accelerationlongitudinalerramp msg))
    (cl:cons ':accelerationlongitudinalerramp_invalidflag (accelerationlongitudinalerramp_invalidflag msg))
    (cl:cons ':qualifieraccelerationlongitudinal (qualifieraccelerationlongitudinal msg))
    (cl:cons ':accelerationlongitudinal (accelerationlongitudinal msg))
    (cl:cons ':accelerationlongitudinal_invalidflag (accelerationlongitudinal_invalidflag msg))
    (cl:cons ':accelerationlongitudinaleventdataqualifier (accelerationlongitudinaleventdataqualifier msg))
))
