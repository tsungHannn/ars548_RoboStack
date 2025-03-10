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

class SensorConfiguration {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.longitudinal = null;
      this.lateral = null;
      this.vertical = null;
      this.yaw = null;
      this.pitch = null;
      this.plugorientation = null;
      this.length = null;
      this.width = null;
      this.height = null;
      this.wheelbase = null;
      this.maximumdistance = null;
      this.frequencslot = null;
      this.cycletime = null;
      this.timeslot = null;
      this.hcc = null;
      this.powersave_standstill = null;
      this.sensoripaddress_0 = null;
      this.sensoripaddress_1 = null;
      this.newsensormounting = null;
      this.newvehicleparameters = null;
      this.newradarparameters = null;
      this.newnetworkconfiguration = null;
    }
    else {
      if (initObj.hasOwnProperty('longitudinal')) {
        this.longitudinal = initObj.longitudinal
      }
      else {
        this.longitudinal = 0.0;
      }
      if (initObj.hasOwnProperty('lateral')) {
        this.lateral = initObj.lateral
      }
      else {
        this.lateral = 0.0;
      }
      if (initObj.hasOwnProperty('vertical')) {
        this.vertical = initObj.vertical
      }
      else {
        this.vertical = 0.0;
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = 0.0;
      }
      if (initObj.hasOwnProperty('pitch')) {
        this.pitch = initObj.pitch
      }
      else {
        this.pitch = 0.0;
      }
      if (initObj.hasOwnProperty('plugorientation')) {
        this.plugorientation = initObj.plugorientation
      }
      else {
        this.plugorientation = 0;
      }
      if (initObj.hasOwnProperty('length')) {
        this.length = initObj.length
      }
      else {
        this.length = 0.0;
      }
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0.0;
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0.0;
      }
      if (initObj.hasOwnProperty('wheelbase')) {
        this.wheelbase = initObj.wheelbase
      }
      else {
        this.wheelbase = 0.0;
      }
      if (initObj.hasOwnProperty('maximumdistance')) {
        this.maximumdistance = initObj.maximumdistance
      }
      else {
        this.maximumdistance = 0;
      }
      if (initObj.hasOwnProperty('frequencslot')) {
        this.frequencslot = initObj.frequencslot
      }
      else {
        this.frequencslot = 0;
      }
      if (initObj.hasOwnProperty('cycletime')) {
        this.cycletime = initObj.cycletime
      }
      else {
        this.cycletime = 0;
      }
      if (initObj.hasOwnProperty('timeslot')) {
        this.timeslot = initObj.timeslot
      }
      else {
        this.timeslot = 0;
      }
      if (initObj.hasOwnProperty('hcc')) {
        this.hcc = initObj.hcc
      }
      else {
        this.hcc = 0;
      }
      if (initObj.hasOwnProperty('powersave_standstill')) {
        this.powersave_standstill = initObj.powersave_standstill
      }
      else {
        this.powersave_standstill = 0;
      }
      if (initObj.hasOwnProperty('sensoripaddress_0')) {
        this.sensoripaddress_0 = initObj.sensoripaddress_0
      }
      else {
        this.sensoripaddress_0 = 0;
      }
      if (initObj.hasOwnProperty('sensoripaddress_1')) {
        this.sensoripaddress_1 = initObj.sensoripaddress_1
      }
      else {
        this.sensoripaddress_1 = 0;
      }
      if (initObj.hasOwnProperty('newsensormounting')) {
        this.newsensormounting = initObj.newsensormounting
      }
      else {
        this.newsensormounting = 0;
      }
      if (initObj.hasOwnProperty('newvehicleparameters')) {
        this.newvehicleparameters = initObj.newvehicleparameters
      }
      else {
        this.newvehicleparameters = 0;
      }
      if (initObj.hasOwnProperty('newradarparameters')) {
        this.newradarparameters = initObj.newradarparameters
      }
      else {
        this.newradarparameters = 0;
      }
      if (initObj.hasOwnProperty('newnetworkconfiguration')) {
        this.newnetworkconfiguration = initObj.newnetworkconfiguration
      }
      else {
        this.newnetworkconfiguration = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SensorConfiguration
    // Serialize message field [longitudinal]
    bufferOffset = _serializer.float32(obj.longitudinal, buffer, bufferOffset);
    // Serialize message field [lateral]
    bufferOffset = _serializer.float32(obj.lateral, buffer, bufferOffset);
    // Serialize message field [vertical]
    bufferOffset = _serializer.float32(obj.vertical, buffer, bufferOffset);
    // Serialize message field [yaw]
    bufferOffset = _serializer.float32(obj.yaw, buffer, bufferOffset);
    // Serialize message field [pitch]
    bufferOffset = _serializer.float32(obj.pitch, buffer, bufferOffset);
    // Serialize message field [plugorientation]
    bufferOffset = _serializer.uint8(obj.plugorientation, buffer, bufferOffset);
    // Serialize message field [length]
    bufferOffset = _serializer.float32(obj.length, buffer, bufferOffset);
    // Serialize message field [width]
    bufferOffset = _serializer.float32(obj.width, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.float32(obj.height, buffer, bufferOffset);
    // Serialize message field [wheelbase]
    bufferOffset = _serializer.float32(obj.wheelbase, buffer, bufferOffset);
    // Serialize message field [maximumdistance]
    bufferOffset = _serializer.uint16(obj.maximumdistance, buffer, bufferOffset);
    // Serialize message field [frequencslot]
    bufferOffset = _serializer.uint8(obj.frequencslot, buffer, bufferOffset);
    // Serialize message field [cycletime]
    bufferOffset = _serializer.uint8(obj.cycletime, buffer, bufferOffset);
    // Serialize message field [timeslot]
    bufferOffset = _serializer.uint8(obj.timeslot, buffer, bufferOffset);
    // Serialize message field [hcc]
    bufferOffset = _serializer.uint8(obj.hcc, buffer, bufferOffset);
    // Serialize message field [powersave_standstill]
    bufferOffset = _serializer.uint8(obj.powersave_standstill, buffer, bufferOffset);
    // Serialize message field [sensoripaddress_0]
    bufferOffset = _serializer.uint32(obj.sensoripaddress_0, buffer, bufferOffset);
    // Serialize message field [sensoripaddress_1]
    bufferOffset = _serializer.uint32(obj.sensoripaddress_1, buffer, bufferOffset);
    // Serialize message field [newsensormounting]
    bufferOffset = _serializer.uint8(obj.newsensormounting, buffer, bufferOffset);
    // Serialize message field [newvehicleparameters]
    bufferOffset = _serializer.uint8(obj.newvehicleparameters, buffer, bufferOffset);
    // Serialize message field [newradarparameters]
    bufferOffset = _serializer.uint8(obj.newradarparameters, buffer, bufferOffset);
    // Serialize message field [newnetworkconfiguration]
    bufferOffset = _serializer.uint8(obj.newnetworkconfiguration, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SensorConfiguration
    let len;
    let data = new SensorConfiguration(null);
    // Deserialize message field [longitudinal]
    data.longitudinal = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [lateral]
    data.lateral = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [vertical]
    data.vertical = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yaw]
    data.yaw = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pitch]
    data.pitch = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [plugorientation]
    data.plugorientation = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [length]
    data.length = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [width]
    data.width = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [wheelbase]
    data.wheelbase = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [maximumdistance]
    data.maximumdistance = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [frequencslot]
    data.frequencslot = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [cycletime]
    data.cycletime = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [timeslot]
    data.timeslot = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [hcc]
    data.hcc = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [powersave_standstill]
    data.powersave_standstill = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [sensoripaddress_0]
    data.sensoripaddress_0 = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [sensoripaddress_1]
    data.sensoripaddress_1 = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [newsensormounting]
    data.newsensormounting = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [newvehicleparameters]
    data.newvehicleparameters = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [newradarparameters]
    data.newradarparameters = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [newnetworkconfiguration]
    data.newnetworkconfiguration = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 56;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ars548_messages/SensorConfiguration';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '431839fe505be3082a74c763bbc714ec';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 longitudinal #Longitudinal sensor position (AUTOSAR)
    float32 lateral #Lateral sensor position (AUTOSAR)
    float32 vertical #Vertical sensor position (AUTOSAR)
    float32 yaw #Sensor yaw angle (AUTOSAR)
    float32 pitch #Sensor pitch angle (AUTOSAR)
    uint8 plugorientation #Orientation of plug
    float32 length #Vehicle length
    float32 width #Vehicle width
    float32 height #Vehicle height
    float32 wheelbase #Vehicle wheelbase
    uint16 maximumdistance #Maximum detection distance
    uint8 frequencslot #Center frequency (if MaximumDistance < 190 m only Mid can be selected)
    uint8 cycletime #Cycle time
    uint8 timeslot #Cycle offset
    uint8 hcc #Country code
    uint8 powersave_standstill #Power saving in standstill
    uint32 sensoripaddress_0 #Sensor IP address
    uint32 sensoripaddress_1 #Reserved (Configure as 2852025457 or 169.254.116.113)
    uint8 newsensormounting #Flag if new sensor mounting position shall be configured
    uint8 newvehicleparameters #Flag if new vehicle parameters position shall be configured
    uint8 newradarparameters #Flag if new radar parameter shall be configured
    uint8 newnetworkconfiguration # Flag if new IP address shall be configured
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SensorConfiguration(null);
    if (msg.longitudinal !== undefined) {
      resolved.longitudinal = msg.longitudinal;
    }
    else {
      resolved.longitudinal = 0.0
    }

    if (msg.lateral !== undefined) {
      resolved.lateral = msg.lateral;
    }
    else {
      resolved.lateral = 0.0
    }

    if (msg.vertical !== undefined) {
      resolved.vertical = msg.vertical;
    }
    else {
      resolved.vertical = 0.0
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = 0.0
    }

    if (msg.pitch !== undefined) {
      resolved.pitch = msg.pitch;
    }
    else {
      resolved.pitch = 0.0
    }

    if (msg.plugorientation !== undefined) {
      resolved.plugorientation = msg.plugorientation;
    }
    else {
      resolved.plugorientation = 0
    }

    if (msg.length !== undefined) {
      resolved.length = msg.length;
    }
    else {
      resolved.length = 0.0
    }

    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0.0
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0.0
    }

    if (msg.wheelbase !== undefined) {
      resolved.wheelbase = msg.wheelbase;
    }
    else {
      resolved.wheelbase = 0.0
    }

    if (msg.maximumdistance !== undefined) {
      resolved.maximumdistance = msg.maximumdistance;
    }
    else {
      resolved.maximumdistance = 0
    }

    if (msg.frequencslot !== undefined) {
      resolved.frequencslot = msg.frequencslot;
    }
    else {
      resolved.frequencslot = 0
    }

    if (msg.cycletime !== undefined) {
      resolved.cycletime = msg.cycletime;
    }
    else {
      resolved.cycletime = 0
    }

    if (msg.timeslot !== undefined) {
      resolved.timeslot = msg.timeslot;
    }
    else {
      resolved.timeslot = 0
    }

    if (msg.hcc !== undefined) {
      resolved.hcc = msg.hcc;
    }
    else {
      resolved.hcc = 0
    }

    if (msg.powersave_standstill !== undefined) {
      resolved.powersave_standstill = msg.powersave_standstill;
    }
    else {
      resolved.powersave_standstill = 0
    }

    if (msg.sensoripaddress_0 !== undefined) {
      resolved.sensoripaddress_0 = msg.sensoripaddress_0;
    }
    else {
      resolved.sensoripaddress_0 = 0
    }

    if (msg.sensoripaddress_1 !== undefined) {
      resolved.sensoripaddress_1 = msg.sensoripaddress_1;
    }
    else {
      resolved.sensoripaddress_1 = 0
    }

    if (msg.newsensormounting !== undefined) {
      resolved.newsensormounting = msg.newsensormounting;
    }
    else {
      resolved.newsensormounting = 0
    }

    if (msg.newvehicleparameters !== undefined) {
      resolved.newvehicleparameters = msg.newvehicleparameters;
    }
    else {
      resolved.newvehicleparameters = 0
    }

    if (msg.newradarparameters !== undefined) {
      resolved.newradarparameters = msg.newradarparameters;
    }
    else {
      resolved.newradarparameters = 0
    }

    if (msg.newnetworkconfiguration !== undefined) {
      resolved.newnetworkconfiguration = msg.newnetworkconfiguration;
    }
    else {
      resolved.newnetworkconfiguration = 0
    }

    return resolved;
    }
};

module.exports = SensorConfiguration;
