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

class CharacteristicSpeed {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.characteristicspeederramp = null;
      this.qualifiercharacteristicspeed = null;
      this.characteristicspeed = null;
    }
    else {
      if (initObj.hasOwnProperty('characteristicspeederramp')) {
        this.characteristicspeederramp = initObj.characteristicspeederramp
      }
      else {
        this.characteristicspeederramp = 0;
      }
      if (initObj.hasOwnProperty('qualifiercharacteristicspeed')) {
        this.qualifiercharacteristicspeed = initObj.qualifiercharacteristicspeed
      }
      else {
        this.qualifiercharacteristicspeed = 0;
      }
      if (initObj.hasOwnProperty('characteristicspeed')) {
        this.characteristicspeed = initObj.characteristicspeed
      }
      else {
        this.characteristicspeed = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CharacteristicSpeed
    // Serialize message field [characteristicspeederramp]
    bufferOffset = _serializer.uint8(obj.characteristicspeederramp, buffer, bufferOffset);
    // Serialize message field [qualifiercharacteristicspeed]
    bufferOffset = _serializer.uint8(obj.qualifiercharacteristicspeed, buffer, bufferOffset);
    // Serialize message field [characteristicspeed]
    bufferOffset = _serializer.uint8(obj.characteristicspeed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CharacteristicSpeed
    let len;
    let data = new CharacteristicSpeed(null);
    // Deserialize message field [characteristicspeederramp]
    data.characteristicspeederramp = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [qualifiercharacteristicspeed]
    data.qualifiercharacteristicspeed = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [characteristicspeed]
    data.characteristicspeed = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 3;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ars548_messages/CharacteristicSpeed';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '08f85cc48916f7bc1371d09df58338bd';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 characteristicspeederramp #(Unused) Error amplitude of characteristic speed
    uint8  qualifiercharacteristicspeed #(Unused) Characteristic speed qualifier
    uint8 characteristicspeed # Characteristic speed
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CharacteristicSpeed(null);
    if (msg.characteristicspeederramp !== undefined) {
      resolved.characteristicspeederramp = msg.characteristicspeederramp;
    }
    else {
      resolved.characteristicspeederramp = 0
    }

    if (msg.qualifiercharacteristicspeed !== undefined) {
      resolved.qualifiercharacteristicspeed = msg.qualifiercharacteristicspeed;
    }
    else {
      resolved.qualifiercharacteristicspeed = 0
    }

    if (msg.characteristicspeed !== undefined) {
      resolved.characteristicspeed = msg.characteristicspeed;
    }
    else {
      resolved.characteristicspeed = 0
    }

    return resolved;
    }
};

module.exports = CharacteristicSpeed;
