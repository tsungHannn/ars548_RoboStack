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

class VelocityVehicle {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.statusvelocitynearstandstill = null;
      this.qualifiervelocityvehicle = null;
      this.velocityvehicleeventdataqualifier = null;
      this.velocityvehicle = null;
      this.velocityvehicle_invalidflag = null;
    }
    else {
      if (initObj.hasOwnProperty('statusvelocitynearstandstill')) {
        this.statusvelocitynearstandstill = initObj.statusvelocitynearstandstill
      }
      else {
        this.statusvelocitynearstandstill = 0;
      }
      if (initObj.hasOwnProperty('qualifiervelocityvehicle')) {
        this.qualifiervelocityvehicle = initObj.qualifiervelocityvehicle
      }
      else {
        this.qualifiervelocityvehicle = 0;
      }
      if (initObj.hasOwnProperty('velocityvehicleeventdataqualifier')) {
        this.velocityvehicleeventdataqualifier = initObj.velocityvehicleeventdataqualifier
      }
      else {
        this.velocityvehicleeventdataqualifier = 0;
      }
      if (initObj.hasOwnProperty('velocityvehicle')) {
        this.velocityvehicle = initObj.velocityvehicle
      }
      else {
        this.velocityvehicle = 0.0;
      }
      if (initObj.hasOwnProperty('velocityvehicle_invalidflag')) {
        this.velocityvehicle_invalidflag = initObj.velocityvehicle_invalidflag
      }
      else {
        this.velocityvehicle_invalidflag = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VelocityVehicle
    // Serialize message field [statusvelocitynearstandstill]
    bufferOffset = _serializer.uint8(obj.statusvelocitynearstandstill, buffer, bufferOffset);
    // Serialize message field [qualifiervelocityvehicle]
    bufferOffset = _serializer.uint8(obj.qualifiervelocityvehicle, buffer, bufferOffset);
    // Serialize message field [velocityvehicleeventdataqualifier]
    bufferOffset = _serializer.uint8(obj.velocityvehicleeventdataqualifier, buffer, bufferOffset);
    // Serialize message field [velocityvehicle]
    bufferOffset = _serializer.float32(obj.velocityvehicle, buffer, bufferOffset);
    // Serialize message field [velocityvehicle_invalidflag]
    bufferOffset = _serializer.uint8(obj.velocityvehicle_invalidflag, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VelocityVehicle
    let len;
    let data = new VelocityVehicle(null);
    // Deserialize message field [statusvelocitynearstandstill]
    data.statusvelocitynearstandstill = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [qualifiervelocityvehicle]
    data.qualifiervelocityvehicle = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [velocityvehicleeventdataqualifier]
    data.velocityvehicleeventdataqualifier = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [velocityvehicle]
    data.velocityvehicle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [velocityvehicle_invalidflag]
    data.velocityvehicle_invalidflag = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ars548_messages/VelocityVehicle';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e3ed8fe15e904859bdc21697bcec872a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 statusvelocitynearstandstill #(unused) Velocity near standstill status
    uint8 qualifiervelocityvehicle  #(unused) VelovityVehicle qualifier
    uint8 velocityvehicleeventdataqualifier #(unused) Event data qualifier VelocityVehicle
    float32 velocityvehicle # VelocityVehicle
    uint8 velocityvehicle_invalidflag #(unused) Invalid flag VelocityVehicle
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VelocityVehicle(null);
    if (msg.statusvelocitynearstandstill !== undefined) {
      resolved.statusvelocitynearstandstill = msg.statusvelocitynearstandstill;
    }
    else {
      resolved.statusvelocitynearstandstill = 0
    }

    if (msg.qualifiervelocityvehicle !== undefined) {
      resolved.qualifiervelocityvehicle = msg.qualifiervelocityvehicle;
    }
    else {
      resolved.qualifiervelocityvehicle = 0
    }

    if (msg.velocityvehicleeventdataqualifier !== undefined) {
      resolved.velocityvehicleeventdataqualifier = msg.velocityvehicleeventdataqualifier;
    }
    else {
      resolved.velocityvehicleeventdataqualifier = 0
    }

    if (msg.velocityvehicle !== undefined) {
      resolved.velocityvehicle = msg.velocityvehicle;
    }
    else {
      resolved.velocityvehicle = 0.0
    }

    if (msg.velocityvehicle_invalidflag !== undefined) {
      resolved.velocityvehicle_invalidflag = msg.velocityvehicle_invalidflag;
    }
    else {
      resolved.velocityvehicle_invalidflag = 0
    }

    return resolved;
    }
};

module.exports = VelocityVehicle;
