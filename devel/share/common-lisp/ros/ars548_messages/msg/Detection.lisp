; Auto-generated. Do not edit!


(cl:in-package ars548_messages-msg)


;//! \htmlinclude Detection.msg.html

(cl:defclass <Detection> (roslisp-msg-protocol:ros-message)
  ((f_azimuthangle
    :reader f_azimuthangle
    :initarg :f_azimuthangle
    :type cl:float
    :initform 0.0)
   (f_azimuthanglestd
    :reader f_azimuthanglestd
    :initarg :f_azimuthanglestd
    :type cl:float
    :initform 0.0)
   (u_invalidflags
    :reader u_invalidflags
    :initarg :u_invalidflags
    :type cl:fixnum
    :initform 0)
   (f_elevationangle
    :reader f_elevationangle
    :initarg :f_elevationangle
    :type cl:float
    :initform 0.0)
   (f_elevationanglestd
    :reader f_elevationanglestd
    :initarg :f_elevationanglestd
    :type cl:float
    :initform 0.0)
   (f_range
    :reader f_range
    :initarg :f_range
    :type cl:float
    :initform 0.0)
   (f_rangestd
    :reader f_rangestd
    :initarg :f_rangestd
    :type cl:float
    :initform 0.0)
   (f_rangerate
    :reader f_rangerate
    :initarg :f_rangerate
    :type cl:float
    :initform 0.0)
   (f_rangeratestd
    :reader f_rangeratestd
    :initarg :f_rangeratestd
    :type cl:float
    :initform 0.0)
   (s_rcs
    :reader s_rcs
    :initarg :s_rcs
    :type cl:fixnum
    :initform 0)
   (u_measurementid
    :reader u_measurementid
    :initarg :u_measurementid
    :type cl:fixnum
    :initform 0)
   (u_positivepredictivevalue
    :reader u_positivepredictivevalue
    :initarg :u_positivepredictivevalue
    :type cl:fixnum
    :initform 0)
   (u_classification
    :reader u_classification
    :initarg :u_classification
    :type cl:fixnum
    :initform 0)
   (u_multitargetprobabilitym
    :reader u_multitargetprobabilitym
    :initarg :u_multitargetprobabilitym
    :type cl:fixnum
    :initform 0)
   (u_objectid
    :reader u_objectid
    :initarg :u_objectid
    :type cl:fixnum
    :initform 0)
   (u_ambiguityflag
    :reader u_ambiguityflag
    :initarg :u_ambiguityflag
    :type cl:fixnum
    :initform 0)
   (u_sortindex
    :reader u_sortindex
    :initarg :u_sortindex
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Detection (<Detection>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Detection>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Detection)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ars548_messages-msg:<Detection> is deprecated: use ars548_messages-msg:Detection instead.")))

(cl:ensure-generic-function 'f_azimuthangle-val :lambda-list '(m))
(cl:defmethod f_azimuthangle-val ((m <Detection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_azimuthangle-val is deprecated.  Use ars548_messages-msg:f_azimuthangle instead.")
  (f_azimuthangle m))

(cl:ensure-generic-function 'f_azimuthanglestd-val :lambda-list '(m))
(cl:defmethod f_azimuthanglestd-val ((m <Detection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_azimuthanglestd-val is deprecated.  Use ars548_messages-msg:f_azimuthanglestd instead.")
  (f_azimuthanglestd m))

(cl:ensure-generic-function 'u_invalidflags-val :lambda-list '(m))
(cl:defmethod u_invalidflags-val ((m <Detection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_invalidflags-val is deprecated.  Use ars548_messages-msg:u_invalidflags instead.")
  (u_invalidflags m))

(cl:ensure-generic-function 'f_elevationangle-val :lambda-list '(m))
(cl:defmethod f_elevationangle-val ((m <Detection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_elevationangle-val is deprecated.  Use ars548_messages-msg:f_elevationangle instead.")
  (f_elevationangle m))

(cl:ensure-generic-function 'f_elevationanglestd-val :lambda-list '(m))
(cl:defmethod f_elevationanglestd-val ((m <Detection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_elevationanglestd-val is deprecated.  Use ars548_messages-msg:f_elevationanglestd instead.")
  (f_elevationanglestd m))

(cl:ensure-generic-function 'f_range-val :lambda-list '(m))
(cl:defmethod f_range-val ((m <Detection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_range-val is deprecated.  Use ars548_messages-msg:f_range instead.")
  (f_range m))

(cl:ensure-generic-function 'f_rangestd-val :lambda-list '(m))
(cl:defmethod f_rangestd-val ((m <Detection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_rangestd-val is deprecated.  Use ars548_messages-msg:f_rangestd instead.")
  (f_rangestd m))

(cl:ensure-generic-function 'f_rangerate-val :lambda-list '(m))
(cl:defmethod f_rangerate-val ((m <Detection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_rangerate-val is deprecated.  Use ars548_messages-msg:f_rangerate instead.")
  (f_rangerate m))

(cl:ensure-generic-function 'f_rangeratestd-val :lambda-list '(m))
(cl:defmethod f_rangeratestd-val ((m <Detection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_rangeratestd-val is deprecated.  Use ars548_messages-msg:f_rangeratestd instead.")
  (f_rangeratestd m))

(cl:ensure-generic-function 's_rcs-val :lambda-list '(m))
(cl:defmethod s_rcs-val ((m <Detection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:s_rcs-val is deprecated.  Use ars548_messages-msg:s_rcs instead.")
  (s_rcs m))

(cl:ensure-generic-function 'u_measurementid-val :lambda-list '(m))
(cl:defmethod u_measurementid-val ((m <Detection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_measurementid-val is deprecated.  Use ars548_messages-msg:u_measurementid instead.")
  (u_measurementid m))

(cl:ensure-generic-function 'u_positivepredictivevalue-val :lambda-list '(m))
(cl:defmethod u_positivepredictivevalue-val ((m <Detection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_positivepredictivevalue-val is deprecated.  Use ars548_messages-msg:u_positivepredictivevalue instead.")
  (u_positivepredictivevalue m))

(cl:ensure-generic-function 'u_classification-val :lambda-list '(m))
(cl:defmethod u_classification-val ((m <Detection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_classification-val is deprecated.  Use ars548_messages-msg:u_classification instead.")
  (u_classification m))

(cl:ensure-generic-function 'u_multitargetprobabilitym-val :lambda-list '(m))
(cl:defmethod u_multitargetprobabilitym-val ((m <Detection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_multitargetprobabilitym-val is deprecated.  Use ars548_messages-msg:u_multitargetprobabilitym instead.")
  (u_multitargetprobabilitym m))

(cl:ensure-generic-function 'u_objectid-val :lambda-list '(m))
(cl:defmethod u_objectid-val ((m <Detection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_objectid-val is deprecated.  Use ars548_messages-msg:u_objectid instead.")
  (u_objectid m))

(cl:ensure-generic-function 'u_ambiguityflag-val :lambda-list '(m))
(cl:defmethod u_ambiguityflag-val ((m <Detection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_ambiguityflag-val is deprecated.  Use ars548_messages-msg:u_ambiguityflag instead.")
  (u_ambiguityflag m))

(cl:ensure-generic-function 'u_sortindex-val :lambda-list '(m))
(cl:defmethod u_sortindex-val ((m <Detection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_sortindex-val is deprecated.  Use ars548_messages-msg:u_sortindex instead.")
  (u_sortindex m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Detection>) ostream)
  "Serializes a message object of type '<Detection>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_azimuthangle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_azimuthanglestd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_invalidflags)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_elevationangle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_elevationanglestd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_range))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_rangestd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_rangerate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_rangeratestd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 's_rcs)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_measurementid)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'u_measurementid)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_positivepredictivevalue)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_classification)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_multitargetprobabilitym)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_objectid)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'u_objectid)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_ambiguityflag)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_sortindex)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'u_sortindex)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Detection>) istream)
  "Deserializes a message object of type '<Detection>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_azimuthangle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_azimuthanglestd) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_invalidflags)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_elevationangle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_elevationanglestd) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_range) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_rangestd) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_rangerate) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_rangeratestd) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 's_rcs) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_measurementid)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'u_measurementid)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_positivepredictivevalue)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_classification)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_multitargetprobabilitym)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_objectid)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'u_objectid)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_ambiguityflag)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_sortindex)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'u_sortindex)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Detection>)))
  "Returns string type for a message object of type '<Detection>"
  "ars548_messages/Detection")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Detection)))
  "Returns string type for a message object of type 'Detection"
  "ars548_messages/Detection")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Detection>)))
  "Returns md5sum for a message object of type '<Detection>"
  "3760b05dc425bea9898067baeb462326")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Detection)))
  "Returns md5sum for a message object of type 'Detection"
  "3760b05dc425bea9898067baeb462326")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Detection>)))
  "Returns full string definition for message of type '<Detection>"
  (cl:format cl:nil "float32 f_azimuthangle #Unaligned Detection Azimuth Angle~%float32 f_azimuthanglestd #Azimuth Angle Std~%uint8 u_invalidflags #Detection Invalid Flags ~%float32 f_elevationangle #Unaligned Detection Elevation Angle~%float32 f_elevationanglestd #Elevation Angle Std~%float32 f_range #Detection Radial Distance~%float32 f_rangestd #Radial Distance Std~%float32 f_rangerate #Detection Radial Velocity~%float32 f_rangeratestd #Radial Velocity Std~%int8 s_rcs #Detection RCS~%uint16 u_measurementid #Detection ID~%uint8 u_positivepredictivevalue #Existence Probability~%uint8 u_classification #Detection Classification~%uint8 u_multitargetprobabilitym #Multi-Target Probability~%uint16 u_objectid #Associated Object ID~%uint8 u_ambiguityflag #Probability for resolved velocity ambiguity~%uint16 u_sortindex #tbd~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Detection)))
  "Returns full string definition for message of type 'Detection"
  (cl:format cl:nil "float32 f_azimuthangle #Unaligned Detection Azimuth Angle~%float32 f_azimuthanglestd #Azimuth Angle Std~%uint8 u_invalidflags #Detection Invalid Flags ~%float32 f_elevationangle #Unaligned Detection Elevation Angle~%float32 f_elevationanglestd #Elevation Angle Std~%float32 f_range #Detection Radial Distance~%float32 f_rangestd #Radial Distance Std~%float32 f_rangerate #Detection Radial Velocity~%float32 f_rangeratestd #Radial Velocity Std~%int8 s_rcs #Detection RCS~%uint16 u_measurementid #Detection ID~%uint8 u_positivepredictivevalue #Existence Probability~%uint8 u_classification #Detection Classification~%uint8 u_multitargetprobabilitym #Multi-Target Probability~%uint16 u_objectid #Associated Object ID~%uint8 u_ambiguityflag #Probability for resolved velocity ambiguity~%uint16 u_sortindex #tbd~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Detection>))
  (cl:+ 0
     4
     4
     1
     4
     4
     4
     4
     4
     4
     1
     2
     1
     1
     1
     2
     1
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Detection>))
  "Converts a ROS message object to a list"
  (cl:list 'Detection
    (cl:cons ':f_azimuthangle (f_azimuthangle msg))
    (cl:cons ':f_azimuthanglestd (f_azimuthanglestd msg))
    (cl:cons ':u_invalidflags (u_invalidflags msg))
    (cl:cons ':f_elevationangle (f_elevationangle msg))
    (cl:cons ':f_elevationanglestd (f_elevationanglestd msg))
    (cl:cons ':f_range (f_range msg))
    (cl:cons ':f_rangestd (f_rangestd msg))
    (cl:cons ':f_rangerate (f_rangerate msg))
    (cl:cons ':f_rangeratestd (f_rangeratestd msg))
    (cl:cons ':s_rcs (s_rcs msg))
    (cl:cons ':u_measurementid (u_measurementid msg))
    (cl:cons ':u_positivepredictivevalue (u_positivepredictivevalue msg))
    (cl:cons ':u_classification (u_classification msg))
    (cl:cons ':u_multitargetprobabilitym (u_multitargetprobabilitym msg))
    (cl:cons ':u_objectid (u_objectid msg))
    (cl:cons ':u_ambiguityflag (u_ambiguityflag msg))
    (cl:cons ':u_sortindex (u_sortindex msg))
))
