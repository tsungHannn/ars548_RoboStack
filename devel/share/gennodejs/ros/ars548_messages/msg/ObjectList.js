// Auto-generated. Do not edit!

// (in-package ars548_messages.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Object = require('./Object.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ObjectList {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.crc = null;
      this.length = null;
      this.sqc = null;
      this.dataid = null;
      this.timestamp_nanoseconds = null;
      this.timestamp_seconds = null;
      this.timestamp_syncstatus = null;
      this.eventdataqualifier = null;
      this.extendedqualifier = null;
      this.objectlist_numofobjects = null;
      this.objectlist_objects = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('crc')) {
        this.crc = initObj.crc
      }
      else {
        this.crc = 0;
      }
      if (initObj.hasOwnProperty('length')) {
        this.length = initObj.length
      }
      else {
        this.length = 0;
      }
      if (initObj.hasOwnProperty('sqc')) {
        this.sqc = initObj.sqc
      }
      else {
        this.sqc = 0;
      }
      if (initObj.hasOwnProperty('dataid')) {
        this.dataid = initObj.dataid
      }
      else {
        this.dataid = 0;
      }
      if (initObj.hasOwnProperty('timestamp_nanoseconds')) {
        this.timestamp_nanoseconds = initObj.timestamp_nanoseconds
      }
      else {
        this.timestamp_nanoseconds = 0;
      }
      if (initObj.hasOwnProperty('timestamp_seconds')) {
        this.timestamp_seconds = initObj.timestamp_seconds
      }
      else {
        this.timestamp_seconds = 0;
      }
      if (initObj.hasOwnProperty('timestamp_syncstatus')) {
        this.timestamp_syncstatus = initObj.timestamp_syncstatus
      }
      else {
        this.timestamp_syncstatus = 0;
      }
      if (initObj.hasOwnProperty('eventdataqualifier')) {
        this.eventdataqualifier = initObj.eventdataqualifier
      }
      else {
        this.eventdataqualifier = 0;
      }
      if (initObj.hasOwnProperty('extendedqualifier')) {
        this.extendedqualifier = initObj.extendedqualifier
      }
      else {
        this.extendedqualifier = 0;
      }
      if (initObj.hasOwnProperty('objectlist_numofobjects')) {
        this.objectlist_numofobjects = initObj.objectlist_numofobjects
      }
      else {
        this.objectlist_numofobjects = 0;
      }
      if (initObj.hasOwnProperty('objectlist_objects')) {
        this.objectlist_objects = initObj.objectlist_objects
      }
      else {
        this.objectlist_objects = new Array(50).fill(new Object());
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ObjectList
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [crc]
    bufferOffset = _serializer.uint64(obj.crc, buffer, bufferOffset);
    // Serialize message field [length]
    bufferOffset = _serializer.uint32(obj.length, buffer, bufferOffset);
    // Serialize message field [sqc]
    bufferOffset = _serializer.uint32(obj.sqc, buffer, bufferOffset);
    // Serialize message field [dataid]
    bufferOffset = _serializer.uint32(obj.dataid, buffer, bufferOffset);
    // Serialize message field [timestamp_nanoseconds]
    bufferOffset = _serializer.uint32(obj.timestamp_nanoseconds, buffer, bufferOffset);
    // Serialize message field [timestamp_seconds]
    bufferOffset = _serializer.uint32(obj.timestamp_seconds, buffer, bufferOffset);
    // Serialize message field [timestamp_syncstatus]
    bufferOffset = _serializer.uint8(obj.timestamp_syncstatus, buffer, bufferOffset);
    // Serialize message field [eventdataqualifier]
    bufferOffset = _serializer.uint32(obj.eventdataqualifier, buffer, bufferOffset);
    // Serialize message field [extendedqualifier]
    bufferOffset = _serializer.uint8(obj.extendedqualifier, buffer, bufferOffset);
    // Serialize message field [objectlist_numofobjects]
    bufferOffset = _serializer.uint8(obj.objectlist_numofobjects, buffer, bufferOffset);
    // Check that the constant length array field [objectlist_objects] has the right length
    if (obj.objectlist_objects.length !== 50) {
      throw new Error('Unable to serialize array field objectlist_objects - length must be 50')
    }
    // Serialize message field [objectlist_objects]
    obj.objectlist_objects.forEach((val) => {
      bufferOffset = Object.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ObjectList
    let len;
    let data = new ObjectList(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [crc]
    data.crc = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [length]
    data.length = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [sqc]
    data.sqc = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [dataid]
    data.dataid = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [timestamp_nanoseconds]
    data.timestamp_nanoseconds = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [timestamp_seconds]
    data.timestamp_seconds = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [timestamp_syncstatus]
    data.timestamp_syncstatus = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [eventdataqualifier]
    data.eventdataqualifier = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [extendedqualifier]
    data.extendedqualifier = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [objectlist_numofobjects]
    data.objectlist_numofobjects = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [objectlist_objects]
    len = 50;
    data.objectlist_objects = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.objectlist_objects[i] = Object.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 9385;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ars548_messages/ObjectList';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c5aad967b1571bd050514e2ef3500c86';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    uint64 crc #Checksum (E2E Profile 7) (Reserved)
    uint32 length #Len (E2E Profile 7) (Reserved)
    uint32 sqc #SQC (E2E Profile 7) (Reserved)
    uint32 dataid #Data ID (E2E Profile 7) (Reserved)
    uint32 timestamp_nanoseconds #Timestamp Nanoseconds
    uint32 timestamp_seconds #Timestamp Seconds
    uint8 timestamp_syncstatus #Timestamp Sync Status
    uint32 eventdataqualifier #(unused) Event Data Qualifier
    uint8 extendedqualifier #(unused) Extended Qualifier 
    uint8 objectlist_numofobjects #Number of Objects
    Object[50] objectlist_objects #Object Array
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: ars548_messages/Object
    uint16 u_statussensor #tbd
    uint32 u_id #Unique ID of object
    uint16 u_age #Age of object
    uint8 u_statusmeasurement #Object Status
    uint8 u_statusmovement #Object Movement Status
    uint16 u_position_invalidflags #tbd
    uint8 u_position_reference #Reference point position
    float32 u_position_x #X Position of reference point
    float32 u_position_x_std #X Position Std
    float32 u_position_y #Y Position of reference point
    float32 u_position_y_std #Y Position Std
    float32 u_position_z #Z Position of reference point
    float32 u_position_z_std #Z Position Std
    float32 u_position_covariancexy #Covariance X Y
    float32 u_position_orientation #Object Orientation
    float32 u_position_orientation_std #Orientation Std
    uint8 u_existence_invalidflags #unused
    float32 u_existence_probability #Probability of Existence
    float32 u_existence_ppv #unused
    uint8 u_classification_car #Car Classification Probability
    uint8 u_classification_truck #Truck Classification Probability
    uint8 u_classification_motorcycle #Motorcycle Classification Probability
    uint8 u_classification_bicycle #Bicycle Classification Probability
    uint8 u_classification_pedestrian #Pedestrian Classification Probability
    uint8 u_classification_animal #Animal Classification Probability
    uint8 u_classification_hazard #Hazard Classification Probability
    uint8 u_classification_unknown #Unknown Classification Probability
    uint8 u_classification_overdrivable #unused
    uint8 u_classification_underdrivable #unused
    uint8 u_dynamics_absvel_invalidflags #unused
    float32 f_dynamics_absvel_x #X Absolute Velocity
    float32 f_dynamics_absvel_x_std #X Absolute Velocity Std
    float32 f_dynamics_absvel_y #Y Absolute Velocity
    float32 f_dynamics_absvel_y_std #Y Absolute Velocity Std
    float32 f_dynamics_absvel_covariancexy #Covariance Absolute Velocity X Y
    uint8 u_dynamics_relvel_invalidflags #unused
    float32 f_dynamics_relvel_x #X Relative Velocity
    float32 f_dynamics_relvel_x_std #X Relative Velocity Std
    float32 f_dynamics_relvel_y #Y Relative Velocity
    float32 f_dynamics_relvel_y_std #Y Relative Velocity Std
    float32 f_dynamics_relvel_covariancexy #Covariance Relative Velocity X Y
    uint8 u_dynamics_absaccel_invalidflags #unused
    float32 f_dynamics_absaccel_x #X Absolute Acceleration
    float32 f_dynamics_absaccel_x_std #X Absolute Acceleration Std
    float32 f_dynamics_absaccel_y #Y Absolute Acceleration
    float32 f_dynamics_absaccel_y_std #Y Absolute Acceleration Std
    float32 f_dynamics_absaccel_covariancexy #Covariance Absolute Acceleration X Y
    uint8 u_dynamics_relaccel_invalidflags #unused
    float32 f_dynamics_relaccel_x #X Relative Acceleration
    float32 f_dynamics_relaccel_x_std #X Relative Acceleration Std
    float32 f_dynamics_relaccel_y #Y Relative Acceleration
    float32 f_dynamics_relaccel_y_std #Y Relative Acceleration Std
    float32 f_dynamics_relaccel_covariancexy #Covariance Relative Acceleration X Y
    uint8 u_dynamics_orientation_invalidflags #unused
    float32 u_dynamics_orientation_rate_mean #Object Orientation Rate
    float32 u_dynamics_orientation_rate_std #Orientation Rate Std
    uint32 u_shape_length_status #(unused) Shape Length Status
    uint8 u_shape_length_edge_invalidflags #(unused) Invalid Flags Shape Length 
    float32 u_shape_length_edge_mean #Mean Shape Length
    float32 u_shape_length_edge_std #(unused) Shape Length Std
    uint32 u_shape_width_status #(unused) Shape Width Status 
    uint8 u_shape_width_edge_invalidflags #(unused) Invalid Flags Shape Width
    float32 u_shape_width_edge_mean #Mean Shape Width
    float32 u_shape_width_edge_std #(unused) Shape Width Std 
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ObjectList(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.crc !== undefined) {
      resolved.crc = msg.crc;
    }
    else {
      resolved.crc = 0
    }

    if (msg.length !== undefined) {
      resolved.length = msg.length;
    }
    else {
      resolved.length = 0
    }

    if (msg.sqc !== undefined) {
      resolved.sqc = msg.sqc;
    }
    else {
      resolved.sqc = 0
    }

    if (msg.dataid !== undefined) {
      resolved.dataid = msg.dataid;
    }
    else {
      resolved.dataid = 0
    }

    if (msg.timestamp_nanoseconds !== undefined) {
      resolved.timestamp_nanoseconds = msg.timestamp_nanoseconds;
    }
    else {
      resolved.timestamp_nanoseconds = 0
    }

    if (msg.timestamp_seconds !== undefined) {
      resolved.timestamp_seconds = msg.timestamp_seconds;
    }
    else {
      resolved.timestamp_seconds = 0
    }

    if (msg.timestamp_syncstatus !== undefined) {
      resolved.timestamp_syncstatus = msg.timestamp_syncstatus;
    }
    else {
      resolved.timestamp_syncstatus = 0
    }

    if (msg.eventdataqualifier !== undefined) {
      resolved.eventdataqualifier = msg.eventdataqualifier;
    }
    else {
      resolved.eventdataqualifier = 0
    }

    if (msg.extendedqualifier !== undefined) {
      resolved.extendedqualifier = msg.extendedqualifier;
    }
    else {
      resolved.extendedqualifier = 0
    }

    if (msg.objectlist_numofobjects !== undefined) {
      resolved.objectlist_numofobjects = msg.objectlist_numofobjects;
    }
    else {
      resolved.objectlist_numofobjects = 0
    }

    if (msg.objectlist_objects !== undefined) {
      resolved.objectlist_objects = new Array(50)
      for (let i = 0; i < resolved.objectlist_objects.length; ++i) {
        if (msg.objectlist_objects.length > i) {
          resolved.objectlist_objects[i] = Object.Resolve(msg.objectlist_objects[i]);
        }
        else {
          resolved.objectlist_objects[i] = new Object();
        }
      }
    }
    else {
      resolved.objectlist_objects = new Array(50).fill(new Object())
    }

    return resolved;
    }
};

module.exports = ObjectList;
