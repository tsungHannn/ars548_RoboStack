; Auto-generated. Do not edit!


(cl:in-package ars548_messages-msg)


;//! \htmlinclude DetectionList.msg.html

(cl:defclass <DetectionList> (roslisp-msg-protocol:ros-message)
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
   (origin_invalidflags
    :reader origin_invalidflags
    :initarg :origin_invalidflags
    :type cl:fixnum
    :initform 0)
   (origin_xpos
    :reader origin_xpos
    :initarg :origin_xpos
    :type cl:float
    :initform 0.0)
   (origin_xstd
    :reader origin_xstd
    :initarg :origin_xstd
    :type cl:float
    :initform 0.0)
   (origin_ypos
    :reader origin_ypos
    :initarg :origin_ypos
    :type cl:float
    :initform 0.0)
   (origin_ystd
    :reader origin_ystd
    :initarg :origin_ystd
    :type cl:float
    :initform 0.0)
   (origin_zpos
    :reader origin_zpos
    :initarg :origin_zpos
    :type cl:float
    :initform 0.0)
   (origin_zstd
    :reader origin_zstd
    :initarg :origin_zstd
    :type cl:float
    :initform 0.0)
   (origin_roll
    :reader origin_roll
    :initarg :origin_roll
    :type cl:float
    :initform 0.0)
   (origin_rollstd
    :reader origin_rollstd
    :initarg :origin_rollstd
    :type cl:float
    :initform 0.0)
   (origin_pitch
    :reader origin_pitch
    :initarg :origin_pitch
    :type cl:float
    :initform 0.0)
   (origin_pitchstd
    :reader origin_pitchstd
    :initarg :origin_pitchstd
    :type cl:float
    :initform 0.0)
   (origin_yaw
    :reader origin_yaw
    :initarg :origin_yaw
    :type cl:float
    :initform 0.0)
   (origin_yawstd
    :reader origin_yawstd
    :initarg :origin_yawstd
    :type cl:float
    :initform 0.0)
   (list_invalidflags
    :reader list_invalidflags
    :initarg :list_invalidflags
    :type cl:fixnum
    :initform 0)
   (list_detections
    :reader list_detections
    :initarg :list_detections
    :type (cl:vector ars548_messages-msg:Detection)
   :initform (cl:make-array 800 :element-type 'ars548_messages-msg:Detection :initial-element (cl:make-instance 'ars548_messages-msg:Detection)))
   (list_radveldomain_min
    :reader list_radveldomain_min
    :initarg :list_radveldomain_min
    :type cl:float
    :initform 0.0)
   (list_radveldomain_max
    :reader list_radveldomain_max
    :initarg :list_radveldomain_max
    :type cl:float
    :initform 0.0)
   (list_numofdetections
    :reader list_numofdetections
    :initarg :list_numofdetections
    :type cl:integer
    :initform 0)
   (aln_azimuthcorrection
    :reader aln_azimuthcorrection
    :initarg :aln_azimuthcorrection
    :type cl:float
    :initform 0.0)
   (aln_elevationcorrection
    :reader aln_elevationcorrection
    :initarg :aln_elevationcorrection
    :type cl:float
    :initform 0.0)
   (aln_status
    :reader aln_status
    :initarg :aln_status
    :type cl:fixnum
    :initform 0))
)

