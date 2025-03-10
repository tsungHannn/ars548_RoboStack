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

class AccelerationLateralCoG {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.accelerationlateralerramp = null;
      this.accelerationlateralerramp_invalidflag = null;
      this.qualifieraccelerationlateral = null;
      this.accelerationlateral = null;
      this.accelerationlateral_invalidflag = null;
      this.accelerationlateraleventdataqualifier = null;
    }
    else {
      if (initObj.hasOwnProperty('accelerationlateralerramp')) {
        this.accelerationlateralerramp = initObj.accelerationlateralerramp
      }
      else {
        this.accelerationlateralerramp = 0.0;
      }
      if (initObj.hasOwnProperty('accelerationlateralerramp_invalidflag')) {
        this.accelerationlateralerramp_invalidflag = initObj.accelerationlateralerramp_invalidflag
      }
      else {
        this.accelerationlateralerramp_invalidflag = 0;
      }
      if (initObj.hasOwnProperty('qualifieraccelerationlateral')) {
        this.qualifieraccelerationlateral = initObj.qualifieraccelerationlateral
      }
      else {
        this.qualifieraccelerationlateral = 0;
      }
      if (initObj.hasOwnProperty('accelerationlateral')) {
        this.accelerationlateral = initObj.accelerationlateral
      }
      else {
        this.accelerationlateral = 0.0;
      }
      if (initObj.hasOwnProperty('accelerationlateral_invalidflag')) {
        this.accelerationlateral_invalidflag = initObj.accelerationlateral_invalidflag
      }
      else {
        this.accelerationlateral_invalidflag = 0;
      }
      if (initObj.hasOwnProperty('accelerationlateraleventdataqualifier')) {
        this.accelerationlateraleventdataqualifier = initObj.accelerationlateraleventdataqualifier
      }
      else {
        this.accelerationlateraleventdataqualifier = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AccelerationLateralCoG
    // Serialize message field [accelerationlateralerramp]
    bufferOffset = _serializer.float32(obj.accelerationlateralerramp, buffer, bufferOffset);
    // Serialize message field [accelerationlateralerramp_invalidflag]
    bufferOffset = _serializer.uint8(obj.accelerationlateralerramp_invalidflag, buffer, bufferOffset);
    // Serialize message field [qualifieraccelerationlateral]
    bufferOffset = _serializer.uint8(obj.qualifieraccelerationlateral, buffer, bufferOffset);
    // Serialize message field [accelerationlateral]
    bufferOffset = _serializer.float32(obj.accelerationlateral, buffer, bufferOffset);
    // Serialize message field [accelerationlateral_invalidflag]
    bufferOffset = _serializer.uint8(obj.accelerationlateral_invalidflag, buffer, bufferOffset);
    // Serialize message field [accelerationlateraleventdataqualifier]
    bufferOffset = _serializer.uint8(obj.accelerationlateraleventdataqualifier, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AccelerationLateralCoG
    let len;
    let data = new AccelerationLateralCoG(null);
    // Deserialize message field [accelerationlateralerramp]
    data.accelerationlateralerramp = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [accelerationlateralerramp_invalidflag]
    data.accelerationlateralerramp_invalidflag = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [qualifieraccelerationlateral]
    data.qualifieraccelerationlateral = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [accelerationlateral]
    data.accelerationlateral = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [accelerationlateral_invalidflag]
    data.accelerationlateral_invalidflag = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [accelerationlateraleventdataqualifier]
    data.accelerationlateraleventdataqualifier = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ars548_messages/AccelerationLateralCoG';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9d1e6bf3d430a2b77911a476ca617783';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 accelerationlateralerramp #(Unused) Error Amplitude of Lateral Acceleration 
    uint8 accelerationlateralerramp_invalidflag #(Unused) Invalid Flags AccelLatErrAmp  
    uint8 qualifieraccelerationlateral #(Unused) Lateral Acceleration Qualifier 
    float32 accelerationlateral #Lateral Acceleration
    uint8 accelerationlateral_invalidflag #(Unused) Invalid Flag Lateral Acceleration 
    uint8 accelerationlateraleventdataqualifier #(Unused) Event Data Qualifier Lateral Acceleration 
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AccelerationLateralCoG(null);
    if (msg.accelerationlateralerramp !== undefined) {
      resolved.accelerationlateralerramp = msg.accelerationlateralerramp;
    }
    else {
      resolved.accelerationlateralerramp = 0.0
    }

    if (msg.accelerationlateralerramp_invalidflag !== undefined) {
      resolved.accelerationlateralerramp_invalidflag = msg.accelerationlateralerramp_invalidflag;
    }
    else {
      resolved.accelerationlateralerramp_invalidflag = 0
    }

    if (msg.qualifieraccelerationlateral !== undefined) {
      resolved.qualifieraccelerationlateral = msg.qualifieraccelerationlateral;
    }
    else {
      resolved.qualifieraccelerationlateral = 0
    }

    if (msg.accelerationlateral !== undefined) {
      resolved.accelerationlateral = msg.accelerationlateral;
    }
    else {
      resolved.accelerationlateral = 0.0
    }

    if (msg.accelerationlateral_invalidflag !== undefined) {
      resolved.accelerationlateral_invalidflag = msg.accelerationlateral_invalidflag;
    }
    else {
      resolved.accelerationlateral_invalidflag = 0
    }

    if (msg.accelerationlateraleventdataqualifier !== undefined) {
      resolved.accelerationlateraleventdataqualifier = msg.accelerationlateraleventdataqualifier;
    }
    else {
      resolved.accelerationlateraleventdataqualifier = 0
    }

    return resolved;
    }
};

module.exports = AccelerationLateralCoG;
