; Auto-generated. Do not edit!


(cl:in-package ars548_messages-msg)


;//! \htmlinclude DrivingDirection.msg.html

(cl:defclass <DrivingDirection> (roslisp-msg-protocol:ros-message)
  ((drivingdirectionunconfirmed
    :reader drivingdirectionunconfirmed
    :initarg :drivingdirectionunconfirmed
    :type cl:fixnum
    :initform 0)
   (drivingdirectionconfirmed
    :reader drivingdirectionconfirmed
    :initarg :drivingdirectionconfirmed
    :type cl:fixnum
    :initform 0))
)

(cl:defclass DrivingDirection (<DrivingDirection>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DrivingDirection>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DrivingDirection)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ars548_messages-msg:<DrivingDirection> is deprecated: use ars548_messages-msg:DrivingDirection instead.")))

(cl:ensure-generic-function 'drivingdirectionunconfirmed-val :lambda-list '(m))
(cl:defmethod drivingdirectionunconfirmed-val ((m <DrivingDirection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:drivingdirectionunconfirmed-val is deprecated.  Use ars548_messages-msg:drivingdirectionunconfirmed instead.")
  (drivingdirectionunconfirmed m))

(cl:ensure-generic-function 'drivingdirectionconfirmed-val :lambda-list '(m))
(cl:defmethod drivingdirectionconfirmed-val ((m <DrivingDirection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:drivingdirectionconfirmed-val is deprecated.  Use ars548_messages-msg:drivingdirectionconfirmed instead.")
  (drivingdirectionconfirmed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DrivingDirection>) ostream)
  "Serializes a message object of type '<DrivingDirection>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'drivingdirectionunconfirmed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'drivingdirectionconfirmed)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DrivingDirection>) istream)
  "Deserializes a message object of type '<DrivingDirection>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'drivingdirectionunconfirmed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'drivingdirectionconfirmed)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DrivingDirection>)))
  "Returns string type for a message object of type '<DrivingDirection>"
  "ars548_messages/DrivingDirection")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DrivingDirection)))
  "Returns string type for a message object of type 'DrivingDirection"
  "ars548_messages/DrivingDirection")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DrivingDirection>)))
  "Returns md5sum for a message object of type '<DrivingDirection>"
  "ca13186e93f09072774d4d57d6065639")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DrivingDirection)))
  "Returns md5sum for a message object of type 'DrivingDirection"
  "ca13186e93f09072774d4d57d6065639")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DrivingDirection>)))
  "Returns full string definition for message of type '<DrivingDirection>"
  (cl:format cl:nil "uint8 drivingdirectionunconfirmed #(unused) Unconfirmed driving direction~%uint8 drivingdirectionconfirmed # Confirmed driving direction~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DrivingDirection)))
  "Returns full string definition for message of type 'DrivingDirection"
  (cl:format cl:nil "uint8 drivingdirectionunconfirmed #(unused) Unconfirmed driving direction~%uint8 drivingdirectionconfirmed # Confirmed driving direction~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DrivingDirection>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DrivingDirection>))
  "Converts a ROS message object to a list"
  (cl:list 'DrivingDirection
    (cl:cons ':drivingdirectionunconfirmed (drivingdirectionunconfirmed msg))
    (cl:cons ':drivingdirectionconfirmed (drivingdirectionconfirmed msg))
))
