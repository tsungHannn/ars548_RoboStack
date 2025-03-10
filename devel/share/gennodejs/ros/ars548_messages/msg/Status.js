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

class Status {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.timestamp_nanoseconds = null;
      this.timestamp_seconds = null;
      this.timestamp_syncstatus = null;
      this.swversion_major = null;
      this.swversion_minor = null;
      this.swversion_patch = null;
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
      this.maximundistance = null;
      this.frequencyslot = null;
      this.cycletime = null;
      this.timeslot = null;
      this.hcc = null;
      this.powersave_standstill = null;
      this.sensoripaddress_0 = null;
      this.sensoripaddress_1 = null;
      this.configurationcounter = null;
      this.status_longitudinalvelocity = null;
      this.status_longitudinalacceleration = null;
      this.status_lateralacceleration = null;
      this.status_yawrate = null;
      this.status_steeringangle = null;
      this.status_drivingdirection = null;
      this.status_characteristicspeed = null;
      this.status_radarstatus = null;
      this.status_voltagestatus = null;
      this.status_temperaturestatus = null;
      this.status_blockagestatus = null;
    }
    else {
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
      if (initObj.hasOwnProperty('swversion_major')) {
        this.swversion_major = initObj.swversion_major
      }
      else {
        this.swversion_major = 0;
      }
      if (initObj.hasOwnProperty('swversion_minor')) {
        this.swversion_minor = initObj.swversion_minor
      }
      else {
        this.swversion_minor = 0;
      }
      if (initObj.hasOwnProperty('swversion_patch')) {
        this.swversion_patch = initObj.swversion_patch
      }
      else {
        this.swversion_patch = 0;
      }
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
      if (initObj.hasOwnProperty('maximundistance')) {
        this.maximundistance = initObj.maximundistance
      }
      else {
        this.maximundistance = 0;
      }
      if (initObj.hasOwnProperty('frequencyslot')) {
        this.frequencyslot = initObj.frequencyslot
      }
      else {
        this.frequencyslot = 0;
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
      if (initObj.hasOwnProperty('configurationcounter')) {
        this.configurationcounter = initObj.configurationcounter
      }
      else {
        this.configurationcounter = 0;
      }
      if (initObj.hasOwnProperty('status_longitudinalvelocity')) {
        this.status_longitudinalvelocity = initObj.status_longitudinalvelocity
      }
      else {
        this.status_longitudinalvelocity = 0;
      }
      if (initObj.hasOwnProperty('status_longitudinalacceleration')) {
        this.status_longitudinalacceleration = initObj.status_longitudinalacceleration
      }
      else {
        this.status_longitudinalacceleration = 0;
      }
      if (initObj.hasOwnProperty('status_lateralacceleration')) {
        this.status_lateralacceleration = initObj.status_lateralacceleration
      }
      else {
        this.status_lateralacceleration = 0;
      }
      if (initObj.hasOwnProperty('status_yawrate')) {
        this.status_yawrate = initObj.status_yawrate
      }
      else {
        this.status_yawrate = 0;
      }
      if (initObj.hasOwnProperty('status_steeringangle')) {
        this.status_steeringangle = initObj.status_steeringangle
      }
      else {
        this.status_steeringangle = 0;
      }
      if (initObj.hasOwnProperty('status_drivingdirection')) {
        this.status_drivingdirection = initObj.status_drivingdirection
      }
      else {
        this.status_drivingdirection = 0;
      }
      if (initObj.hasOwnProperty('status_characteristicspeed')) {
        this.status_characteristicspeed = initObj.status_characteristicspeed
      }
      else {
        this.status_characteristicspeed = 0;
      }
      if (initObj.hasOwnProperty('status_radarstatus')) {
        this.status_radarstatus = initObj.status_radarstatus
      }
      else {
        this.status_radarstatus = 0;
      }
      if (initObj.hasOwnProperty('status_voltagestatus')) {
        this.status_voltagestatus = initObj.status_voltagestatus
      }
      else {
        this.status_voltagestatus = 0;
      }
      if (initObj.hasOwnProperty('status_temperaturestatus')) {
        this.status_temperaturestatus = initObj.status_temperaturestatus
      }
      else {
        this.status_temperaturestatus = 0;
      }
      if (initObj.hasOwnProperty('status_blockagestatus')) {
        this.status_blockagestatus = initObj.status_blockagestatus
      }
      else {
        this.status_blockagestatus = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Status
    // Serialize message field [timestamp_nanoseconds]
    bufferOffset = _serializer.uint32(obj.timestamp_nanoseconds, buffer, bufferOffset);
    // Serialize message field [timestamp_seconds]
    bufferOffset = _serializer.uint32(obj.timestamp_seconds, buffer, bufferOffset);
    // Serialize message field [timestamp_syncstatus]
    bufferOffset = _serializer.uint8(obj.timestamp_syncstatus, buffer, bufferOffset);
    // Serialize message field [swversion_major]
    bufferOffset = _serializer.uint8(obj.swversion_major, buffer, bufferOffset);
    // Serialize message field [swversion_minor]
    bufferOffset = _serializer.uint8(obj.swversion_minor, buffer, bufferOffset);
    // Serialize message field [swversion_patch]
    bufferOffset = _serializer.uint8(obj.swversion_patch, buffer, bufferOffset);
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
    // Serialize message field [maximundistance]
    bufferOffset = _serializer.uint16(obj.maximundistance, buffer, bufferOffset);
    // Serialize message field [frequencyslot]
    bufferOffset = _serializer.uint8(obj.frequencyslot, buffer, bufferOffset);
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
    // Serialize message field [configurationcounter]
    bufferOffset = _serializer.uint8(obj.configurationcounter, buffer, bufferOffset);
    // Serialize message field [status_longitudinalvelocity]
    bufferOffset = _serializer.uint8(obj.status_longitudinalvelocity, buffer, bufferOffset);
    // Serialize message field [status_longitudinalacceleration]
    bufferOffset = _serializer.uint8(obj.status_longitudinalacceleration, buffer, bufferOffset);
    // Serialize message field [status_lateralacceleration]
    bufferOffset = _serializer.uint8(obj.status_lateralacceleration, buffer, bufferOffset);
    // Serialize message field [status_yawrate]
    bufferOffset = _serializer.uint8(obj.status_yawrate, buffer, bufferOffset);
    // Serialize message field [status_steeringangle]
    bufferOffset = _serializer.uint8(obj.status_steeringangle, buffer, bufferOffset);
    // Serialize message field [status_drivingdirection]
    bufferOffset = _serializer.uint8(obj.status_drivingdirection, buffer, bufferOffset);
    // Serialize message field [status_characteristicspeed]
    bufferOffset = _serializer.uint8(obj.status_characteristicspeed, buffer, bufferOffset);
    // Serialize message field [status_radarstatus]
    bufferOffset = _serializer.uint8(obj.status_radarstatus, buffer, bufferOffset);
    // Serialize message field [status_voltagestatus]
    bufferOffset = _serializer.uint8(obj.status_voltagestatus, buffer, bufferOffset);
    // Serialize message field [status_temperaturestatus]
    bufferOffset = _serializer.uint8(obj.status_temperaturestatus, buffer, bufferOffset);
    // Serialize message field [status_blockagestatus]
    bufferOffset = _serializer.uint8(obj.status_blockagestatus, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Status
    let len;
    let data = new Status(null);
    // Deserialize message field [timestamp_nanoseconds]
    data.timestamp_nanoseconds = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [timestamp_seconds]
    data.timestamp_seconds = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [timestamp_syncstatus]
    data.timestamp_syncstatus = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [swversion_major]
    data.swversion_major = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [swversion_minor]
    data.swversion_minor = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [swversion_patch]
    data.swversion_patch = _deserializer.uint8(buffer, bufferOffset);
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
    // Deserialize message field [maximundistance]
    data.maximundistance = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [frequencyslot]
    data.frequencyslot = _deserializer.uint8(buffer, bufferOffset);
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
    // Deserialize message field [configurationcounter]
    data.configurationcounter = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [status_longitudinalvelocity]
    data.status_longitudinalvelocity = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [status_longitudinalacceleration]
    data.status_longitudinalacceleration = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [status_lateralacceleration]
    data.status_lateralacceleration = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [status_yawrate]
    data.status_yawrate = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [status_steeringangle]
    data.status_steeringangle = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [status_drivingdirection]
    data.status_drivingdirection = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [status_characteristicspeed]
    data.status_characteristicspeed = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [status_radarstatus]
    data.status_radarstatus = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [status_voltagestatus]
    data.status_voltagestatus = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [status_temperaturestatus]
    data.status_temperaturestatus = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [status_blockagestatus]
    data.status_blockagestatus = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 76;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ars548_messages/Status';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '434403d6c9393e6a7279af521716619e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32 timestamp_nanoseconds #Timestamp Nanoseconds
    uint32 timestamp_seconds #Timestamp Seconds
    uint8 timestamp_syncstatus #Timestamp Sync Status
    uint8 swversion_major #Software version (major)
    uint8 swversion_minor #Software version (minor)
    uint8 swversion_patch #Software version (patch)
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
    uint16 maximundistance #Maximum detection distance
    uint8 frequencyslot #Center frequency
    uint8 cycletime #Cycle time
    uint8 timeslot #Cycle offset
    uint8 hcc #Country code
    uint8 powersave_standstill #Power saving in standstill
    uint32 sensoripaddress_0 #Sensor IP address
    uint32 sensoripaddress_1 #Reserved
    uint8 configurationcounter #Counter that counts up if new configuration has been received and accepted
    uint8 status_longitudinalvelocity #Signals if current VDY is OK or timed out
    uint8 status_longitudinalacceleration #Signals if current VDY is OK or timed out
    uint8 status_lateralacceleration #Signals if current VDY is OK or timed out
    uint8 status_yawrate #Signals if current VDY is OK or timed out
    uint8 status_steeringangle #Signals if current VDY is OK or timed out
    uint8 status_drivingdirection #Signals if current VDY is OK or timed out
    uint8 status_characteristicspeed #(Unused) Signals if current VDY is OK or timed out.
    uint8 status_radarstatus #Signals if Radar Status is OK
    uint8 status_voltagestatus # Bitfield to report under- and overvoltage errors
    uint8 status_temperaturestatus #Bitfield to report under- and overtemperature errors
    uint8 status_blockagestatus #Current blockage state and blockage self test state.
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Status(null);
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

    if (msg.swversion_major !== undefined) {
      resolved.swversion_major = msg.swversion_major;
    }
    else {
      resolved.swversion_major = 0
    }

    if (msg.swversion_minor !== undefined) {
      resolved.swversion_minor = msg.swversion_minor;
    }
    else {
      resolved.swversion_minor = 0
    }

    if (msg.swversion_patch !== undefined) {
      resolved.swversion_patch = msg.swversion_patch;
    }
    else {
      resolved.swversion_patch = 0
    }

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

    if (msg.maximundistance !== undefined) {
      resolved.maximundistance = msg.maximundistance;
    }
    else {
      resolved.maximundistance = 0
    }

    if (msg.frequencyslot !== undefined) {
      resolved.frequencyslot = msg.frequencyslot;
    }
    else {
      resolved.frequencyslot = 0
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

    if (msg.configurationcounter !== undefined) {
      resolved.configurationcounter = msg.configurationcounter;
    }
    else {
      resolved.configurationcounter = 0
    }

    if (msg.status_longitudinalvelocity !== undefined) {
      resolved.status_longitudinalvelocity = msg.status_longitudinalvelocity;
    }
    else {
      resolved.status_longitudinalvelocity = 0
    }

    if (msg.status_longitudinalacceleration !== undefined) {
      resolved.status_longitudinalacceleration = msg.status_longitudinalacceleration;
    }
    else {
      resolved.status_longitudinalacceleration = 0
    }

    if (msg.status_lateralacceleration !== undefined) {
      resolved.status_lateralacceleration = msg.status_lateralacceleration;
    }
    else {
      resolved.status_lateralacceleration = 0
    }

    if (msg.status_yawrate !== undefined) {
      resolved.status_yawrate = msg.status_yawrate;
    }
    else {
      resolved.status_yawrate = 0
    }

    if (msg.status_steeringangle !== undefined) {
      resolved.status_steeringangle = msg.status_steeringangle;
    }
    else {
      resolved.status_steeringangle = 0
    }

    if (msg.status_drivingdirection !== undefined) {
      resolved.status_drivingdirection = msg.status_drivingdirection;
    }
    else {
      resolved.status_drivingdirection = 0
    }

    if (msg.status_characteristicspeed !== undefined) {
      resolved.status_characteristicspeed = msg.status_characteristicspeed;
    }
    else {
      resolved.status_characteristicspeed = 0
    }

    if (msg.status_radarstatus !== undefined) {
      resolved.status_radarstatus = msg.status_radarstatus;
    }
    else {
      resolved.status_radarstatus = 0
    }

    if (msg.status_voltagestatus !== undefined) {
      resolved.status_voltagestatus = msg.status_voltagestatus;
    }
    else {
      resolved.status_voltagestatus = 0
    }

    if (msg.status_temperaturestatus !== undefined) {
      resolved.status_temperaturestatus = msg.status_temperaturestatus;
    }
    else {
      resolved.status_temperaturestatus = 0
    }

    if (msg.status_blockagestatus !== undefined) {
      resolved.status_blockagestatus = msg.status_blockagestatus;
    }
    else {
      resolved.status_blockagestatus = 0
    }

    return resolved;
    }
};

module.exports = Status;
