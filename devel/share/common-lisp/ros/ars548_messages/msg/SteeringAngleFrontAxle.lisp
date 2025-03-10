; Auto-generated. Do not edit!


(cl:in-package ars548_messages-msg)


;//! \htmlinclude SteeringAngleFrontAxle.msg.html

(cl:defclass <SteeringAngleFrontAxle> (roslisp-msg-protocol:ros-message)
  ((qualifiersteeringanglefrontaxle
    :reader qualifiersteeringanglefrontaxle
    :initarg :qualifiersteeringanglefrontaxle
    :type cl:fixnum
    :initform 0)
   (steeringanglefrontaxleerramp
    :reader steeringanglefrontaxleerramp
    :initarg :steeringanglefrontaxleerramp
    :type cl:float
    :initform 0.0)
   (steeringanglefrontaxleerramp_invalidflag
    :reader steeringanglefrontaxleerramp_invalidflag
    :initarg :steeringanglefrontaxleerramp_invalidflag
    :type cl:fixnum
    :initform 0)
   (steeringanglefrontaxle
    :reader steeringanglefrontaxle
    :initarg :steeringanglefrontaxle
    :type cl:float
    :initform 0.0)
   (steeringanglefrontaxle_invalidflag
    :reader steeringanglefrontaxle_invalidflag
    :initarg :steeringanglefrontaxle_invalidflag
    :type cl:fixnum
    :initform 0)
   (steeringanglefrontaxleeventdataqualifier
    :reader steeringanglefrontaxleeventdataqualifier
    :initarg :steeringanglefrontaxleeventdataqualifier
    :type cl:fixnum
    :initform 0))
)

