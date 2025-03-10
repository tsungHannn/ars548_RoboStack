
"use strict";

let SteeringAngleFrontAxle = require('./SteeringAngleFrontAxle.js');
let VelocityVehicle = require('./VelocityVehicle.js');
let Object = require('./Object.js');
let Detection = require('./Detection.js');
let DetectionList = require('./DetectionList.js');
let DrivingDirection = require('./DrivingDirection.js');
let CharacteristicSpeed = require('./CharacteristicSpeed.js');
let AccelerationLongitudinalCoG = require('./AccelerationLongitudinalCoG.js');
let AccelerationLateralCoG = require('./AccelerationLateralCoG.js');
let ObjectList = require('./ObjectList.js');
let Status = require('./Status.js');
let YawRate = require('./YawRate.js');
let SensorConfiguration = require('./SensorConfiguration.js');

module.exports = {
  SteeringAngleFrontAxle: SteeringAngleFrontAxle,
  VelocityVehicle: VelocityVehicle,
  Object: Object,
  Detection: Detection,
  DetectionList: DetectionList,
  DrivingDirection: DrivingDirection,
  CharacteristicSpeed: CharacteristicSpeed,
  AccelerationLongitudinalCoG: AccelerationLongitudinalCoG,
  AccelerationLateralCoG: AccelerationLateralCoG,
  ObjectList: ObjectList,
  Status: Status,
  YawRate: YawRate,
  SensorConfiguration: SensorConfiguration,
};
