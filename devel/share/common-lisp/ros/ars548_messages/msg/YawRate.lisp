; Auto-generated. Do not edit!


(cl:in-package ars548_messages-msg)


;//! \htmlinclude YawRate.msg.html

(cl:defclass <YawRate> (roslisp-msg-protocol:ros-message)
  ((yawrateerramp
    :reader yawrateerramp
    :initarg :yawrateerramp
    :type cl:float
    :initform 0.0)
   (yawrateerramp_invalidflag
    :reader yawrateerramp_invalidflag
    :initarg :yawrateerramp_invalidflag
    :type cl:fixnum
    :initform 0)
   (qualifieryawrate
    :reader qualifieryawrate
    :initarg :qualifieryawrate
    :type cl:fixnum
    :initform 0)
   (yawrate
    :reader yawrate
    :initarg :yawrate
    :type cl:float
    :initform 0.0)
   (yawrate_invalidflag
    :reader yawrate_invalidflag
    :initarg :yawrate_invalidflag
    :type cl:fixnum
    :initform 0)
   (yawrateeventdataqualifier
    :reader yawrateeventdataqualifier
    :initarg :yawrateeventdataqualifier
    :type cl:fixnum
    :initform 0))
)

(cl:defclass YawRate (<YawRate>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <YawRate>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'YawRate)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ars548_messages-msg:<YawRate> is deprecated: use ars548_messages-msg:YawRate instead.")))

(cl:ensure-generic-function 'yawrateerramp-val :lambda-list '(m))
(cl:defmethod yawrateerramp-val ((m <YawRate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:yawrateerramp-val is deprecated.  Use ars548_messages-msg:yawrateerramp instead.")
  (yawrateerramp m))

(cl:ensure-generic-function 'yawrateerramp_invalidflag-val :lambda-list '(m))
(cl:defmethod yawrateerramp_invalidflag-val ((m <YawRate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:yawrateerramp_invalidflag-val is deprecated.  Use ars548_messages-msg:yawrateerramp_invalidflag instead.")
  (yawrateerramp_invalidflag m))

(cl:ensure-generic-function 'qualifieryawrate-val :lambda-list '(m))
(cl:defmethod qualifieryawrate-val ((m <YawRate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:qualifieryawrate-val is deprecated.  Use ars548_messages-msg:qualifieryawrate instead.")
  (qualifieryawrate m))

(cl:ensure-generic-function 'yawrate-val :lambda-list '(m))
(cl:defmethod yawrate-val ((m <YawRate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:yawrate-val is deprecated.  Use ars548_messages-msg:yawrate instead.")
  (yawrate m))

(cl:ensure-generic-function 'yawrate_invalidflag-val :lambda-list '(m))
(cl:defmethod yawrate_invalidflag-val ((m <YawRate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:yawrate_invalidflag-val is deprecated.  Use ars548_messages-msg:yawrate_invalidflag instead.")
  (yawrate_invalidflag m))

(cl:ensure-generic-function 'yawrateeventdataqualifier-val :lambda-list '(m))
(cl:defmethod yawrateeventdataqualifier-val ((m <YawRate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:yawrateeventdataqualifier-val is deprecated.  Use ars548_messages-msg:yawrateeventdataqualifier instead.")
  (yawrateeventdataqualifier m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <YawRate>) ostream)
  "Serializes a message object of type '<YawRate>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yawrateerramp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'yawrateerramp_invalidflag)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'qualifieryawrate)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yawrate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'yawrate_invalidflag)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'yawrateeventdataqualifier)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <YawRate>) istream)
  "Deserializes a message object of type '<YawRate>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yawrateerramp) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'yawrateerramp_invalidflag)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'qualifieryawrate)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yawrate) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'yawrate_invalidflag)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'yawrateeventdataqualifier)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<YawRate>)))
  "Returns string type for a message object of type '<YawRate>"
  "ars548_messages/YawRate")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'YawRate)))
  "Returns string type for a message object of type 'YawRate"
  "ars548_messages/YawRate")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<YawRate>)))
  "Returns md5sum for a message object of type '<YawRate>"
  "5e5ee89741e00a755558196ad380378e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'YawRate)))
  "Returns md5sum for a message object of type 'YawRate"
  "5e5ee89741e00a755558196ad380378e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<YawRate>)))
  "Returns full string definition for message of type '<YawRate>"
  (cl:format cl:nil "float32 yawrateerramp #(Unused) Error Amplitude of YawRate~%uint8 yawrateerramp_invalidflag #(Unused) Invalid flags AccelLatErrAmp~%uint8 qualifieryawrate #(Unused) YawRate qualifier~%float32 yawrate #YawRate~%uint8 yawrate_invalidflag #(Unused) Invalid flag Yaw Rate ~%uint8 yawrateeventdataqualifier #(Unused) Event data qualifier YawRate~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'YawRate)))
  "Returns full string definition for message of type 'YawRate"
  (cl:format cl:nil "float32 yawrateerramp #(Unused) Error Amplitude of YawRate~%uint8 yawrateerramp_invalidflag #(Unused) Invalid flags AccelLatErrAmp~%uint8 qualifieryawrate #(Unused) YawRate qualifier~%float32 yawrate #YawRate~%uint8 yawrate_invalidflag #(Unused) Invalid flag Yaw Rate ~%uint8 yawrateeventdataqualifier #(Unused) Event data qualifier YawRate~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <YawRate>))
  (cl:+ 0
     4
     1
     1
     4
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <YawRate>))
  "Converts a ROS message object to a list"
  (cl:list 'YawRate
    (cl:cons ':yawrateerramp (yawrateerramp msg))
    (cl:cons ':yawrateerramp_invalidflag (yawrateerramp_invalidflag msg))
    (cl:cons ':qualifieryawrate (qualifieryawrate msg))
    (cl:cons ':yawrate (yawrate msg))
    (cl:cons ':yawrate_invalidflag (yawrate_invalidflag msg))
    (cl:cons ':yawrateeventdataqualifier (yawrateeventdataqualifier msg))
))
