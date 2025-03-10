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

class SteeringAngleFrontAxle {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.qualifiersteeringanglefrontaxle = null;
      this.steeringanglefrontaxleerramp = null;
      this.steeringanglefrontaxleerramp_invalidflag = null;
      this.steeringanglefrontaxle = null;
      this.steeringanglefrontaxle_invalidflag = null;
      this.steeringanglefrontaxleeventdataqualifier = null;
    }
    else {
      if (initObj.hasOwnProperty('qualifiersteeringanglefrontaxle')) {
        this.qualifiersteeringanglefrontaxle = initObj.qualifiersteeringanglefrontaxle
      }
      else {
        this.qualifiersteeringanglefrontaxle = 0;
      }
      if (initObj.hasOwnProperty('steeringanglefrontaxleerramp')) {
        this.steeringanglefrontaxleerramp = initObj.steeringanglefrontaxleerramp
      }
      else {
        this.steeringanglefrontaxleerramp = 0.0;
      }
      if (initObj.hasOwnProperty('steeringanglefrontaxleerramp_invalidflag')) {
        this.steeringanglefrontaxleerramp_invalidflag = initObj.steeringanglefrontaxleerramp_invalidflag
      }
      else {
        this.steeringanglefrontaxleerramp_invalidflag = 0;
      }
      if (initObj.hasOwnProperty('steeringanglefrontaxle')) {
        this.steeringanglefrontaxle = initObj.steeringanglefrontaxle
      }
      else {
        this.steeringanglefrontaxle = 0.0;
      }
      if (initObj.hasOwnProperty('steeringanglefrontaxle_invalidflag')) {
        this.steeringanglefrontaxle_invalidflag = initObj.steeringanglefrontaxle_invalidflag
      }
      else {
        this.steeringanglefrontaxle_invalidflag = 0;
      }
      if (initObj.hasOwnProperty('steeringanglefrontaxleeventdataqualifier')) {
        this.steeringanglefrontaxleeventdataqualifier = initObj.steeringanglefrontaxleeventdataqualifier
      }
      else {
        this.steeringanglefrontaxleeventdataqualifier = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SteeringAngleFrontAxle
    // Serialize message field [qualifiersteeringanglefrontaxle]
    bufferOffset = _serializer.uint8(obj.qualifiersteeringanglefrontaxle, buffer, bufferOffset);
    // Serialize message field [steeringanglefrontaxleerramp]
    bufferOffset = _serializer.float32(obj.steeringanglefrontaxleerramp, buffer, bufferOffset);
    // Serialize message field [steeringanglefrontaxleerramp_invalidflag]
    bufferOffset = _serializer.uint8(obj.steeringanglefrontaxleerramp_invalidflag, buffer, bufferOffset);
    // Serialize message field [steeringanglefrontaxle]
    bufferOffset = _serializer.float32(obj.steeringanglefrontaxle, buffer, bufferOffset);
    // Serialize message field [steeringanglefrontaxle_invalidflag]
    bufferOffset = _serializer.uint8(obj.steeringanglefrontaxle_invalidflag, buffer, bufferOffset);
    // Serialize message field [steeringanglefrontaxleeventdataqualifier]
    bufferOffset = _serializer.uint8(obj.steeringanglefrontaxleeventdataqualifier, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SteeringAngleFrontAxle
    let len;
    let data = new SteeringAngleFrontAxle(null);
    // Deserialize message field [qualifiersteeringanglefrontaxle]
    data.qualifiersteeringanglefrontaxle = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [steeringanglefrontaxleerramp]
    data.steeringanglefrontaxleerramp = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [steeringanglefrontaxleerramp_invalidflag]
    data.steeringanglefrontaxleerramp_invalidflag = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [steeringanglefrontaxle]
    data.steeringanglefrontaxle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [steeringanglefrontaxle_invalidflag]
    data.steeringanglefrontaxle_invalidflag = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [steeringanglefrontaxleeventdataqualifier]
    data.steeringanglefrontaxleeventdataqualifier = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ars548_messages/SteeringAngleFrontAxle';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '165f91e8ecdcab06db8015b2dbf74ced';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 qualifiersteeringanglefrontaxle #(unused) Steering angle front axle qualifier
    float32 steeringanglefrontaxleerramp #(unused) Error amplitude of steering angle front axle
    uint8 steeringanglefrontaxleerramp_invalidflag #(unused) Invalid flag steering angle front axle errAmp
    float32 steeringanglefrontaxle #Steering angle front axle
    uint8 steeringanglefrontaxle_invalidflag #(unused) Invalid flag steeting angle front axle
    uint8 steeringanglefrontaxleeventdataqualifier #(unused) Event data qualifier steering angle front axle
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SteeringAngleFrontAxle(null);
    if (msg.qualifiersteeringanglefrontaxle !== undefined) {
      resolved.qualifiersteeringanglefrontaxle = msg.qualifiersteeringanglefrontaxle;
    }
    else {
      resolved.qualifiersteeringanglefrontaxle = 0
    }

    if (msg.steeringanglefrontaxleerramp !== undefined) {
      resolved.steeringanglefrontaxleerramp = msg.steeringanglefrontaxleerramp;
    }
    else {
      resolved.steeringanglefrontaxleerramp = 0.0
    }

    if (msg.steeringanglefrontaxleerramp_invalidflag !== undefined) {
      resolved.steeringanglefrontaxleerramp_invalidflag = msg.steeringanglefrontaxleerramp_invalidflag;
    }
    else {
      resolved.steeringanglefrontaxleerramp_invalidflag = 0
    }

    if (msg.steeringanglefrontaxle !== undefined) {
      resolved.steeringanglefrontaxle = msg.steeringanglefrontaxle;
    }
    else {
      resolved.steeringanglefrontaxle = 0.0
    }

    if (msg.steeringanglefrontaxle_invalidflag !== undefined) {
      resolved.steeringanglefrontaxle_invalidflag = msg.steeringanglefrontaxle_invalidflag;
    }
    else {
      resolved.steeringanglefrontaxle_invalidflag = 0
    }

    if (msg.steeringanglefrontaxleeventdataqualifier !== undefined) {
      resolved.steeringanglefrontaxleeventdataqualifier = msg.steeringanglefrontaxleeventdataqualifier;
    }
    else {
      resolved.steeringanglefrontaxleeventdataqualifier = 0
    }

    return resolved;
    }
};

module.exports = SteeringAngleFrontAxle;
