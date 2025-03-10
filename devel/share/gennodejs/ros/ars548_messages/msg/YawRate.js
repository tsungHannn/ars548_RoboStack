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

class YawRate {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.yawrateerramp = null;
      this.yawrateerramp_invalidflag = null;
      this.qualifieryawrate = null;
      this.yawrate = null;
      this.yawrate_invalidflag = null;
      this.yawrateeventdataqualifier = null;
    }
    else {
      if (initObj.hasOwnProperty('yawrateerramp')) {
        this.yawrateerramp = initObj.yawrateerramp
      }
      else {
        this.yawrateerramp = 0.0;
      }
      if (initObj.hasOwnProperty('yawrateerramp_invalidflag')) {
        this.yawrateerramp_invalidflag = initObj.yawrateerramp_invalidflag
      }
      else {
        this.yawrateerramp_invalidflag = 0;
      }
      if (initObj.hasOwnProperty('qualifieryawrate')) {
        this.qualifieryawrate = initObj.qualifieryawrate
      }
      else {
        this.qualifieryawrate = 0;
      }
      if (initObj.hasOwnProperty('yawrate')) {
        this.yawrate = initObj.yawrate
      }
      else {
        this.yawrate = 0.0;
      }
      if (initObj.hasOwnProperty('yawrate_invalidflag')) {
        this.yawrate_invalidflag = initObj.yawrate_invalidflag
      }
      else {
        this.yawrate_invalidflag = 0;
      }
      if (initObj.hasOwnProperty('yawrateeventdataqualifier')) {
        this.yawrateeventdataqualifier = initObj.yawrateeventdataqualifier
      }
      else {
        this.yawrateeventdataqualifier = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type YawRate
    // Serialize message field [yawrateerramp]
    bufferOffset = _serializer.float32(obj.yawrateerramp, buffer, bufferOffset);
    // Serialize message field [yawrateerramp_invalidflag]
    bufferOffset = _serializer.uint8(obj.yawrateerramp_invalidflag, buffer, bufferOffset);
    // Serialize message field [qualifieryawrate]
    bufferOffset = _serializer.uint8(obj.qualifieryawrate, buffer, bufferOffset);
    // Serialize message field [yawrate]
    bufferOffset = _serializer.float32(obj.yawrate, buffer, bufferOffset);
    // Serialize message field [yawrate_invalidflag]
    bufferOffset = _serializer.uint8(obj.yawrate_invalidflag, buffer, bufferOffset);
    // Serialize message field [yawrateeventdataqualifier]
    bufferOffset = _serializer.uint8(obj.yawrateeventdataqualifier, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type YawRate
    let len;
    let data = new YawRate(null);
    // Deserialize message field [yawrateerramp]
    data.yawrateerramp = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yawrateerramp_invalidflag]
    data.yawrateerramp_invalidflag = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [qualifieryawrate]
    data.qualifieryawrate = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [yawrate]
    data.yawrate = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yawrate_invalidflag]
    data.yawrate_invalidflag = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [yawrateeventdataqualifier]
    data.yawrateeventdataqualifier = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ars548_messages/YawRate';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5e5ee89741e00a755558196ad380378e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 yawrateerramp #(Unused) Error Amplitude of YawRate
    uint8 yawrateerramp_invalidflag #(Unused) Invalid flags AccelLatErrAmp
    uint8 qualifieryawrate #(Unused) YawRate qualifier
    float32 yawrate #YawRate
    uint8 yawrate_invalidflag #(Unused) Invalid flag Yaw Rate 
    uint8 yawrateeventdataqualifier #(Unused) Event data qualifier YawRate
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new YawRate(null);
    if (msg.yawrateerramp !== undefined) {
      resolved.yawrateerramp = msg.yawrateerramp;
    }
    else {
      resolved.yawrateerramp = 0.0
    }

    if (msg.yawrateerramp_invalidflag !== undefined) {
      resolved.yawrateerramp_invalidflag = msg.yawrateerramp_invalidflag;
    }
    else {
      resolved.yawrateerramp_invalidflag = 0
    }

    if (msg.qualifieryawrate !== undefined) {
      resolved.qualifieryawrate = msg.qualifieryawrate;
    }
    else {
      resolved.qualifieryawrate = 0
    }

    if (msg.yawrate !== undefined) {
      resolved.yawrate = msg.yawrate;
    }
    else {
      resolved.yawrate = 0.0
    }

    if (msg.yawrate_invalidflag !== undefined) {
      resolved.yawrate_invalidflag = msg.yawrate_invalidflag;
    }
    else {
      resolved.yawrate_invalidflag = 0
    }

    if (msg.yawrateeventdataqualifier !== undefined) {
      resolved.yawrateeventdataqualifier = msg.yawrateeventdataqualifier;
    }
    else {
      resolved.yawrateeventdataqualifier = 0
    }

    return resolved;
    }
};

module.exports = YawRate;
