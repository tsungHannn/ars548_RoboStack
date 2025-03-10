; Auto-generated. Do not edit!


(cl:in-package ars548_messages-msg)


;//! \htmlinclude CharacteristicSpeed.msg.html

(cl:defclass <CharacteristicSpeed> (roslisp-msg-protocol:ros-message)
  ((characteristicspeederramp
    :reader characteristicspeederramp
    :initarg :characteristicspeederramp
    :type cl:fixnum
    :initform 0)
   (qualifiercharacteristicspeed
    :reader qualifiercharacteristicspeed
    :initarg :qualifiercharacteristicspeed
    :type cl:fixnum
    :initform 0)
   (characteristicspeed
    :reader characteristicspeed
    :initarg :characteristicspeed
    :type cl:fixnum
    :initform 0))
)

(cl:defclass CharacteristicSpeed (<CharacteristicSpeed>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CharacteristicSpeed>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CharacteristicSpeed)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ars548_messages-msg:<CharacteristicSpeed> is deprecated: use ars548_messages-msg:CharacteristicSpeed instead.")))

(cl:ensure-generic-function 'characteristicspeederramp-val :lambda-list '(m))
(cl:defmethod characteristicspeederramp-val ((m <CharacteristicSpeed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:characteristicspeederramp-val is deprecated.  Use ars548_messages-msg:characteristicspeederramp instead.")
  (characteristicspeederramp m))

(cl:ensure-generic-function 'qualifiercharacteristicspeed-val :lambda-list '(m))
(cl:defmethod qualifiercharacteristicspeed-val ((m <CharacteristicSpeed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:qualifiercharacteristicspeed-val is deprecated.  Use ars548_messages-msg:qualifiercharacteristicspeed instead.")
  (qualifiercharacteristicspeed m))

(cl:ensure-generic-function 'characteristicspeed-val :lambda-list '(m))
(cl:defmethod characteristicspeed-val ((m <CharacteristicSpeed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:characteristicspeed-val is deprecated.  Use ars548_messages-msg:characteristicspeed instead.")
  (characteristicspeed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CharacteristicSpeed>) ostream)
  "Serializes a message object of type '<CharacteristicSpeed>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'characteristicspeederramp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'qualifiercharacteristicspeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'characteristicspeed)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CharacteristicSpeed>) istream)
  "Deserializes a message object of type '<CharacteristicSpeed>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'characteristicspeederramp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'qualifiercharacteristicspeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'characteristicspeed)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CharacteristicSpeed>)))
  "Returns string type for a message object of type '<CharacteristicSpeed>"
  "ars548_messages/CharacteristicSpeed")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CharacteristicSpeed)))
  "Returns string type for a message object of type 'CharacteristicSpeed"
  "ars548_messages/CharacteristicSpeed")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CharacteristicSpeed>)))
  "Returns md5sum for a message object of type '<CharacteristicSpeed>"
  "08f85cc48916f7bc1371d09df58338bd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CharacteristicSpeed)))
  "Returns md5sum for a message object of type 'CharacteristicSpeed"
  "08f85cc48916f7bc1371d09df58338bd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CharacteristicSpeed>)))
  "Returns full string definition for message of type '<CharacteristicSpeed>"
  (cl:format cl:nil "uint8 characteristicspeederramp #(Unused) Error amplitude of characteristic speed~%uint8  qualifiercharacteristicspeed #(Unused) Characteristic speed qualifier~%uint8 characteristicspeed # Characteristic speed~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CharacteristicSpeed)))
  "Returns full string definition for message of type 'CharacteristicSpeed"
  (cl:format cl:nil "uint8 characteristicspeederramp #(Unused) Error amplitude of characteristic speed~%uint8  qualifiercharacteristicspeed #(Unused) Characteristic speed qualifier~%uint8 characteristicspeed # Characteristic speed~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CharacteristicSpeed>))
  (cl:+ 0
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CharacteristicSpeed>))
  "Converts a ROS message object to a list"
  (cl:list 'CharacteristicSpeed
    (cl:cons ':characteristicspeederramp (characteristicspeederramp msg))
    (cl:cons ':qualifiercharacteristicspeed (qualifiercharacteristicspeed msg))
    (cl:cons ':characteristicspeed (characteristicspeed msg))
))
