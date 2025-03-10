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

class AccelerationLongitudinalCoG {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.accelerationlongitudinalerramp = null;
      this.accelerationlongitudinalerramp_invalidflag = null;
      this.qualifieraccelerationlongitudinal = null;
      this.accelerationlongitudinal = null;
      this.accelerationlongitudinal_invalidflag = null;
      this.accelerationlongitudinaleventdataqualifier = null;
    }
    else {
      if (initObj.hasOwnProperty('accelerationlongitudinalerramp')) {
        this.accelerationlongitudinalerramp = initObj.accelerationlongitudinalerramp
      }
      else {
        this.accelerationlongitudinalerramp = 0.0;
      }
      if (initObj.hasOwnProperty('accelerationlongitudinalerramp_invalidflag')) {
        this.accelerationlongitudinalerramp_invalidflag = initObj.accelerationlongitudinalerramp_invalidflag
      }
      else {
        this.accelerationlongitudinalerramp_invalidflag = 0;
      }
      if (initObj.hasOwnProperty('qualifieraccelerationlongitudinal')) {
        this.qualifieraccelerationlongitudinal = initObj.qualifieraccelerationlongitudinal
      }
      else {
        this.qualifieraccelerationlongitudinal = 0;
      }
      if (initObj.hasOwnProperty('accelerationlongitudinal')) {
        this.accelerationlongitudinal = initObj.accelerationlongitudinal
      }
      else {
        this.accelerationlongitudinal = 0.0;
      }
      if (initObj.hasOwnProperty('accelerationlongitudinal_invalidflag')) {
        this.accelerationlongitudinal_invalidflag = initObj.accelerationlongitudinal_invalidflag
      }
      else {
        this.accelerationlongitudinal_invalidflag = 0;
      }
      if (initObj.hasOwnProperty('accelerationlongitudinaleventdataqualifier')) {
        this.accelerationlongitudinaleventdataqualifier = initObj.accelerationlongitudinaleventdataqualifier
      }
      else {
        this.accelerationlongitudinaleventdataqualifier = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AccelerationLongitudinalCoG
    // Serialize message field [accelerationlongitudinalerramp]
    bufferOffset = _serializer.float32(obj.accelerationlongitudinalerramp, buffer, bufferOffset);
    // Serialize message field [accelerationlongitudinalerramp_invalidflag]
    bufferOffset = _serializer.uint8(obj.accelerationlongitudinalerramp_invalidflag, buffer, bufferOffset);
    // Serialize message field [qualifieraccelerationlongitudinal]
    bufferOffset = _serializer.uint8(obj.qualifieraccelerationlongitudinal, buffer, bufferOffset);
    // Serialize message field [accelerationlongitudinal]
    bufferOffset = _serializer.float32(obj.accelerationlongitudinal, buffer, bufferOffset);
    // Serialize message field [accelerationlongitudinal_invalidflag]
    bufferOffset = _serializer.uint8(obj.accelerationlongitudinal_invalidflag, buffer, bufferOffset);
    // Serialize message field [accelerationlongitudinaleventdataqualifier]
    bufferOffset = _serializer.uint8(obj.accelerationlongitudinaleventdataqualifier, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AccelerationLongitudinalCoG
    let len;
    let data = new AccelerationLongitudinalCoG(null);
    // Deserialize message field [accelerationlongitudinalerramp]
    data.accelerationlongitudinalerramp = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [accelerationlongitudinalerramp_invalidflag]
    data.accelerationlongitudinalerramp_invalidflag = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [qualifieraccelerationlongitudinal]
    data.qualifieraccelerationlongitudinal = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [accelerationlongitudinal]
    data.accelerationlongitudinal = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [accelerationlongitudinal_invalidflag]
    data.accelerationlongitudinal_invalidflag = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [accelerationlongitudinaleventdataqualifier]
    data.accelerationlongitudinaleventdataqualifier = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ars548_messages/AccelerationLongitudinalCoG';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0eafbbce434bfbd2d5decf0da9141fd7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 accelerationlongitudinalerramp #(Unused) Error amplitude of longitudinal acceleration
    uint8 accelerationlongitudinalerramp_invalidflag #(Unused) Invalid Flags AccelLongErrAmp 
    uint8 qualifieraccelerationlongitudinal #(Unused) Longitudinal Acceleration Qualifier 
    float32 accelerationlongitudinal #Longitudinal Acceleration
    uint8 accelerationlongitudinal_invalidflag #(Unused) Invalid Flag Longitudinal Acceleration 
    uint8 accelerationlongitudinaleventdataqualifier #(Unused) Event Data Qualifier Longitudinal Acceleration 
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AccelerationLongitudinalCoG(null);
    if (msg.accelerationlongitudinalerramp !== undefined) {
      resolved.accelerationlongitudinalerramp = msg.accelerationlongitudinalerramp;
    }
    else {
      resolved.accelerationlongitudinalerramp = 0.0
    }

    if (msg.accelerationlongitudinalerramp_invalidflag !== undefined) {
      resolved.accelerationlongitudinalerramp_invalidflag = msg.accelerationlongitudinalerramp_invalidflag;
    }
    else {
      resolved.accelerationlongitudinalerramp_invalidflag = 0
    }

    if (msg.qualifieraccelerationlongitudinal !== undefined) {
      resolved.qualifieraccelerationlongitudinal = msg.qualifieraccelerationlongitudinal;
    }
    else {
      resolved.qualifieraccelerationlongitudinal = 0
    }

    if (msg.accelerationlongitudinal !== undefined) {
      resolved.accelerationlongitudinal = msg.accelerationlongitudinal;
    }
    else {
      resolved.accelerationlongitudinal = 0.0
    }

    if (msg.accelerationlongitudinal_invalidflag !== undefined) {
      resolved.accelerationlongitudinal_invalidflag = msg.accelerationlongitudinal_invalidflag;
    }
    else {
      resolved.accelerationlongitudinal_invalidflag = 0
    }

    if (msg.accelerationlongitudinaleventdataqualifier !== undefined) {
      resolved.accelerationlongitudinaleventdataqualifier = msg.accelerationlongitudinaleventdataqualifier;
    }
    else {
      resolved.accelerationlongitudinaleventdataqualifier = 0
    }

    return resolved;
    }
};

module.exports = AccelerationLongitudinalCoG;
