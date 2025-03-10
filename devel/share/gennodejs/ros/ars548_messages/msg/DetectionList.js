// Auto-generated. Do not edit!

// (in-package ars548_messages.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Detection = require('./Detection.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class DetectionList {
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
      this.origin_invalidflags = null;
      this.origin_xpos = null;
      this.origin_xstd = null;
      this.origin_ypos = null;
      this.origin_ystd = null;
      this.origin_zpos = null;
      this.origin_zstd = null;
      this.origin_roll = null;
      this.origin_rollstd = null;
      this.origin_pitch = null;
      this.origin_pitchstd = null;
      this.origin_yaw = null;
      this.origin_yawstd = null;
      this.list_invalidflags = null;
      this.list_detections = null;
      this.list_radveldomain_min = null;
      this.list_radveldomain_max = null;
      this.list_numofdetections = null;
      this.aln_azimuthcorrection = null;
      this.aln_elevationcorrection = null;
      this.aln_status = null;
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
      if (initObj.hasOwnProperty('origin_invalidflags')) {
        this.origin_invalidflags = initObj.origin_invalidflags
      }
      else {
        this.origin_invalidflags = 0;
      }
      if (initObj.hasOwnProperty('origin_xpos')) {
        this.origin_xpos = initObj.origin_xpos
      }
      else {
        this.origin_xpos = 0.0;
      }
      if (initObj.hasOwnProperty('origin_xstd')) {
        this.origin_xstd = initObj.origin_xstd
      }
      else {
        this.origin_xstd = 0.0;
      }
      if (initObj.hasOwnProperty('origin_ypos')) {
        this.origin_ypos = initObj.origin_ypos
      }
      else {
        this.origin_ypos = 0.0;
      }
      if (initObj.hasOwnProperty('origin_ystd')) {
        this.origin_ystd = initObj.origin_ystd
      }
      else {
        this.origin_ystd = 0.0;
      }
      if (initObj.hasOwnProperty('origin_zpos')) {
        this.origin_zpos = initObj.origin_zpos
      }
      else {
        this.origin_zpos = 0.0;
      }
      if (initObj.hasOwnProperty('origin_zstd')) {
        this.origin_zstd = initObj.origin_zstd
      }
      else {
        this.origin_zstd = 0.0;
      }
      if (initObj.hasOwnProperty('origin_roll')) {
        this.origin_roll = initObj.origin_roll
      }
      else {
        this.origin_roll = 0.0;
      }
      if (initObj.hasOwnProperty('origin_rollstd')) {
        this.origin_rollstd = initObj.origin_rollstd
      }
      else {
        this.origin_rollstd = 0.0;
      }
      if (initObj.hasOwnProperty('origin_pitch')) {
        this.origin_pitch = initObj.origin_pitch
      }
      else {
        this.origin_pitch = 0.0;
      }
      if (initObj.hasOwnProperty('origin_pitchstd')) {
        this.origin_pitchstd = initObj.origin_pitchstd
      }
      else {
        this.origin_pitchstd = 0.0;
      }
      if (initObj.hasOwnProperty('origin_yaw')) {
        this.origin_yaw = initObj.origin_yaw
      }
      else {
        this.origin_yaw = 0.0;
      }
      if (initObj.hasOwnProperty('origin_yawstd')) {
        this.origin_yawstd = initObj.origin_yawstd
      }
      else {
        this.origin_yawstd = 0.0;
      }
      if (initObj.hasOwnProperty('list_invalidflags')) {
        this.list_invalidflags = initObj.list_invalidflags
      }
      else {
        this.list_invalidflags = 0;
      }
      if (initObj.hasOwnProperty('list_detections')) {
        this.list_detections = initObj.list_detections
      }
      else {
        this.list_detections = new Array(800).fill(new Detection());
      }
      if (initObj.hasOwnProperty('list_radveldomain_min')) {
        this.list_radveldomain_min = initObj.list_radveldomain_min
      }
      else {
        this.list_radveldomain_min = 0.0;
      }
      if (initObj.hasOwnProperty('list_radveldomain_max')) {
        this.list_radveldomain_max = initObj.list_radveldomain_max
      }
      else {
        this.list_radveldomain_max = 0.0;
      }
      if (initObj.hasOwnProperty('list_numofdetections')) {
        this.list_numofdetections = initObj.list_numofdetections
      }
      else {
        this.list_numofdetections = 0;
      }
      if (initObj.hasOwnProperty('aln_azimuthcorrection')) {
        this.aln_azimuthcorrection = initObj.aln_azimuthcorrection
      }
      else {
        this.aln_azimuthcorrection = 0.0;
      }
      if (initObj.hasOwnProperty('aln_elevationcorrection')) {
        this.aln_elevationcorrection = initObj.aln_elevationcorrection
      }
      else {
        this.aln_elevationcorrection = 0.0;
      }
      if (initObj.hasOwnProperty('aln_status')) {
        this.aln_status = initObj.aln_status
      }
      else {
        this.aln_status = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DetectionList
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
    // Serialize message field [origin_invalidflags]
    bufferOffset = _serializer.uint16(obj.origin_invalidflags, buffer, bufferOffset);
    // Serialize message field [origin_xpos]
    bufferOffset = _serializer.float32(obj.origin_xpos, buffer, bufferOffset);
    // Serialize message field [origin_xstd]
    bufferOffset = _serializer.float32(obj.origin_xstd, buffer, bufferOffset);
    // Serialize message field [origin_ypos]
    bufferOffset = _serializer.float32(obj.origin_ypos, buffer, bufferOffset);
    // Serialize message field [origin_ystd]
    bufferOffset = _serializer.float32(obj.origin_ystd, buffer, bufferOffset);
    // Serialize message field [origin_zpos]
    bufferOffset = _serializer.float32(obj.origin_zpos, buffer, bufferOffset);
    // Serialize message field [origin_zstd]
    bufferOffset = _serializer.float32(obj.origin_zstd, buffer, bufferOffset);
    // Serialize message field [origin_roll]
    bufferOffset = _serializer.float32(obj.origin_roll, buffer, bufferOffset);
    // Serialize message field [origin_rollstd]
    bufferOffset = _serializer.float32(obj.origin_rollstd, buffer, bufferOffset);
    // Serialize message field [origin_pitch]
    bufferOffset = _serializer.float32(obj.origin_pitch, buffer, bufferOffset);
    // Serialize message field [origin_pitchstd]
    bufferOffset = _serializer.float32(obj.origin_pitchstd, buffer, bufferOffset);
    // Serialize message field [origin_yaw]
    bufferOffset = _serializer.float32(obj.origin_yaw, buffer, bufferOffset);
    // Serialize message field [origin_yawstd]
    bufferOffset = _serializer.float32(obj.origin_yawstd, buffer, bufferOffset);
    // Serialize message field [list_invalidflags]
    bufferOffset = _serializer.uint8(obj.list_invalidflags, buffer, bufferOffset);
    // Check that the constant length array field [list_detections] has the right length
    if (obj.list_detections.length !== 800) {
      throw new Error('Unable to serialize array field list_detections - length must be 800')
    }
    // Serialize message field [list_detections]
    obj.list_detections.forEach((val) => {
      bufferOffset = Detection.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [list_radveldomain_min]
    bufferOffset = _serializer.float32(obj.list_radveldomain_min, buffer, bufferOffset);
    // Serialize message field [list_radveldomain_max]
    bufferOffset = _serializer.float32(obj.list_radveldomain_max, buffer, bufferOffset);
    // Serialize message field [list_numofdetections]
    bufferOffset = _serializer.uint32(obj.list_numofdetections, buffer, bufferOffset);
    // Serialize message field [aln_azimuthcorrection]
    bufferOffset = _serializer.float32(obj.aln_azimuthcorrection, buffer, bufferOffset);
    // Serialize message field [aln_elevationcorrection]
    bufferOffset = _serializer.float32(obj.aln_elevationcorrection, buffer, bufferOffset);
    // Serialize message field [aln_status]
    bufferOffset = _serializer.uint8(obj.aln_status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DetectionList
    let len;
    let data = new DetectionList(null);
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
    // Deserialize message field [origin_invalidflags]
    data.origin_invalidflags = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [origin_xpos]
    data.origin_xpos = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [origin_xstd]
    data.origin_xstd = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [origin_ypos]
    data.origin_ypos = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [origin_ystd]
    data.origin_ystd = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [origin_zpos]
    data.origin_zpos = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [origin_zstd]
    data.origin_zstd = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [origin_roll]
    data.origin_roll = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [origin_rollstd]
    data.origin_rollstd = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [origin_pitch]
    data.origin_pitch = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [origin_pitchstd]
    data.origin_pitchstd = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [origin_yaw]
    data.origin_yaw = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [origin_yawstd]
    data.origin_yawstd = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [list_invalidflags]
    data.list_invalidflags = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [list_detections]
    len = 800;
    data.list_detections = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.list_detections[i] = Detection.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [list_radveldomain_min]
    data.list_radveldomain_min = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [list_radveldomain_max]
    data.list_radveldomain_max = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [list_numofdetections]
    data.list_numofdetections = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [aln_azimuthcorrection]
    data.aln_azimuthcorrection = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [aln_elevationcorrection]
    data.aln_elevationcorrection = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [aln_status]
    data.aln_status = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 35306;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ars548_messages/DetectionList';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'dfc9cd5cc1729d9eb247feb85b81b126';
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
    uint32 eventdataqualifier #Event Data Qualifier (unused)
    uint8 extendedqualifier #Extended Qualifier (unused)
    uint16 origin_invalidflags #Sensor Position Invalid flags (unused)
    float32 origin_xpos #Sensor X Position with reference to rear axle
    float32 origin_xstd #Sensor X Position STD (unused)
    float32 origin_ypos #Sensor Y Position with reference to rear axle
    float32 origin_ystd #Sensor Y Position STD (unused)
    float32 origin_zpos #Sensor Z Position with reference to rear axle
    float32 origin_zstd #Sensor Z Position STD (unused)
    float32 origin_roll #Sensor Roll Angle (unused)
    float32 origin_rollstd #Sensor Roll Angle STD (unused)
    float32 origin_pitch #Sensor Pitch Angle with alignment correction
    float32 origin_pitchstd #Sensor Pitch Angle STD
    float32 origin_yaw #Sensor Yaw Angle with alignment correction
    float32 origin_yawstd #Sensor Yaw Angle STD
    uint8 list_invalidflags #Invalid flags (unused)
    Detection[800] list_detections #Detection Array
    float32 list_radveldomain_min #Ambiguity free Doppler velocity range Min
    float32 list_radveldomain_max #Ambiguity free Doppler velocity range Max
    uint32 list_numofdetections #Number of Detections
    float32 aln_azimuthcorrection #Azimuth Alignment Correction
    float32 aln_elevationcorrection #Elevation Alignment Correction
    uint8 aln_status #Status of alignment
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
    MSG: ars548_messages/Detection
    float32 f_azimuthangle #Unaligned Detection Azimuth Angle
    float32 f_azimuthanglestd #Azimuth Angle Std
    uint8 u_invalidflags #Detection Invalid Flags 
    float32 f_elevationangle #Unaligned Detection Elevation Angle
    float32 f_elevationanglestd #Elevation Angle Std
    float32 f_range #Detection Radial Distance
    float32 f_rangestd #Radial Distance Std
    float32 f_rangerate #Detection Radial Velocity
    float32 f_rangeratestd #Radial Velocity Std
    int8 s_rcs #Detection RCS
    uint16 u_measurementid #Detection ID
    uint8 u_positivepredictivevalue #Existence Probability
    uint8 u_classification #Detection Classification
    uint8 u_multitargetprobabilitym #Multi-Target Probability
    uint16 u_objectid #Associated Object ID
    uint8 u_ambiguityflag #Probability for resolved velocity ambiguity
    uint16 u_sortindex #tbd
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DetectionList(null);
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

    if (msg.origin_invalidflags !== undefined) {
      resolved.origin_invalidflags = msg.origin_invalidflags;
    }
    else {
      resolved.origin_invalidflags = 0
    }

    if (msg.origin_xpos !== undefined) {
      resolved.origin_xpos = msg.origin_xpos;
    }
    else {
      resolved.origin_xpos = 0.0
    }

    if (msg.origin_xstd !== undefined) {
      resolved.origin_xstd = msg.origin_xstd;
    }
    else {
      resolved.origin_xstd = 0.0
    }

    if (msg.origin_ypos !== undefined) {
      resolved.origin_ypos = msg.origin_ypos;
    }
    else {
      resolved.origin_ypos = 0.0
    }

    if (msg.origin_ystd !== undefined) {
      resolved.origin_ystd = msg.origin_ystd;
    }
    else {
      resolved.origin_ystd = 0.0
    }

    if (msg.origin_zpos !== undefined) {
      resolved.origin_zpos = msg.origin_zpos;
    }
    else {
      resolved.origin_zpos = 0.0
    }

    if (msg.origin_zstd !== undefined) {
      resolved.origin_zstd = msg.origin_zstd;
    }
    else {
      resolved.origin_zstd = 0.0
    }

    if (msg.origin_roll !== undefined) {
      resolved.origin_roll = msg.origin_roll;
    }
    else {
      resolved.origin_roll = 0.0
    }

    if (msg.origin_rollstd !== undefined) {
      resolved.origin_rollstd = msg.origin_rollstd;
    }
    else {
      resolved.origin_rollstd = 0.0
    }

    if (msg.origin_pitch !== undefined) {
      resolved.origin_pitch = msg.origin_pitch;
    }
    else {
      resolved.origin_pitch = 0.0
    }

    if (msg.origin_pitchstd !== undefined) {
      resolved.origin_pitchstd = msg.origin_pitchstd;
    }
    else {
      resolved.origin_pitchstd = 0.0
    }

    if (msg.origin_yaw !== undefined) {
      resolved.origin_yaw = msg.origin_yaw;
    }
    else {
      resolved.origin_yaw = 0.0
    }

    if (msg.origin_yawstd !== undefined) {
      resolved.origin_yawstd = msg.origin_yawstd;
    }
    else {
      resolved.origin_yawstd = 0.0
    }

    if (msg.list_invalidflags !== undefined) {
      resolved.list_invalidflags = msg.list_invalidflags;
    }
    else {
      resolved.list_invalidflags = 0
    }

    if (msg.list_detections !== undefined) {
      resolved.list_detections = new Array(800)
      for (let i = 0; i < resolved.list_detections.length; ++i) {
        if (msg.list_detections.length > i) {
          resolved.list_detections[i] = Detection.Resolve(msg.list_detections[i]);
        }
        else {
          resolved.list_detections[i] = new Detection();
        }
      }
    }
    else {
      resolved.list_detections = new Array(800).fill(new Detection())
    }

    if (msg.list_radveldomain_min !== undefined) {
      resolved.list_radveldomain_min = msg.list_radveldomain_min;
    }
    else {
      resolved.list_radveldomain_min = 0.0
    }

    if (msg.list_radveldomain_max !== undefined) {
      resolved.list_radveldomain_max = msg.list_radveldomain_max;
    }
    else {
      resolved.list_radveldomain_max = 0.0
    }

    if (msg.list_numofdetections !== undefined) {
      resolved.list_numofdetections = msg.list_numofdetections;
    }
    else {
      resolved.list_numofdetections = 0
    }

    if (msg.aln_azimuthcorrection !== undefined) {
      resolved.aln_azimuthcorrection = msg.aln_azimuthcorrection;
    }
    else {
      resolved.aln_azimuthcorrection = 0.0
    }

    if (msg.aln_elevationcorrection !== undefined) {
      resolved.aln_elevationcorrection = msg.aln_elevationcorrection;
    }
    else {
      resolved.aln_elevationcorrection = 0.0
    }

    if (msg.aln_status !== undefined) {
      resolved.aln_status = msg.aln_status;
    }
    else {
      resolved.aln_status = 0
    }

    return resolved;
    }
};

module.exports = DetectionList;