(cl:defclass DetectionList (<DetectionList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DetectionList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DetectionList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ars548_messages-msg:<DetectionList> is deprecated: use ars548_messages-msg:DetectionList instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:header-val is deprecated.  Use ars548_messages-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'crc-val :lambda-list '(m))
(cl:defmethod crc-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:crc-val is deprecated.  Use ars548_messages-msg:crc instead.")
  (crc m))

(cl:ensure-generic-function 'length-val :lambda-list '(m))
(cl:defmethod length-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:length-val is deprecated.  Use ars548_messages-msg:length instead.")
  (length m))

(cl:ensure-generic-function 'sqc-val :lambda-list '(m))
(cl:defmethod sqc-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:sqc-val is deprecated.  Use ars548_messages-msg:sqc instead.")
  (sqc m))

(cl:ensure-generic-function 'dataid-val :lambda-list '(m))
(cl:defmethod dataid-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:dataid-val is deprecated.  Use ars548_messages-msg:dataid instead.")
  (dataid m))

(cl:ensure-generic-function 'timestamp_nanoseconds-val :lambda-list '(m))
(cl:defmethod timestamp_nanoseconds-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:timestamp_nanoseconds-val is deprecated.  Use ars548_messages-msg:timestamp_nanoseconds instead.")
  (timestamp_nanoseconds m))

(cl:ensure-generic-function 'timestamp_seconds-val :lambda-list '(m))
(cl:defmethod timestamp_seconds-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:timestamp_seconds-val is deprecated.  Use ars548_messages-msg:timestamp_seconds instead.")
  (timestamp_seconds m))

(cl:ensure-generic-function 'timestamp_syncstatus-val :lambda-list '(m))
(cl:defmethod timestamp_syncstatus-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:timestamp_syncstatus-val is deprecated.  Use ars548_messages-msg:timestamp_syncstatus instead.")
  (timestamp_syncstatus m))

(cl:ensure-generic-function 'eventdataqualifier-val :lambda-list '(m))
(cl:defmethod eventdataqualifier-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:eventdataqualifier-val is deprecated.  Use ars548_messages-msg:eventdataqualifier instead.")
  (eventdataqualifier m))

(cl:ensure-generic-function 'extendedqualifier-val :lambda-list '(m))
(cl:defmethod extendedqualifier-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:extendedqualifier-val is deprecated.  Use ars548_messages-msg:extendedqualifier instead.")
  (extendedqualifier m))

(cl:ensure-generic-function 'origin_invalidflags-val :lambda-list '(m))
(cl:defmethod origin_invalidflags-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:origin_invalidflags-val is deprecated.  Use ars548_messages-msg:origin_invalidflags instead.")
  (origin_invalidflags m))

(cl:ensure-generic-function 'origin_xpos-val :lambda-list '(m))
(cl:defmethod origin_xpos-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:origin_xpos-val is deprecated.  Use ars548_messages-msg:origin_xpos instead.")
  (origin_xpos m))

(cl:ensure-generic-function 'origin_xstd-val :lambda-list '(m))
(cl:defmethod origin_xstd-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:origin_xstd-val is deprecated.  Use ars548_messages-msg:origin_xstd instead.")
  (origin_xstd m))

(cl:ensure-generic-function 'origin_ypos-val :lambda-list '(m))
(cl:defmethod origin_ypos-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:origin_ypos-val is deprecated.  Use ars548_messages-msg:origin_ypos instead.")
  (origin_ypos m))

(cl:ensure-generic-function 'origin_ystd-val :lambda-list '(m))
(cl:defmethod origin_ystd-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:origin_ystd-val is deprecated.  Use ars548_messages-msg:origin_ystd instead.")
  (origin_ystd m))

(cl:ensure-generic-function 'origin_zpos-val :lambda-list '(m))
(cl:defmethod origin_zpos-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:origin_zpos-val is deprecated.  Use ars548_messages-msg:origin_zpos instead.")
  (origin_zpos m))

(cl:ensure-generic-function 'origin_zstd-val :lambda-list '(m))
(cl:defmethod origin_zstd-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:origin_zstd-val is deprecated.  Use ars548_messages-msg:origin_zstd instead.")
  (origin_zstd m))

(cl:ensure-generic-function 'origin_roll-val :lambda-list '(m))
(cl:defmethod origin_roll-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:origin_roll-val is deprecated.  Use ars548_messages-msg:origin_roll instead.")
  (origin_roll m))

(cl:ensure-generic-function 'origin_rollstd-val :lambda-list '(m))
(cl:defmethod origin_rollstd-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:origin_rollstd-val is deprecated.  Use ars548_messages-msg:origin_rollstd instead.")
  (origin_rollstd m))

(cl:ensure-generic-function 'origin_pitch-val :lambda-list '(m))
(cl:defmethod origin_pitch-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:origin_pitch-val is deprecated.  Use ars548_messages-msg:origin_pitch instead.")
  (origin_pitch m))

(cl:ensure-generic-function 'origin_pitchstd-val :lambda-list '(m))
(cl:defmethod origin_pitchstd-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:origin_pitchstd-val is deprecated.  Use ars548_messages-msg:origin_pitchstd instead.")
  (origin_pitchstd m))

(cl:ensure-generic-function 'origin_yaw-val :lambda-list '(m))
(cl:defmethod origin_yaw-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:origin_yaw-val is deprecated.  Use ars548_messages-msg:origin_yaw instead.")
  (origin_yaw m))

(cl:ensure-generic-function 'origin_yawstd-val :lambda-list '(m))
(cl:defmethod origin_yawstd-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:origin_yawstd-val is deprecated.  Use ars548_messages-msg:origin_yawstd instead.")
  (origin_yawstd m))

(cl:ensure-generic-function 'list_invalidflags-val :lambda-list '(m))
(cl:defmethod list_invalidflags-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:list_invalidflags-val is deprecated.  Use ars548_messages-msg:list_invalidflags instead.")
  (list_invalidflags m))

(cl:ensure-generic-function 'list_detections-val :lambda-list '(m))
(cl:defmethod list_detections-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:list_detections-val is deprecated.  Use ars548_messages-msg:list_detections instead.")
  (list_detections m))

(cl:ensure-generic-function 'list_radveldomain_min-val :lambda-list '(m))
(cl:defmethod list_radveldomain_min-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:list_radveldomain_min-val is deprecated.  Use ars548_messages-msg:list_radveldomain_min instead.")
  (list_radveldomain_min m))

(cl:ensure-generic-function 'list_radveldomain_max-val :lambda-list '(m))
(cl:defmethod list_radveldomain_max-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:list_radveldomain_max-val is deprecated.  Use ars548_messages-msg:list_radveldomain_max instead.")
  (list_radveldomain_max m))

(cl:ensure-generic-function 'list_numofdetections-val :lambda-list '(m))
(cl:defmethod list_numofdetections-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:list_numofdetections-val is deprecated.  Use ars548_messages-msg:list_numofdetections instead.")
  (list_numofdetections m))

(cl:ensure-generic-function 'aln_azimuthcorrection-val :lambda-list '(m))
(cl:defmethod aln_azimuthcorrection-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:aln_azimuthcorrection-val is deprecated.  Use ars548_messages-msg:aln_azimuthcorrection instead.")
  (aln_azimuthcorrection m))

(cl:ensure-generic-function 'aln_elevationcorrection-val :lambda-list '(m))
(cl:defmethod aln_elevationcorrection-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:aln_elevationcorrection-val is deprecated.  Use ars548_messages-msg:aln_elevationcorrection instead.")
  (aln_elevationcorrection m))

(cl:ensure-generic-function 'aln_status-val :lambda-list '(m))
(cl:defmethod aln_status-val ((m <DetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:aln_status-val is deprecated.  Use ars548_messages-msg:aln_status instead.")
  (aln_status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DetectionList>) ostream)
  "Serializes a message object of type '<DetectionList>"
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
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'origin_invalidflags)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'origin_invalidflags)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'origin_xpos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'origin_xstd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'origin_ypos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'origin_ystd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'origin_zpos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'origin_zstd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'origin_roll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'origin_rollstd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'origin_pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'origin_pitchstd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'origin_yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'origin_yawstd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'list_invalidflags)) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'list_detections))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'list_radveldomain_min))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'list_radveldomain_max))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'list_numofdetections)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'list_numofdetections)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'list_numofdetections)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'list_numofdetections)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'aln_azimuthcorrection))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'aln_elevationcorrection))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'aln_status)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DetectionList>) istream)
  "Deserializes a message object of type '<DetectionList>"
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
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'origin_invalidflags)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'origin_invalidflags)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'origin_xpos) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'origin_xstd) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'origin_ypos) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'origin_ystd) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'origin_zpos) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'origin_zstd) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'origin_roll) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'origin_rollstd) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'origin_pitch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'origin_pitchstd) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'origin_yaw) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'origin_yawstd) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'list_invalidflags)) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'list_detections) (cl:make-array 800))
  (cl:let ((vals (cl:slot-value msg 'list_detections)))
    (cl:dotimes (i 800)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ars548_messages-msg:Detection))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'list_radveldomain_min) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'list_radveldomain_max) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'list_numofdetections)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'list_numofdetections)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'list_numofdetections)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'list_numofdetections)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'aln_azimuthcorrection) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'aln_elevationcorrection) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'aln_status)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DetectionList>)))
  "Returns string type for a message object of type '<DetectionList>"
  "ars548_messages/DetectionList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DetectionList)))
  "Returns string type for a message object of type 'DetectionList"
  "ars548_messages/DetectionList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DetectionList>)))
  "Returns md5sum for a message object of type '<DetectionList>"
  "dfc9cd5cc1729d9eb247feb85b81b126")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DetectionList)))
  "Returns md5sum for a message object of type 'DetectionList"
  "dfc9cd5cc1729d9eb247feb85b81b126")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DetectionList>)))
  "Returns full string definition for message of type '<DetectionList>"
  (cl:format cl:nil "std_msgs/Header header~%uint64 crc #Checksum (E2E Profile 7) (Reserved)~%uint32 length #Len (E2E Profile 7) (Reserved)~%uint32 sqc #SQC (E2E Profile 7) (Reserved)~%uint32 dataid #Data ID (E2E Profile 7) (Reserved)~%uint32 timestamp_nanoseconds #Timestamp Nanoseconds~%uint32 timestamp_seconds #Timestamp Seconds~%uint8 timestamp_syncstatus #Timestamp Sync Status~%uint32 eventdataqualifier #Event Data Qualifier (unused)~%uint8 extendedqualifier #Extended Qualifier (unused)~%uint16 origin_invalidflags #Sensor Position Invalid flags (unused)~%float32 origin_xpos #Sensor X Position with reference to rear axle~%float32 origin_xstd #Sensor X Position STD (unused)~%float32 origin_ypos #Sensor Y Position with reference to rear axle~%float32 origin_ystd #Sensor Y Position STD (unused)~%float32 origin_zpos #Sensor Z Position with reference to rear axle~%float32 origin_zstd #Sensor Z Position STD (unused)~%float32 origin_roll #Sensor Roll Angle (unused)~%float32 origin_rollstd #Sensor Roll Angle STD (unused)~%float32 origin_pitch #Sensor Pitch Angle with alignment correction~%float32 origin_pitchstd #Sensor Pitch Angle STD~%float32 origin_yaw #Sensor Yaw Angle with alignment correction~%float32 origin_yawstd #Sensor Yaw Angle STD~%uint8 list_invalidflags #Invalid flags (unused)~%Detection[800] list_detections #Detection Array~%float32 list_radveldomain_min #Ambiguity free Doppler velocity range Min~%float32 list_radveldomain_max #Ambiguity free Doppler velocity range Max~%uint32 list_numofdetections #Number of Detections~%float32 aln_azimuthcorrection #Azimuth Alignment Correction~%float32 aln_elevationcorrection #Elevation Alignment Correction~%uint8 aln_status #Status of alignment~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ars548_messages/Detection~%float32 f_azimuthangle #Unaligned Detection Azimuth Angle~%float32 f_azimuthanglestd #Azimuth Angle Std~%uint8 u_invalidflags #Detection Invalid Flags ~%float32 f_elevationangle #Unaligned Detection Elevation Angle~%float32 f_elevationanglestd #Elevation Angle Std~%float32 f_range #Detection Radial Distance~%float32 f_rangestd #Radial Distance Std~%float32 f_rangerate #Detection Radial Velocity~%float32 f_rangeratestd #Radial Velocity Std~%int8 s_rcs #Detection RCS~%uint16 u_measurementid #Detection ID~%uint8 u_positivepredictivevalue #Existence Probability~%uint8 u_classification #Detection Classification~%uint8 u_multitargetprobabilitym #Multi-Target Probability~%uint16 u_objectid #Associated Object ID~%uint8 u_ambiguityflag #Probability for resolved velocity ambiguity~%uint16 u_sortindex #tbd~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DetectionList)))
  "Returns full string definition for message of type 'DetectionList"
  (cl:format cl:nil "std_msgs/Header header~%uint64 crc #Checksum (E2E Profile 7) (Reserved)~%uint32 length #Len (E2E Profile 7) (Reserved)~%uint32 sqc #SQC (E2E Profile 7) (Reserved)~%uint32 dataid #Data ID (E2E Profile 7) (Reserved)~%uint32 timestamp_nanoseconds #Timestamp Nanoseconds~%uint32 timestamp_seconds #Timestamp Seconds~%uint8 timestamp_syncstatus #Timestamp Sync Status~%uint32 eventdataqualifier #Event Data Qualifier (unused)~%uint8 extendedqualifier #Extended Qualifier (unused)~%uint16 origin_invalidflags #Sensor Position Invalid flags (unused)~%float32 origin_xpos #Sensor X Position with reference to rear axle~%float32 origin_xstd #Sensor X Position STD (unused)~%float32 origin_ypos #Sensor Y Position with reference to rear axle~%float32 origin_ystd #Sensor Y Position STD (unused)~%float32 origin_zpos #Sensor Z Position with reference to rear axle~%float32 origin_zstd #Sensor Z Position STD (unused)~%float32 origin_roll #Sensor Roll Angle (unused)~%float32 origin_rollstd #Sensor Roll Angle STD (unused)~%float32 origin_pitch #Sensor Pitch Angle with alignment correction~%float32 origin_pitchstd #Sensor Pitch Angle STD~%float32 origin_yaw #Sensor Yaw Angle with alignment correction~%float32 origin_yawstd #Sensor Yaw Angle STD~%uint8 list_invalidflags #Invalid flags (unused)~%Detection[800] list_detections #Detection Array~%float32 list_radveldomain_min #Ambiguity free Doppler velocity range Min~%float32 list_radveldomain_max #Ambiguity free Doppler velocity range Max~%uint32 list_numofdetections #Number of Detections~%float32 aln_azimuthcorrection #Azimuth Alignment Correction~%float32 aln_elevationcorrection #Elevation Alignment Correction~%uint8 aln_status #Status of alignment~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ars548_messages/Detection~%float32 f_azimuthangle #Unaligned Detection Azimuth Angle~%float32 f_azimuthanglestd #Azimuth Angle Std~%uint8 u_invalidflags #Detection Invalid Flags ~%float32 f_elevationangle #Unaligned Detection Elevation Angle~%float32 f_elevationanglestd #Elevation Angle Std~%float32 f_range #Detection Radial Distance~%float32 f_rangestd #Radial Distance Std~%float32 f_rangerate #Detection Radial Velocity~%float32 f_rangeratestd #Radial Velocity Std~%int8 s_rcs #Detection RCS~%uint16 u_measurementid #Detection ID~%uint8 u_positivepredictivevalue #Existence Probability~%uint8 u_classification #Detection Classification~%uint8 u_multitargetprobabilitym #Multi-Target Probability~%uint16 u_objectid #Associated Object ID~%uint8 u_ambiguityflag #Probability for resolved velocity ambiguity~%uint16 u_sortindex #tbd~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DetectionList>))
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
     2
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     1
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'list_detections) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4
     4
     4
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DetectionList>))
  "Converts a ROS message object to a list"
  (cl:list 'DetectionList
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
    (cl:cons ':origin_invalidflags (origin_invalidflags msg))
    (cl:cons ':origin_xpos (origin_xpos msg))
    (cl:cons ':origin_xstd (origin_xstd msg))
    (cl:cons ':origin_ypos (origin_ypos msg))
    (cl:cons ':origin_ystd (origin_ystd msg))
    (cl:cons ':origin_zpos (origin_zpos msg))
    (cl:cons ':origin_zstd (origin_zstd msg))
    (cl:cons ':origin_roll (origin_roll msg))
    (cl:cons ':origin_rollstd (origin_rollstd msg))
    (cl:cons ':origin_pitch (origin_pitch msg))
    (cl:cons ':origin_pitchstd (origin_pitchstd msg))
    (cl:cons ':origin_yaw (origin_yaw msg))
    (cl:cons ':origin_yawstd (origin_yawstd msg))
    (cl:cons ':list_invalidflags (list_invalidflags msg))
    (cl:cons ':list_detections (list_detections msg))
    (cl:cons ':list_radveldomain_min (list_radveldomain_min msg))
    (cl:cons ':list_radveldomain_max (list_radveldomain_max msg))
    (cl:cons ':list_numofdetections (list_numofdetections msg))
    (cl:cons ':aln_azimuthcorrection (aln_azimuthcorrection msg))
    (cl:cons ':aln_elevationcorrection (aln_elevationcorrection msg))
    (cl:cons ':aln_status (aln_status msg))
))
