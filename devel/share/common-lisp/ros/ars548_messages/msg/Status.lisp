; Auto-generated. Do not edit!


(cl:in-package ars548_messages-msg)


;//! \htmlinclude Status.msg.html

(cl:defclass <Status> (roslisp-msg-protocol:ros-message)
  ((timestamp_nanoseconds
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
   (swversion_major
    :reader swversion_major
    :initarg :swversion_major
    :type cl:fixnum
    :initform 0)
   (swversion_minor
    :reader swversion_minor
    :initarg :swversion_minor
    :type cl:fixnum
    :initform 0)
   (swversion_patch
    :reader swversion_patch
    :initarg :swversion_patch
    :type cl:fixnum
    :initform 0)
   (longitudinal
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
   (maximundistance
    :reader maximundistance
    :initarg :maximundistance
    :type cl:fixnum
    :initform 0)
   (frequencyslot
    :reader frequencyslot
    :initarg :frequencyslot
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
   (configurationcounter
    :reader configurationcounter
    :initarg :configurationcounter
    :type cl:fixnum
    :initform 0)
   (status_longitudinalvelocity
    :reader status_longitudinalvelocity
    :initarg :status_longitudinalvelocity
    :type cl:fixnum
    :initform 0)
   (status_longitudinalacceleration
    :reader status_longitudinalacceleration
    :initarg :status_longitudinalacceleration
    :type cl:fixnum
    :initform 0)
   (status_lateralacceleration
    :reader status_lateralacceleration
    :initarg :status_lateralacceleration
    :type cl:fixnum
    :initform 0)
   (status_yawrate
    :reader status_yawrate
    :initarg :status_yawrate
    :type cl:fixnum
    :initform 0)
   (status_steeringangle
    :reader status_steeringangle
    :initarg :status_steeringangle
    :type cl:fixnum
    :initform 0)
   (status_drivingdirection
    :reader status_drivingdirection
    :initarg :status_drivingdirection
    :type cl:fixnum
    :initform 0)
   (status_characteristicspeed
    :reader status_characteristicspeed
    :initarg :status_characteristicspeed
    :type cl:fixnum
    :initform 0)
   (status_radarstatus
    :reader status_radarstatus
    :initarg :status_radarstatus
    :type cl:fixnum
    :initform 0)
   (status_voltagestatus
    :reader status_voltagestatus
    :initarg :status_voltagestatus
    :type cl:fixnum
    :initform 0)
   (status_temperaturestatus
    :reader status_temperaturestatus
    :initarg :status_temperaturestatus
    :type cl:fixnum
    :initform 0)
   (status_blockagestatus
    :reader status_blockagestatus
    :initarg :status_blockagestatus
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Status (<Status>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Status>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Status)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ars548_messages-msg:<Status> is deprecated: use ars548_messages-msg:Status instead.")))

(cl:ensure-generic-function 'timestamp_nanoseconds-val :lambda-list '(m))
(cl:defmethod timestamp_nanoseconds-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:timestamp_nanoseconds-val is deprecated.  Use ars548_messages-msg:timestamp_nanoseconds instead.")
  (timestamp_nanoseconds m))

(cl:ensure-generic-function 'timestamp_seconds-val :lambda-list '(m))
(cl:defmethod timestamp_seconds-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:timestamp_seconds-val is deprecated.  Use ars548_messages-msg:timestamp_seconds instead.")
  (timestamp_seconds m))

(cl:ensure-generic-function 'timestamp_syncstatus-val :lambda-list '(m))
(cl:defmethod timestamp_syncstatus-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:timestamp_syncstatus-val is deprecated.  Use ars548_messages-msg:timestamp_syncstatus instead.")
  (timestamp_syncstatus m))

(cl:ensure-generic-function 'swversion_major-val :lambda-list '(m))
(cl:defmethod swversion_major-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:swversion_major-val is deprecated.  Use ars548_messages-msg:swversion_major instead.")
  (swversion_major m))

(cl:ensure-generic-function 'swversion_minor-val :lambda-list '(m))
(cl:defmethod swversion_minor-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:swversion_minor-val is deprecated.  Use ars548_messages-msg:swversion_minor instead.")
  (swversion_minor m))

(cl:ensure-generic-function 'swversion_patch-val :lambda-list '(m))
(cl:defmethod swversion_patch-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:swversion_patch-val is deprecated.  Use ars548_messages-msg:swversion_patch instead.")
  (swversion_patch m))

(cl:ensure-generic-function 'longitudinal-val :lambda-list '(m))
(cl:defmethod longitudinal-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:longitudinal-val is deprecated.  Use ars548_messages-msg:longitudinal instead.")
  (longitudinal m))

(cl:ensure-generic-function 'lateral-val :lambda-list '(m))
(cl:defmethod lateral-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:lateral-val is deprecated.  Use ars548_messages-msg:lateral instead.")
  (lateral m))

(cl:ensure-generic-function 'vertical-val :lambda-list '(m))
(cl:defmethod vertical-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:vertical-val is deprecated.  Use ars548_messages-msg:vertical instead.")
  (vertical m))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:yaw-val is deprecated.  Use ars548_messages-msg:yaw instead.")
  (yaw m))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:pitch-val is deprecated.  Use ars548_messages-msg:pitch instead.")
  (pitch m))

(cl:ensure-generic-function 'plugorientation-val :lambda-list '(m))
(cl:defmethod plugorientation-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:plugorientation-val is deprecated.  Use ars548_messages-msg:plugorientation instead.")
  (plugorientation m))

(cl:ensure-generic-function 'length-val :lambda-list '(m))
(cl:defmethod length-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:length-val is deprecated.  Use ars548_messages-msg:length instead.")
  (length m))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:width-val is deprecated.  Use ars548_messages-msg:width instead.")
  (width m))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:height-val is deprecated.  Use ars548_messages-msg:height instead.")
  (height m))

(cl:ensure-generic-function 'wheelbase-val :lambda-list '(m))
(cl:defmethod wheelbase-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:wheelbase-val is deprecated.  Use ars548_messages-msg:wheelbase instead.")
  (wheelbase m))

(cl:ensure-generic-function 'maximundistance-val :lambda-list '(m))
(cl:defmethod maximundistance-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:maximundistance-val is deprecated.  Use ars548_messages-msg:maximundistance instead.")
  (maximundistance m))

(cl:ensure-generic-function 'frequencyslot-val :lambda-list '(m))
(cl:defmethod frequencyslot-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:frequencyslot-val is deprecated.  Use ars548_messages-msg:frequencyslot instead.")
  (frequencyslot m))

(cl:ensure-generic-function 'cycletime-val :lambda-list '(m))
(cl:defmethod cycletime-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:cycletime-val is deprecated.  Use ars548_messages-msg:cycletime instead.")
  (cycletime m))

(cl:ensure-generic-function 'timeslot-val :lambda-list '(m))
(cl:defmethod timeslot-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:timeslot-val is deprecated.  Use ars548_messages-msg:timeslot instead.")
  (timeslot m))

(cl:ensure-generic-function 'hcc-val :lambda-list '(m))
(cl:defmethod hcc-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:hcc-val is deprecated.  Use ars548_messages-msg:hcc instead.")
  (hcc m))

(cl:ensure-generic-function 'powersave_standstill-val :lambda-list '(m))
(cl:defmethod powersave_standstill-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:powersave_standstill-val is deprecated.  Use ars548_messages-msg:powersave_standstill instead.")
  (powersave_standstill m))

(cl:ensure-generic-function 'sensoripaddress_0-val :lambda-list '(m))
(cl:defmethod sensoripaddress_0-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:sensoripaddress_0-val is deprecated.  Use ars548_messages-msg:sensoripaddress_0 instead.")
  (sensoripaddress_0 m))

(cl:ensure-generic-function 'sensoripaddress_1-val :lambda-list '(m))
(cl:defmethod sensoripaddress_1-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:sensoripaddress_1-val is deprecated.  Use ars548_messages-msg:sensoripaddress_1 instead.")
  (sensoripaddress_1 m))

(cl:ensure-generic-function 'configurationcounter-val :lambda-list '(m))
(cl:defmethod configurationcounter-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:configurationcounter-val is deprecated.  Use ars548_messages-msg:configurationcounter instead.")
  (configurationcounter m))

(cl:ensure-generic-function 'status_longitudinalvelocity-val :lambda-list '(m))
(cl:defmethod status_longitudinalvelocity-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:status_longitudinalvelocity-val is deprecated.  Use ars548_messages-msg:status_longitudinalvelocity instead.")
  (status_longitudinalvelocity m))

(cl:ensure-generic-function 'status_longitudinalacceleration-val :lambda-list '(m))
(cl:defmethod status_longitudinalacceleration-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:status_longitudinalacceleration-val is deprecated.  Use ars548_messages-msg:status_longitudinalacceleration instead.")
  (status_longitudinalacceleration m))

(cl:ensure-generic-function 'status_lateralacceleration-val :lambda-list '(m))
(cl:defmethod status_lateralacceleration-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:status_lateralacceleration-val is deprecated.  Use ars548_messages-msg:status_lateralacceleration instead.")
  (status_lateralacceleration m))

(cl:ensure-generic-function 'status_yawrate-val :lambda-list '(m))
(cl:defmethod status_yawrate-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:status_yawrate-val is deprecated.  Use ars548_messages-msg:status_yawrate instead.")
  (status_yawrate m))

(cl:ensure-generic-function 'status_steeringangle-val :lambda-list '(m))
(cl:defmethod status_steeringangle-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:status_steeringangle-val is deprecated.  Use ars548_messages-msg:status_steeringangle instead.")
  (status_steeringangle m))

(cl:ensure-generic-function 'status_drivingdirection-val :lambda-list '(m))
(cl:defmethod status_drivingdirection-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:status_drivingdirection-val is deprecated.  Use ars548_messages-msg:status_drivingdirection instead.")
  (status_drivingdirection m))

(cl:ensure-generic-function 'status_characteristicspeed-val :lambda-list '(m))
(cl:defmethod status_characteristicspeed-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:status_characteristicspeed-val is deprecated.  Use ars548_messages-msg:status_characteristicspeed instead.")
  (status_characteristicspeed m))

(cl:ensure-generic-function 'status_radarstatus-val :lambda-list '(m))
(cl:defmethod status_radarstatus-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:status_radarstatus-val is deprecated.  Use ars548_messages-msg:status_radarstatus instead.")
  (status_radarstatus m))

(cl:ensure-generic-function 'status_voltagestatus-val :lambda-list '(m))
(cl:defmethod status_voltagestatus-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:status_voltagestatus-val is deprecated.  Use ars548_messages-msg:status_voltagestatus instead.")
  (status_voltagestatus m))

(cl:ensure-generic-function 'status_temperaturestatus-val :lambda-list '(m))
(cl:defmethod status_temperaturestatus-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:status_temperaturestatus-val is deprecated.  Use ars548_messages-msg:status_temperaturestatus instead.")
  (status_temperaturestatus m))

(cl:ensure-generic-function 'status_blockagestatus-val :lambda-list '(m))
(cl:defmethod status_blockagestatus-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:status_blockagestatus-val is deprecated.  Use ars548_messages-msg:status_blockagestatus instead.")
  (status_blockagestatus m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Status>) ostream)
  "Serializes a message object of type '<Status>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timestamp_nanoseconds)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timestamp_nanoseconds)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'timestamp_nanoseconds)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'timestamp_nanoseconds)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timestamp_seconds)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timestamp_seconds)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'timestamp_seconds)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'timestamp_seconds)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timestamp_syncstatus)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'swversion_major)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'swversion_minor)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'swversion_patch)) ostream)
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
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'maximundistance)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'maximundistance)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'frequencyslot)) ostream)
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
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'configurationcounter)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status_longitudinalvelocity)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status_longitudinalacceleration)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status_lateralacceleration)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status_yawrate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status_steeringangle)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status_drivingdirection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status_characteristicspeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status_radarstatus)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status_voltagestatus)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status_temperaturestatus)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status_blockagestatus)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Status>) istream)
  "Deserializes a message object of type '<Status>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timestamp_nanoseconds)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timestamp_nanoseconds)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'timestamp_nanoseconds)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'timestamp_nanoseconds)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timestamp_seconds)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timestamp_seconds)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'timestamp_seconds)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'timestamp_seconds)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timestamp_syncstatus)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'swversion_major)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'swversion_minor)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'swversion_patch)) (cl:read-byte istream))
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
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'maximundistance)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'maximundistance)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'frequencyslot)) (cl:read-byte istream))
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
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'configurationcounter)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status_longitudinalvelocity)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status_longitudinalacceleration)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status_lateralacceleration)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status_yawrate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status_steeringangle)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status_drivingdirection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status_characteristicspeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status_radarstatus)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status_voltagestatus)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status_temperaturestatus)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status_blockagestatus)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Status>)))
  "Returns string type for a message object of type '<Status>"
  "ars548_messages/Status")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Status)))
  "Returns string type for a message object of type 'Status"
  "ars548_messages/Status")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Status>)))
  "Returns md5sum for a message object of type '<Status>"
  "434403d6c9393e6a7279af521716619e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Status)))
  "Returns md5sum for a message object of type 'Status"
  "434403d6c9393e6a7279af521716619e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Status>)))
  "Returns full string definition for message of type '<Status>"
  (cl:format cl:nil "uint32 timestamp_nanoseconds #Timestamp Nanoseconds~%uint32 timestamp_seconds #Timestamp Seconds~%uint8 timestamp_syncstatus #Timestamp Sync Status~%uint8 swversion_major #Software version (major)~%uint8 swversion_minor #Software version (minor)~%uint8 swversion_patch #Software version (patch)~%float32 longitudinal #Longitudinal sensor position (AUTOSAR)~%float32 lateral #Lateral sensor position (AUTOSAR)~%float32 vertical #Vertical sensor position (AUTOSAR)~%float32 yaw #Sensor yaw angle (AUTOSAR)~%float32 pitch #Sensor pitch angle (AUTOSAR)~%uint8 plugorientation #Orientation of plug~%float32 length #Vehicle length~%float32 width #Vehicle width~%float32 height #Vehicle height~%float32 wheelbase #Vehicle wheelbase~%uint16 maximundistance #Maximum detection distance~%uint8 frequencyslot #Center frequency~%uint8 cycletime #Cycle time~%uint8 timeslot #Cycle offset~%uint8 hcc #Country code~%uint8 powersave_standstill #Power saving in standstill~%uint32 sensoripaddress_0 #Sensor IP address~%uint32 sensoripaddress_1 #Reserved~%uint8 configurationcounter #Counter that counts up if new configuration has been received and accepted~%uint8 status_longitudinalvelocity #Signals if current VDY is OK or timed out~%uint8 status_longitudinalacceleration #Signals if current VDY is OK or timed out~%uint8 status_lateralacceleration #Signals if current VDY is OK or timed out~%uint8 status_yawrate #Signals if current VDY is OK or timed out~%uint8 status_steeringangle #Signals if current VDY is OK or timed out~%uint8 status_drivingdirection #Signals if current VDY is OK or timed out~%uint8 status_characteristicspeed #(Unused) Signals if current VDY is OK or timed out.~%uint8 status_radarstatus #Signals if Radar Status is OK~%uint8 status_voltagestatus # Bitfield to report under- and overvoltage errors~%uint8 status_temperaturestatus #Bitfield to report under- and overtemperature errors~%uint8 status_blockagestatus #Current blockage state and blockage self test state.~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Status)))
  "Returns full string definition for message of type 'Status"
  (cl:format cl:nil "uint32 timestamp_nanoseconds #Timestamp Nanoseconds~%uint32 timestamp_seconds #Timestamp Seconds~%uint8 timestamp_syncstatus #Timestamp Sync Status~%uint8 swversion_major #Software version (major)~%uint8 swversion_minor #Software version (minor)~%uint8 swversion_patch #Software version (patch)~%float32 longitudinal #Longitudinal sensor position (AUTOSAR)~%float32 lateral #Lateral sensor position (AUTOSAR)~%float32 vertical #Vertical sensor position (AUTOSAR)~%float32 yaw #Sensor yaw angle (AUTOSAR)~%float32 pitch #Sensor pitch angle (AUTOSAR)~%uint8 plugorientation #Orientation of plug~%float32 length #Vehicle length~%float32 width #Vehicle width~%float32 height #Vehicle height~%float32 wheelbase #Vehicle wheelbase~%uint16 maximundistance #Maximum detection distance~%uint8 frequencyslot #Center frequency~%uint8 cycletime #Cycle time~%uint8 timeslot #Cycle offset~%uint8 hcc #Country code~%uint8 powersave_standstill #Power saving in standstill~%uint32 sensoripaddress_0 #Sensor IP address~%uint32 sensoripaddress_1 #Reserved~%uint8 configurationcounter #Counter that counts up if new configuration has been received and accepted~%uint8 status_longitudinalvelocity #Signals if current VDY is OK or timed out~%uint8 status_longitudinalacceleration #Signals if current VDY is OK or timed out~%uint8 status_lateralacceleration #Signals if current VDY is OK or timed out~%uint8 status_yawrate #Signals if current VDY is OK or timed out~%uint8 status_steeringangle #Signals if current VDY is OK or timed out~%uint8 status_drivingdirection #Signals if current VDY is OK or timed out~%uint8 status_characteristicspeed #(Unused) Signals if current VDY is OK or timed out.~%uint8 status_radarstatus #Signals if Radar Status is OK~%uint8 status_voltagestatus # Bitfield to report under- and overvoltage errors~%uint8 status_temperaturestatus #Bitfield to report under- and overtemperature errors~%uint8 status_blockagestatus #Current blockage state and blockage self test state.~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Status>))
  (cl:+ 0
     4
     4
     1
     1
     1
     1
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
     1
     1
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Status>))
  "Converts a ROS message object to a list"
  (cl:list 'Status
    (cl:cons ':timestamp_nanoseconds (timestamp_nanoseconds msg))
    (cl:cons ':timestamp_seconds (timestamp_seconds msg))
    (cl:cons ':timestamp_syncstatus (timestamp_syncstatus msg))
    (cl:cons ':swversion_major (swversion_major msg))
    (cl:cons ':swversion_minor (swversion_minor msg))
    (cl:cons ':swversion_patch (swversion_patch msg))
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
    (cl:cons ':maximundistance (maximundistance msg))
    (cl:cons ':frequencyslot (frequencyslot msg))
    (cl:cons ':cycletime (cycletime msg))
    (cl:cons ':timeslot (timeslot msg))
    (cl:cons ':hcc (hcc msg))
    (cl:cons ':powersave_standstill (powersave_standstill msg))
    (cl:cons ':sensoripaddress_0 (sensoripaddress_0 msg))
    (cl:cons ':sensoripaddress_1 (sensoripaddress_1 msg))
    (cl:cons ':configurationcounter (configurationcounter msg))
    (cl:cons ':status_longitudinalvelocity (status_longitudinalvelocity msg))
    (cl:cons ':status_longitudinalacceleration (status_longitudinalacceleration msg))
    (cl:cons ':status_lateralacceleration (status_lateralacceleration msg))
    (cl:cons ':status_yawrate (status_yawrate msg))
    (cl:cons ':status_steeringangle (status_steeringangle msg))
    (cl:cons ':status_drivingdirection (status_drivingdirection msg))
    (cl:cons ':status_characteristicspeed (status_characteristicspeed msg))
    (cl:cons ':status_radarstatus (status_radarstatus msg))
    (cl:cons ':status_voltagestatus (status_voltagestatus msg))
    (cl:cons ':status_temperaturestatus (status_temperaturestatus msg))
    (cl:cons ':status_blockagestatus (status_blockagestatus msg))
))