(cl:defclass SteeringAngleFrontAxle (<SteeringAngleFrontAxle>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SteeringAngleFrontAxle>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SteeringAngleFrontAxle)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ars548_messages-msg:<SteeringAngleFrontAxle> is deprecated: use ars548_messages-msg:SteeringAngleFrontAxle instead.")))

(cl:ensure-generic-function 'qualifiersteeringanglefrontaxle-val :lambda-list '(m))
(cl:defmethod qualifiersteeringanglefrontaxle-val ((m <SteeringAngleFrontAxle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:qualifiersteeringanglefrontaxle-val is deprecated.  Use ars548_messages-msg:qualifiersteeringanglefrontaxle instead.")
  (qualifiersteeringanglefrontaxle m))

(cl:ensure-generic-function 'steeringanglefrontaxleerramp-val :lambda-list '(m))
(cl:defmethod steeringanglefrontaxleerramp-val ((m <SteeringAngleFrontAxle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:steeringanglefrontaxleerramp-val is deprecated.  Use ars548_messages-msg:steeringanglefrontaxleerramp instead.")
  (steeringanglefrontaxleerramp m))

(cl:ensure-generic-function 'steeringanglefrontaxleerramp_invalidflag-val :lambda-list '(m))
(cl:defmethod steeringanglefrontaxleerramp_invalidflag-val ((m <SteeringAngleFrontAxle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:steeringanglefrontaxleerramp_invalidflag-val is deprecated.  Use ars548_messages-msg:steeringanglefrontaxleerramp_invalidflag instead.")
  (steeringanglefrontaxleerramp_invalidflag m))

(cl:ensure-generic-function 'steeringanglefrontaxle-val :lambda-list '(m))
(cl:defmethod steeringanglefrontaxle-val ((m <SteeringAngleFrontAxle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:steeringanglefrontaxle-val is deprecated.  Use ars548_messages-msg:steeringanglefrontaxle instead.")
  (steeringanglefrontaxle m))

(cl:ensure-generic-function 'steeringanglefrontaxle_invalidflag-val :lambda-list '(m))
(cl:defmethod steeringanglefrontaxle_invalidflag-val ((m <SteeringAngleFrontAxle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:steeringanglefrontaxle_invalidflag-val is deprecated.  Use ars548_messages-msg:steeringanglefrontaxle_invalidflag instead.")
  (steeringanglefrontaxle_invalidflag m))

(cl:ensure-generic-function 'steeringanglefrontaxleeventdataqualifier-val :lambda-list '(m))
(cl:defmethod steeringanglefrontaxleeventdataqualifier-val ((m <SteeringAngleFrontAxle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:steeringanglefrontaxleeventdataqualifier-val is deprecated.  Use ars548_messages-msg:steeringanglefrontaxleeventdataqualifier instead.")
  (steeringanglefrontaxleeventdataqualifier m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SteeringAngleFrontAxle>) ostream)
  "Serializes a message object of type '<SteeringAngleFrontAxle>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'qualifiersteeringanglefrontaxle)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'steeringanglefrontaxleerramp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'steeringanglefrontaxleerramp_invalidflag)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'steeringanglefrontaxle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'steeringanglefrontaxle_invalidflag)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'steeringanglefrontaxleeventdataqualifier)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SteeringAngleFrontAxle>) istream)
  "Deserializes a message object of type '<SteeringAngleFrontAxle>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'qualifiersteeringanglefrontaxle)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'steeringanglefrontaxleerramp) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'steeringanglefrontaxleerramp_invalidflag)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'steeringanglefrontaxle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'steeringanglefrontaxle_invalidflag)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'steeringanglefrontaxleeventdataqualifier)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SteeringAngleFrontAxle>)))
  "Returns string type for a message object of type '<SteeringAngleFrontAxle>"
  "ars548_messages/SteeringAngleFrontAxle")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SteeringAngleFrontAxle)))
  "Returns string type for a message object of type 'SteeringAngleFrontAxle"
  "ars548_messages/SteeringAngleFrontAxle")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SteeringAngleFrontAxle>)))
  "Returns md5sum for a message object of type '<SteeringAngleFrontAxle>"
  "165f91e8ecdcab06db8015b2dbf74ced")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SteeringAngleFrontAxle)))
  "Returns md5sum for a message object of type 'SteeringAngleFrontAxle"
  "165f91e8ecdcab06db8015b2dbf74ced")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SteeringAngleFrontAxle>)))
  "Returns full string definition for message of type '<SteeringAngleFrontAxle>"
  (cl:format cl:nil "uint8 qualifiersteeringanglefrontaxle #(unused) Steering angle front axle qualifier~%float32 steeringanglefrontaxleerramp #(unused) Error amplitude of steering angle front axle~%uint8 steeringanglefrontaxleerramp_invalidflag #(unused) Invalid flag steering angle front axle errAmp~%float32 steeringanglefrontaxle #Steering angle front axle~%uint8 steeringanglefrontaxle_invalidflag #(unused) Invalid flag steeting angle front axle~%uint8 steeringanglefrontaxleeventdataqualifier #(unused) Event data qualifier steering angle front axle~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SteeringAngleFrontAxle)))
  "Returns full string definition for message of type 'SteeringAngleFrontAxle"
  (cl:format cl:nil "uint8 qualifiersteeringanglefrontaxle #(unused) Steering angle front axle qualifier~%float32 steeringanglefrontaxleerramp #(unused) Error amplitude of steering angle front axle~%uint8 steeringanglefrontaxleerramp_invalidflag #(unused) Invalid flag steering angle front axle errAmp~%float32 steeringanglefrontaxle #Steering angle front axle~%uint8 steeringanglefrontaxle_invalidflag #(unused) Invalid flag steeting angle front axle~%uint8 steeringanglefrontaxleeventdataqualifier #(unused) Event data qualifier steering angle front axle~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SteeringAngleFrontAxle>))
  (cl:+ 0
     1
     4
     1
     4
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SteeringAngleFrontAxle>))
  "Converts a ROS message object to a list"
  (cl:list 'SteeringAngleFrontAxle
    (cl:cons ':qualifiersteeringanglefrontaxle (qualifiersteeringanglefrontaxle msg))
    (cl:cons ':steeringanglefrontaxleerramp (steeringanglefrontaxleerramp msg))
    (cl:cons ':steeringanglefrontaxleerramp_invalidflag (steeringanglefrontaxleerramp_invalidflag msg))
    (cl:cons ':steeringanglefrontaxle (steeringanglefrontaxle msg))
    (cl:cons ':steeringanglefrontaxle_invalidflag (steeringanglefrontaxle_invalidflag msg))
    (cl:cons ':steeringanglefrontaxleeventdataqualifier (steeringanglefrontaxleeventdataqualifier msg))
))
