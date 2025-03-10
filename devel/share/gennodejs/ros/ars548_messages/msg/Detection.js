// Auto-generated. Do not edit!

// (in-package ars548_messages.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Detection {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.f_azimuthangle = null;
      this.f_azimuthanglestd = null;
      this.u_invalidflags = null;
      this.f_elevationangle = null;
      this.f_elevationanglestd = null;
      this.f_range = null;
      this.f_rangestd = null;
      this.f_rangerate = null;
      this.f_rangeratestd = null;
      this.s_rcs = null;
      this.u_measurementid = null;
      this.u_positivepredictivevalue = null;
      this.u_classification = null;
      this.u_multitargetprobabilitym = null;
      this.u_objectid = null;
      this.u_ambiguityflag = null;
      this.u_sortindex = null;
    }
    else {
      if (initObj.hasOwnProperty('f_azimuthangle')) {
        this.f_azimuthangle = initObj.f_azimuthangle
      }
      else {
        this.f_azimuthangle = 0.0;
      }
      if (initObj.hasOwnProperty('f_azimuthanglestd')) {
        this.f_azimuthanglestd = initObj.f_azimuthanglestd
      }
      else {
        this.f_azimuthanglestd = 0.0;
      }
      if (initObj.hasOwnProperty('u_invalidflags')) {
        this.u_invalidflags = initObj.u_invalidflags
      }
      else {
        this.u_invalidflags = 0;
      }
      if (initObj.hasOwnProperty('f_elevationangle')) {
        this.f_elevationangle = initObj.f_elevationangle
      }
      else {
        this.f_elevationangle = 0.0;
      }
      if (initObj.hasOwnProperty('f_elevationanglestd')) {
        this.f_elevationanglestd = initObj.f_elevationanglestd
      }
      else {
        this.f_elevationanglestd = 0.0;
      }
      if (initObj.hasOwnProperty('f_range')) {
        this.f_range = initObj.f_range
      }
      else {
        this.f_range = 0.0;
      }
      if (initObj.hasOwnProperty('f_rangestd')) {
        this.f_rangestd = initObj.f_rangestd
      }
      else {
        this.f_rangestd = 0.0;
      }
      if (initObj.hasOwnProperty('f_rangerate')) {
        this.f_rangerate = initObj.f_rangerate
      }
      else {
        this.f_rangerate = 0.0;
      }
      if (initObj.hasOwnProperty('f_rangeratestd')) {
        this.f_rangeratestd = initObj.f_rangeratestd
      }
      else {
        this.f_rangeratestd = 0.0;
      }
      if (initObj.hasOwnProperty('s_rcs')) {
        this.s_rcs = initObj.s_rcs
      }
      else {
        this.s_rcs = 0;
      }
      if (initObj.hasOwnProperty('u_measurementid')) {
        this.u_measurementid = initObj.u_measurementid
      }
      else {
        this.u_measurementid = 0;
      }
      if (initObj.hasOwnProperty('u_positivepredictivevalue')) {
        this.u_positivepredictivevalue = initObj.u_positivepredictivevalue
      }
      else {
        this.u_positivepredictivevalue = 0;
      }
      if (initObj.hasOwnProperty('u_classification')) {
        this.u_classification = initObj.u_classification
      }
      else {
        this.u_classification = 0;
      }
      if (initObj.hasOwnProperty('u_multitargetprobabilitym')) {
        this.u_multitargetprobabilitym = initObj.u_multitargetprobabilitym
      }
      else {
        this.u_multitargetprobabilitym = 0;
      }
      if (initObj.hasOwnProperty('u_objectid')) {
        this.u_objectid = initObj.u_objectid
      }
      else {
        this.u_objectid = 0;
      }
      if (initObj.hasOwnProperty('u_ambiguityflag')) {
        this.u_ambiguityflag = initObj.u_ambiguityflag
      }
      else {
        this.u_ambiguityflag = 0;
      }
      if (initObj.hasOwnProperty('u_sortindex')) {
        this.u_sortindex = initObj.u_sortindex
      }
      else {
        this.u_sortindex = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Detection
    // Serialize message field [f_azimuthangle]
    bufferOffset = _serializer.float32(obj.f_azimuthangle, buffer, bufferOffset);
    // Serialize message field [f_azimuthanglestd]
    bufferOffset = _serializer.float32(obj.f_azimuthanglestd, buffer, bufferOffset);
    // Serialize message field [u_invalidflags]
    bufferOffset = _serializer.uint8(obj.u_invalidflags, buffer, bufferOffset);
    // Serialize message field [f_elevationangle]
    bufferOffset = _serializer.float32(obj.f_elevationangle, buffer, bufferOffset);
    // Serialize message field [f_elevationanglestd]
    bufferOffset = _serializer.float32(obj.f_elevationanglestd, buffer, bufferOffset);
    // Serialize message field [f_range]
    bufferOffset = _serializer.float32(obj.f_range, buffer, bufferOffset);
    // Serialize message field [f_rangestd]
    bufferOffset = _serializer.float32(obj.f_rangestd, buffer, bufferOffset);
    // Serialize message field [f_rangerate]
    bufferOffset = _serializer.float32(obj.f_rangerate, buffer, bufferOffset);
    // Serialize message field [f_rangeratestd]
    bufferOffset = _serializer.float32(obj.f_rangeratestd, buffer, bufferOffset);
    // Serialize message field [s_rcs]
    bufferOffset = _serializer.int8(obj.s_rcs, buffer, bufferOffset);
    // Serialize message field [u_measurementid]
    bufferOffset = _serializer.uint16(obj.u_measurementid, buffer, bufferOffset);
    // Serialize message field [u_positivepredictivevalue]
    bufferOffset = _serializer.uint8(obj.u_positivepredictivevalue, buffer, bufferOffset);
    // Serialize message field [u_classification]
    bufferOffset = _serializer.uint8(obj.u_classification, buffer, bufferOffset);
    // Serialize message field [u_multitargetprobabilitym]
    bufferOffset = _serializer.uint8(obj.u_multitargetprobabilitym, buffer, bufferOffset);
    // Serialize message field [u_objectid]
    bufferOffset = _serializer.uint16(obj.u_objectid, buffer, bufferOffset);
    // Serialize message field [u_ambiguityflag]
    bufferOffset = _serializer.uint8(obj.u_ambiguityflag, buffer, bufferOffset);
    // Serialize message field [u_sortindex]
    bufferOffset = _serializer.uint16(obj.u_sortindex, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Detection
    let len;
    let data = new Detection(null);
    // Deserialize message field [f_azimuthangle]
    data.f_azimuthangle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [f_azimuthanglestd]
    data.f_azimuthanglestd = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [u_invalidflags]
    data.u_invalidflags = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [f_elevationangle]
    data.f_elevationangle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [f_elevationanglestd]
    data.f_elevationanglestd = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [f_range]
    data.f_range = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [f_rangestd]
    data.f_rangestd = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [f_rangerate]
    data.f_rangerate = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [f_rangeratestd]
    data.f_rangeratestd = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [s_rcs]
    data.s_rcs = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [u_measurementid]
    data.u_measurementid = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [u_positivepredictivevalue]
    data.u_positivepredictivevalue = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [u_classification]
    data.u_classification = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [u_multitargetprobabilitym]
    data.u_multitargetprobabilitym = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [u_objectid]
    data.u_objectid = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [u_ambiguityflag]
    data.u_ambiguityflag = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [u_sortindex]
    data.u_sortindex = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 44;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ars548_messages/Detection';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3760b05dc425bea9898067baeb462326';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new Detection(null);
    if (msg.f_azimuthangle !== undefined) {
      resolved.f_azimuthangle = msg.f_azimuthangle;
    }
    else {
      resolved.f_azimuthangle = 0.0
    }

    if (msg.f_azimuthanglestd !== undefined) {
      resolved.f_azimuthanglestd = msg.f_azimuthanglestd;
    }
    else {
      resolved.f_azimuthanglestd = 0.0
    }

    if (msg.u_invalidflags !== undefined) {
      resolved.u_invalidflags = msg.u_invalidflags;
    }
    else {
      resolved.u_invalidflags = 0
    }

    if (msg.f_elevationangle !== undefined) {
      resolved.f_elevationangle = msg.f_elevationangle;
    }
    else {
      resolved.f_elevationangle = 0.0
    }

    if (msg.f_elevationanglestd !== undefined) {
      resolved.f_elevationanglestd = msg.f_elevationanglestd;
    }
    else {
      resolved.f_elevationanglestd = 0.0
    }

    if (msg.f_range !== undefined) {
      resolved.f_range = msg.f_range;
    }
    else {
      resolved.f_range = 0.0
    }

    if (msg.f_rangestd !== undefined) {
      resolved.f_rangestd = msg.f_rangestd;
    }
    else {
      resolved.f_rangestd = 0.0
    }

    if (msg.f_rangerate !== undefined) {
      resolved.f_rangerate = msg.f_rangerate;
    }
    else {
      resolved.f_rangerate = 0.0
    }

    if (msg.f_rangeratestd !== undefined) {
      resolved.f_rangeratestd = msg.f_rangeratestd;
    }
    else {
      resolved.f_rangeratestd = 0.0
    }

    if (msg.s_rcs !== undefined) {
      resolved.s_rcs = msg.s_rcs;
    }
    else {
      resolved.s_rcs = 0
    }

    if (msg.u_measurementid !== undefined) {
      resolved.u_measurementid = msg.u_measurementid;
    }
    else {
      resolved.u_measurementid = 0
    }

    if (msg.u_positivepredictivevalue !== undefined) {
      resolved.u_positivepredictivevalue = msg.u_positivepredictivevalue;
    }
    else {
      resolved.u_positivepredictivevalue = 0
    }

    if (msg.u_classification !== undefined) {
      resolved.u_classification = msg.u_classification;
    }
    else {
      resolved.u_classification = 0
    }

    if (msg.u_multitargetprobabilitym !== undefined) {
      resolved.u_multitargetprobabilitym = msg.u_multitargetprobabilitym;
    }
    else {
      resolved.u_multitargetprobabilitym = 0
    }

    if (msg.u_objectid !== undefined) {
      resolved.u_objectid = msg.u_objectid;
    }
    else {
      resolved.u_objectid = 0
    }

    if (msg.u_ambiguityflag !== undefined) {
      resolved.u_ambiguityflag = msg.u_ambiguityflag;
    }
    else {
      resolved.u_ambiguityflag = 0
    }

    if (msg.u_sortindex !== undefined) {
      resolved.u_sortindex = msg.u_sortindex;
    }
    else {
      resolved.u_sortindex = 0
    }

    return resolved;
    }
};

module.exports = Detection;
