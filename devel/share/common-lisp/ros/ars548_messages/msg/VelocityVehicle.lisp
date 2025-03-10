; Auto-generated. Do not edit!


(cl:in-package ars548_messages-msg)


;//! \htmlinclude VelocityVehicle.msg.html

(cl:defclass <VelocityVehicle> (roslisp-msg-protocol:ros-message)
  ((statusvelocitynearstandstill
    :reader statusvelocitynearstandstill
    :initarg :statusvelocitynearstandstill
    :type cl:fixnum
    :initform 0)
   (qualifiervelocityvehicle
    :reader qualifiervelocityvehicle
    :initarg :qualifiervelocityvehicle
    :type cl:fixnum
    :initform 0)
   (velocityvehicleeventdataqualifier
    :reader velocityvehicleeventdataqualifier
    :initarg :velocityvehicleeventdataqualifier
    :type cl:fixnum
    :initform 0)
   (velocityvehicle
    :reader velocityvehicle
    :initarg :velocityvehicle
    :type cl:float
    :initform 0.0)
   (velocityvehicle_invalidflag
    :reader velocityvehicle_invalidflag
    :initarg :velocityvehicle_invalidflag
    :type cl:fixnum
    :initform 0))
)

(cl:defclass VelocityVehicle (<VelocityVehicle>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VelocityVehicle>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VelocityVehicle)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ars548_messages-msg:<VelocityVehicle> is deprecated: use ars548_messages-msg:VelocityVehicle instead.")))

(cl:ensure-generic-function 'statusvelocitynearstandstill-val :lambda-list '(m))
(cl:defmethod statusvelocitynearstandstill-val ((m <VelocityVehicle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:statusvelocitynearstandstill-val is deprecated.  Use ars548_messages-msg:statusvelocitynearstandstill instead.")
  (statusvelocitynearstandstill m))

(cl:ensure-generic-function 'qualifiervelocityvehicle-val :lambda-list '(m))
(cl:defmethod qualifiervelocityvehicle-val ((m <VelocityVehicle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:qualifiervelocityvehicle-val is deprecated.  Use ars548_messages-msg:qualifiervelocityvehicle instead.")
  (qualifiervelocityvehicle m))

(cl:ensure-generic-function 'velocityvehicleeventdataqualifier-val :lambda-list '(m))
(cl:defmethod velocityvehicleeventdataqualifier-val ((m <VelocityVehicle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:velocityvehicleeventdataqualifier-val is deprecated.  Use ars548_messages-msg:velocityvehicleeventdataqualifier instead.")
  (velocityvehicleeventdataqualifier m))

(cl:ensure-generic-function 'velocityvehicle-val :lambda-list '(m))
(cl:defmethod velocityvehicle-val ((m <VelocityVehicle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:velocityvehicle-val is deprecated.  Use ars548_messages-msg:velocityvehicle instead.")
  (velocityvehicle m))

(cl:ensure-generic-function 'velocityvehicle_invalidflag-val :lambda-list '(m))
(cl:defmethod velocityvehicle_invalidflag-val ((m <VelocityVehicle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:velocityvehicle_invalidflag-val is deprecated.  Use ars548_messages-msg:velocityvehicle_invalidflag instead.")
  (velocityvehicle_invalidflag m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VelocityVehicle>) ostream)
  "Serializes a message object of type '<VelocityVehicle>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'statusvelocitynearstandstill)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'qualifiervelocityvehicle)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'velocityvehicleeventdataqualifier)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'velocityvehicle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'velocityvehicle_invalidflag)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VelocityVehicle>) istream)
  "Deserializes a message object of type '<VelocityVehicle>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'statusvelocitynearstandstill)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'qualifiervelocityvehicle)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'velocityvehicleeventdataqualifier)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocityvehicle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'velocityvehicle_invalidflag)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VelocityVehicle>)))
  "Returns string type for a message object of type '<VelocityVehicle>"
  "ars548_messages/VelocityVehicle")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VelocityVehicle)))
  "Returns string type for a message object of type 'VelocityVehicle"
  "ars548_messages/VelocityVehicle")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VelocityVehicle>)))
  "Returns md5sum for a message object of type '<VelocityVehicle>"
  "e3ed8fe15e904859bdc21697bcec872a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VelocityVehicle)))
  "Returns md5sum for a message object of type 'VelocityVehicle"
  "e3ed8fe15e904859bdc21697bcec872a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VelocityVehicle>)))
  "Returns full string definition for message of type '<VelocityVehicle>"
  (cl:format cl:nil "uint8 statusvelocitynearstandstill #(unused) Velocity near standstill status~%uint8 qualifiervelocityvehicle  #(unused) VelovityVehicle qualifier~%uint8 velocityvehicleeventdataqualifier #(unused) Event data qualifier VelocityVehicle~%float32 velocityvehicle # VelocityVehicle~%uint8 velocityvehicle_invalidflag #(unused) Invalid flag VelocityVehicle~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VelocityVehicle)))
  "Returns full string definition for message of type 'VelocityVehicle"
  (cl:format cl:nil "uint8 statusvelocitynearstandstill #(unused) Velocity near standstill status~%uint8 qualifiervelocityvehicle  #(unused) VelovityVehicle qualifier~%uint8 velocityvehicleeventdataqualifier #(unused) Event data qualifier VelocityVehicle~%float32 velocityvehicle # VelocityVehicle~%uint8 velocityvehicle_invalidflag #(unused) Invalid flag VelocityVehicle~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VelocityVehicle>))
  (cl:+ 0
     1
     1
     1
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VelocityVehicle>))
  "Converts a ROS message object to a list"
  (cl:list 'VelocityVehicle
    (cl:cons ':statusvelocitynearstandstill (statusvelocitynearstandstill msg))
    (cl:cons ':qualifiervelocityvehicle (qualifiervelocityvehicle msg))
    (cl:cons ':velocityvehicleeventdataqualifier (velocityvehicleeventdataqualifier msg))
    (cl:cons ':velocityvehicle (velocityvehicle msg))
    (cl:cons ':velocityvehicle_invalidflag (velocityvehicle_invalidflag msg))
))
