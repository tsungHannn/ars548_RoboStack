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

class Object {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.u_statussensor = null;
      this.u_id = null;
      this.u_age = null;
      this.u_statusmeasurement = null;
      this.u_statusmovement = null;
      this.u_position_invalidflags = null;
      this.u_position_reference = null;
      this.u_position_x = null;
      this.u_position_x_std = null;
      this.u_position_y = null;
      this.u_position_y_std = null;
      this.u_position_z = null;
      this.u_position_z_std = null;
      this.u_position_covariancexy = null;
      this.u_position_orientation = null;
      this.u_position_orientation_std = null;
      this.u_existence_invalidflags = null;
      this.u_existence_probability = null;
      this.u_existence_ppv = null;
      this.u_classification_car = null;
      this.u_classification_truck = null;
      this.u_classification_motorcycle = null;
      this.u_classification_bicycle = null;
      this.u_classification_pedestrian = null;
      this.u_classification_animal = null;
      this.u_classification_hazard = null;
      this.u_classification_unknown = null;
      this.u_classification_overdrivable = null;
      this.u_classification_underdrivable = null;
      this.u_dynamics_absvel_invalidflags = null;
      this.f_dynamics_absvel_x = null;
      this.f_dynamics_absvel_x_std = null;
      this.f_dynamics_absvel_y = null;
      this.f_dynamics_absvel_y_std = null;
      this.f_dynamics_absvel_covariancexy = null;
      this.u_dynamics_relvel_invalidflags = null;
      this.f_dynamics_relvel_x = null;
      this.f_dynamics_relvel_x_std = null;
      this.f_dynamics_relvel_y = null;
      this.f_dynamics_relvel_y_std = null;
      this.f_dynamics_relvel_covariancexy = null;
      this.u_dynamics_absaccel_invalidflags = null;
      this.f_dynamics_absaccel_x = null;
      this.f_dynamics_absaccel_x_std = null;
      this.f_dynamics_absaccel_y = null;
      this.f_dynamics_absaccel_y_std = null;
      this.f_dynamics_absaccel_covariancexy = null;
      this.u_dynamics_relaccel_invalidflags = null;
      this.f_dynamics_relaccel_x = null;
      this.f_dynamics_relaccel_x_std = null;
      this.f_dynamics_relaccel_y = null;
      this.f_dynamics_relaccel_y_std = null;
      this.f_dynamics_relaccel_covariancexy = null;
      this.u_dynamics_orientation_invalidflags = null;
      this.u_dynamics_orientation_rate_mean = null;
      this.u_dynamics_orientation_rate_std = null;
      this.u_shape_length_status = null;
      this.u_shape_length_edge_invalidflags = null;
      this.u_shape_length_edge_mean = null;
      this.u_shape_length_edge_std = null;
      this.u_shape_width_status = null;
      this.u_shape_width_edge_invalidflags = null;
      this.u_shape_width_edge_mean = null;
      this.u_shape_width_edge_std = null;
    }
    else {
      if (initObj.hasOwnProperty('u_statussensor')) {
        this.u_statussensor = initObj.u_statussensor
      }
      else {
        this.u_statussensor = 0;
      }
      if (initObj.hasOwnProperty('u_id')) {
        this.u_id = initObj.u_id
      }
      else {
        this.u_id = 0;
      }
      if (initObj.hasOwnProperty('u_age')) {
        this.u_age = initObj.u_age
      }
      else {
        this.u_age = 0;
      }
      if (initObj.hasOwnProperty('u_statusmeasurement')) {
        this.u_statusmeasurement = initObj.u_statusmeasurement
      }
      else {
        this.u_statusmeasurement = 0;
      }
      if (initObj.hasOwnProperty('u_statusmovement')) {
        this.u_statusmovement = initObj.u_statusmovement
      }
      else {
        this.u_statusmovement = 0;
      }
      if (initObj.hasOwnProperty('u_position_invalidflags')) {
        this.u_position_invalidflags = initObj.u_position_invalidflags
      }
      else {
        this.u_position_invalidflags = 0;
      }
      if (initObj.hasOwnProperty('u_position_reference')) {
        this.u_position_reference = initObj.u_position_reference
      }
      else {
        this.u_position_reference = 0;
      }
      if (initObj.hasOwnProperty('u_position_x')) {
        this.u_position_x = initObj.u_position_x
      }
      else {
        this.u_position_x = 0.0;
      }
      if (initObj.hasOwnProperty('u_position_x_std')) {
        this.u_position_x_std = initObj.u_position_x_std
      }
      else {
        this.u_position_x_std = 0.0;
      }
      if (initObj.hasOwnProperty('u_position_y')) {
        this.u_position_y = initObj.u_position_y
      }
      else {
        this.u_position_y = 0.0;
      }
      if (initObj.hasOwnProperty('u_position_y_std')) {
        this.u_position_y_std = initObj.u_position_y_std
      }
      else {
        this.u_position_y_std = 0.0;
      }
      if (initObj.hasOwnProperty('u_position_z')) {
        this.u_position_z = initObj.u_position_z
      }
      else {
        this.u_position_z = 0.0;
      }
      if (initObj.hasOwnProperty('u_position_z_std')) {
        this.u_position_z_std = initObj.u_position_z_std
      }
      else {
        this.u_position_z_std = 0.0;
      }
      if (initObj.hasOwnProperty('u_position_covariancexy')) {
        this.u_position_covariancexy = initObj.u_position_covariancexy
      }
      else {
        this.u_position_covariancexy = 0.0;
      }
      if (initObj.hasOwnProperty('u_position_orientation')) {
        this.u_position_orientation = initObj.u_position_orientation
      }
      else {
        this.u_position_orientation = 0.0;
      }
      if (initObj.hasOwnProperty('u_position_orientation_std')) {
        this.u_position_orientation_std = initObj.u_position_orientation_std
      }
      else {
        this.u_position_orientation_std = 0.0;
      }
      if (initObj.hasOwnProperty('u_existence_invalidflags')) {
        this.u_existence_invalidflags = initObj.u_existence_invalidflags
      }
      else {
        this.u_existence_invalidflags = 0;
      }
      if (initObj.hasOwnProperty('u_existence_probability')) {
        this.u_existence_probability = initObj.u_existence_probability
      }
      else {
        this.u_existence_probability = 0.0;
      }
      if (initObj.hasOwnProperty('u_existence_ppv')) {
        this.u_existence_ppv = initObj.u_existence_ppv
      }
      else {
        this.u_existence_ppv = 0.0;
      }
      if (initObj.hasOwnProperty('u_classification_car')) {
        this.u_classification_car = initObj.u_classification_car
      }
      else {
        this.u_classification_car = 0;
      }
      if (initObj.hasOwnProperty('u_classification_truck')) {
        this.u_classification_truck = initObj.u_classification_truck
      }
      else {
        this.u_classification_truck = 0;
      }
      if (initObj.hasOwnProperty('u_classification_motorcycle')) {
        this.u_classification_motorcycle = initObj.u_classification_motorcycle
      }
      else {
        this.u_classification_motorcycle = 0;
      }
      if (initObj.hasOwnProperty('u_classification_bicycle')) {
        this.u_classification_bicycle = initObj.u_classification_bicycle
      }
      else {
        this.u_classification_bicycle = 0;
      }
      if (initObj.hasOwnProperty('u_classification_pedestrian')) {
        this.u_classification_pedestrian = initObj.u_classification_pedestrian
      }
      else {
        this.u_classification_pedestrian = 0;
      }
      if (initObj.hasOwnProperty('u_classification_animal')) {
        this.u_classification_animal = initObj.u_classification_animal
      }
      else {
        this.u_classification_animal = 0;
      }
      if (initObj.hasOwnProperty('u_classification_hazard')) {
        this.u_classification_hazard = initObj.u_classification_hazard
      }
      else {
        this.u_classification_hazard = 0;
      }
      if (initObj.hasOwnProperty('u_classification_unknown')) {
        this.u_classification_unknown = initObj.u_classification_unknown
      }
      else {
        this.u_classification_unknown = 0;
      }
      if (initObj.hasOwnProperty('u_classification_overdrivable')) {
        this.u_classification_overdrivable = initObj.u_classification_overdrivable
      }
      else {
        this.u_classification_overdrivable = 0;
      }
      if (initObj.hasOwnProperty('u_classification_underdrivable')) {
        this.u_classification_underdrivable = initObj.u_classification_underdrivable
      }
      else {
        this.u_classification_underdrivable = 0;
      }
      if (initObj.hasOwnProperty('u_dynamics_absvel_invalidflags')) {
        this.u_dynamics_absvel_invalidflags = initObj.u_dynamics_absvel_invalidflags
      }
      else {
        this.u_dynamics_absvel_invalidflags = 0;
      }
      if (initObj.hasOwnProperty('f_dynamics_absvel_x')) {
        this.f_dynamics_absvel_x = initObj.f_dynamics_absvel_x
      }
      else {
        this.f_dynamics_absvel_x = 0.0;
      }
      if (initObj.hasOwnProperty('f_dynamics_absvel_x_std')) {
        this.f_dynamics_absvel_x_std = initObj.f_dynamics_absvel_x_std
      }
      else {
        this.f_dynamics_absvel_x_std = 0.0;
      }
      if (initObj.hasOwnProperty('f_dynamics_absvel_y')) {
        this.f_dynamics_absvel_y = initObj.f_dynamics_absvel_y
      }
      else {
        this.f_dynamics_absvel_y = 0.0;
      }
      if (initObj.hasOwnProperty('f_dynamics_absvel_y_std')) {
        this.f_dynamics_absvel_y_std = initObj.f_dynamics_absvel_y_std
      }
      else {
        this.f_dynamics_absvel_y_std = 0.0;
      }
      if (initObj.hasOwnProperty('f_dynamics_absvel_covariancexy')) {
        this.f_dynamics_absvel_covariancexy = initObj.f_dynamics_absvel_covariancexy
      }
      else {
        this.f_dynamics_absvel_covariancexy = 0.0;
      }
      if (initObj.hasOwnProperty('u_dynamics_relvel_invalidflags')) {
        this.u_dynamics_relvel_invalidflags = initObj.u_dynamics_relvel_invalidflags
      }
      else {
        this.u_dynamics_relvel_invalidflags = 0;
      }
      if (initObj.hasOwnProperty('f_dynamics_relvel_x')) {
        this.f_dynamics_relvel_x = initObj.f_dynamics_relvel_x
      }
      else {
        this.f_dynamics_relvel_x = 0.0;
      }
      if (initObj.hasOwnProperty('f_dynamics_relvel_x_std')) {
        this.f_dynamics_relvel_x_std = initObj.f_dynamics_relvel_x_std
      }
      else {
        this.f_dynamics_relvel_x_std = 0.0;
      }
      if (initObj.hasOwnProperty('f_dynamics_relvel_y')) {
        this.f_dynamics_relvel_y = initObj.f_dynamics_relvel_y
      }
      else {
        this.f_dynamics_relvel_y = 0.0;
      }
      if (initObj.hasOwnProperty('f_dynamics_relvel_y_std')) {
        this.f_dynamics_relvel_y_std = initObj.f_dynamics_relvel_y_std
      }
      else {
        this.f_dynamics_relvel_y_std = 0.0;
      }
      if (initObj.hasOwnProperty('f_dynamics_relvel_covariancexy')) {
        this.f_dynamics_relvel_covariancexy = initObj.f_dynamics_relvel_covariancexy
      }
      else {
        this.f_dynamics_relvel_covariancexy = 0.0;
      }
      if (initObj.hasOwnProperty('u_dynamics_absaccel_invalidflags')) {
        this.u_dynamics_absaccel_invalidflags = initObj.u_dynamics_absaccel_invalidflags
      }
      else {
        this.u_dynamics_absaccel_invalidflags = 0;
      }
      if (initObj.hasOwnProperty('f_dynamics_absaccel_x')) {
        this.f_dynamics_absaccel_x = initObj.f_dynamics_absaccel_x
      }
      else {
        this.f_dynamics_absaccel_x = 0.0;
      }
      if (initObj.hasOwnProperty('f_dynamics_absaccel_x_std')) {
        this.f_dynamics_absaccel_x_std = initObj.f_dynamics_absaccel_x_std
      }
      else {
        this.f_dynamics_absaccel_x_std = 0.0;
      }
      if (initObj.hasOwnProperty('f_dynamics_absaccel_y')) {
        this.f_dynamics_absaccel_y = initObj.f_dynamics_absaccel_y
      }
      else {
        this.f_dynamics_absaccel_y = 0.0;
      }
      if (initObj.hasOwnProperty('f_dynamics_absaccel_y_std')) {
        this.f_dynamics_absaccel_y_std = initObj.f_dynamics_absaccel_y_std
      }
      else {
        this.f_dynamics_absaccel_y_std = 0.0;
      }
      if (initObj.hasOwnProperty('f_dynamics_absaccel_covariancexy')) {
        this.f_dynamics_absaccel_covariancexy = initObj.f_dynamics_absaccel_covariancexy
      }
      else {
        this.f_dynamics_absaccel_covariancexy = 0.0;
      }
      if (initObj.hasOwnProperty('u_dynamics_relaccel_invalidflags')) {
        this.u_dynamics_relaccel_invalidflags = initObj.u_dynamics_relaccel_invalidflags
      }
      else {
        this.u_dynamics_relaccel_invalidflags = 0;
      }
      if (initObj.hasOwnProperty('f_dynamics_relaccel_x')) {
        this.f_dynamics_relaccel_x = initObj.f_dynamics_relaccel_x
      }
      else {
        this.f_dynamics_relaccel_x = 0.0;
      }
      if (initObj.hasOwnProperty('f_dynamics_relaccel_x_std')) {
        this.f_dynamics_relaccel_x_std = initObj.f_dynamics_relaccel_x_std
      }
      else {
        this.f_dynamics_relaccel_x_std = 0.0;
      }
      if (initObj.hasOwnProperty('f_dynamics_relaccel_y')) {
        this.f_dynamics_relaccel_y = initObj.f_dynamics_relaccel_y
      }
      else {
        this.f_dynamics_relaccel_y = 0.0;
      }
      if (initObj.hasOwnProperty('f_dynamics_relaccel_y_std')) {
        this.f_dynamics_relaccel_y_std = initObj.f_dynamics_relaccel_y_std
      }
      else {
        this.f_dynamics_relaccel_y_std = 0.0;
      }
      if (initObj.hasOwnProperty('f_dynamics_relaccel_covariancexy')) {
        this.f_dynamics_relaccel_covariancexy = initObj.f_dynamics_relaccel_covariancexy
      }
      else {
        this.f_dynamics_relaccel_covariancexy = 0.0;
      }
      if (initObj.hasOwnProperty('u_dynamics_orientation_invalidflags')) {
        this.u_dynamics_orientation_invalidflags = initObj.u_dynamics_orientation_invalidflags
      }
      else {
        this.u_dynamics_orientation_invalidflags = 0;
      }
      if (initObj.hasOwnProperty('u_dynamics_orientation_rate_mean')) {
        this.u_dynamics_orientation_rate_mean = initObj.u_dynamics_orientation_rate_mean
      }
      else {
        this.u_dynamics_orientation_rate_mean = 0.0;
      }
      if (initObj.hasOwnProperty('u_dynamics_orientation_rate_std')) {
        this.u_dynamics_orientation_rate_std = initObj.u_dynamics_orientation_rate_std
      }
      else {
        this.u_dynamics_orientation_rate_std = 0.0;
      }
      if (initObj.hasOwnProperty('u_shape_length_status')) {
        this.u_shape_length_status = initObj.u_shape_length_status
      }
      else {
        this.u_shape_length_status = 0;
      }
      if (initObj.hasOwnProperty('u_shape_length_edge_invalidflags')) {
        this.u_shape_length_edge_invalidflags = initObj.u_shape_length_edge_invalidflags
      }
      else {
        this.u_shape_length_edge_invalidflags = 0;
      }
      if (initObj.hasOwnProperty('u_shape_length_edge_mean')) {
        this.u_shape_length_edge_mean = initObj.u_shape_length_edge_mean
      }
      else {
        this.u_shape_length_edge_mean = 0.0;
      }
      if (initObj.hasOwnProperty('u_shape_length_edge_std')) {
        this.u_shape_length_edge_std = initObj.u_shape_length_edge_std
      }
      else {
        this.u_shape_length_edge_std = 0.0;
      }
      if (initObj.hasOwnProperty('u_shape_width_status')) {
        this.u_shape_width_status = initObj.u_shape_width_status
      }
      else {
        this.u_shape_width_status = 0;
      }
      if (initObj.hasOwnProperty('u_shape_width_edge_invalidflags')) {
        this.u_shape_width_edge_invalidflags = initObj.u_shape_width_edge_invalidflags
      }
      else {
        this.u_shape_width_edge_invalidflags = 0;
      }
      if (initObj.hasOwnProperty('u_shape_width_edge_mean')) {
        this.u_shape_width_edge_mean = initObj.u_shape_width_edge_mean
      }
      else {
        this.u_shape_width_edge_mean = 0.0;
      }
      if (initObj.hasOwnProperty('u_shape_width_edge_std')) {
        this.u_shape_width_edge_std = initObj.u_shape_width_edge_std
      }
      else {
        this.u_shape_width_edge_std = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Object
    // Serialize message field [u_statussensor]
    bufferOffset = _serializer.uint16(obj.u_statussensor, buffer, bufferOffset);
    // Serialize message field [u_id]
    bufferOffset = _serializer.uint32(obj.u_id, buffer, bufferOffset);
    // Serialize message field [u_age]
    bufferOffset = _serializer.uint16(obj.u_age, buffer, bufferOffset);
    // Serialize message field [u_statusmeasurement]
    bufferOffset = _serializer.uint8(obj.u_statusmeasurement, buffer, bufferOffset);
    // Serialize message field [u_statusmovement]
    bufferOffset = _serializer.uint8(obj.u_statusmovement, buffer, bufferOffset);
    // Serialize message field [u_position_invalidflags]
    bufferOffset = _serializer.uint16(obj.u_position_invalidflags, buffer, bufferOffset);
    // Serialize message field [u_position_reference]
    bufferOffset = _serializer.uint8(obj.u_position_reference, buffer, bufferOffset);
    // Serialize message field [u_position_x]
    bufferOffset = _serializer.float32(obj.u_position_x, buffer, bufferOffset);
    // Serialize message field [u_position_x_std]
    bufferOffset = _serializer.float32(obj.u_position_x_std, buffer, bufferOffset);
    // Serialize message field [u_position_y]
    bufferOffset = _serializer.float32(obj.u_position_y, buffer, bufferOffset);
    // Serialize message field [u_position_y_std]
    bufferOffset = _serializer.float32(obj.u_position_y_std, buffer, bufferOffset);
    // Serialize message field [u_position_z]
    bufferOffset = _serializer.float32(obj.u_position_z, buffer, bufferOffset);
    // Serialize message field [u_position_z_std]
    bufferOffset = _serializer.float32(obj.u_position_z_std, buffer, bufferOffset);
    // Serialize message field [u_position_covariancexy]
    bufferOffset = _serializer.float32(obj.u_position_covariancexy, buffer, bufferOffset);
    // Serialize message field [u_position_orientation]
    bufferOffset = _serializer.float32(obj.u_position_orientation, buffer, bufferOffset);
    // Serialize message field [u_position_orientation_std]
    bufferOffset = _serializer.float32(obj.u_position_orientation_std, buffer, bufferOffset);
    // Serialize message field [u_existence_invalidflags]
    bufferOffset = _serializer.uint8(obj.u_existence_invalidflags, buffer, bufferOffset);
    // Serialize message field [u_existence_probability]
    bufferOffset = _serializer.float32(obj.u_existence_probability, buffer, bufferOffset);
    // Serialize message field [u_existence_ppv]
    bufferOffset = _serializer.float32(obj.u_existence_ppv, buffer, bufferOffset);
    // Serialize message field [u_classification_car]
    bufferOffset = _serializer.uint8(obj.u_classification_car, buffer, bufferOffset);
    // Serialize message field [u_classification_truck]
    bufferOffset = _serializer.uint8(obj.u_classification_truck, buffer, bufferOffset);
    // Serialize message field [u_classification_motorcycle]
    bufferOffset = _serializer.uint8(obj.u_classification_motorcycle, buffer, bufferOffset);
    // Serialize message field [u_classification_bicycle]
    bufferOffset = _serializer.uint8(obj.u_classification_bicycle, buffer, bufferOffset);
    // Serialize message field [u_classification_pedestrian]
    bufferOffset = _serializer.uint8(obj.u_classification_pedestrian, buffer, bufferOffset);
    // Serialize message field [u_classification_animal]
    bufferOffset = _serializer.uint8(obj.u_classification_animal, buffer, bufferOffset);
    // Serialize message field [u_classification_hazard]
    bufferOffset = _serializer.uint8(obj.u_classification_hazard, buffer, bufferOffset);
    // Serialize message field [u_classification_unknown]
    bufferOffset = _serializer.uint8(obj.u_classification_unknown, buffer, bufferOffset);
    // Serialize message field [u_classification_overdrivable]
    bufferOffset = _serializer.uint8(obj.u_classification_overdrivable, buffer, bufferOffset);
    // Serialize message field [u_classification_underdrivable]
    bufferOffset = _serializer.uint8(obj.u_classification_underdrivable, buffer, bufferOffset);
    // Serialize message field [u_dynamics_absvel_invalidflags]
    bufferOffset = _serializer.uint8(obj.u_dynamics_absvel_invalidflags, buffer, bufferOffset);
    // Serialize message field [f_dynamics_absvel_x]
    bufferOffset = _serializer.float32(obj.f_dynamics_absvel_x, buffer, bufferOffset);
    // Serialize message field [f_dynamics_absvel_x_std]
    bufferOffset = _serializer.float32(obj.f_dynamics_absvel_x_std, buffer, bufferOffset);
    // Serialize message field [f_dynamics_absvel_y]
    bufferOffset = _serializer.float32(obj.f_dynamics_absvel_y, buffer, bufferOffset);
    // Serialize message field [f_dynamics_absvel_y_std]
    bufferOffset = _serializer.float32(obj.f_dynamics_absvel_y_std, buffer, bufferOffset);
    // Serialize message field [f_dynamics_absvel_covariancexy]
    bufferOffset = _serializer.float32(obj.f_dynamics_absvel_covariancexy, buffer, bufferOffset);
    // Serialize message field [u_dynamics_relvel_invalidflags]
    bufferOffset = _serializer.uint8(obj.u_dynamics_relvel_invalidflags, buffer, bufferOffset);
    // Serialize message field [f_dynamics_relvel_x]
    bufferOffset = _serializer.float32(obj.f_dynamics_relvel_x, buffer, bufferOffset);
    // Serialize message field [f_dynamics_relvel_x_std]
    bufferOffset = _serializer.float32(obj.f_dynamics_relvel_x_std, buffer, bufferOffset);
    // Serialize message field [f_dynamics_relvel_y]
    bufferOffset = _serializer.float32(obj.f_dynamics_relvel_y, buffer, bufferOffset);
    // Serialize message field [f_dynamics_relvel_y_std]
    bufferOffset = _serializer.float32(obj.f_dynamics_relvel_y_std, buffer, bufferOffset);
    // Serialize message field [f_dynamics_relvel_covariancexy]
    bufferOffset = _serializer.float32(obj.f_dynamics_relvel_covariancexy, buffer, bufferOffset);
    // Serialize message field [u_dynamics_absaccel_invalidflags]
    bufferOffset = _serializer.uint8(obj.u_dynamics_absaccel_invalidflags, buffer, bufferOffset);
    // Serialize message field [f_dynamics_absaccel_x]
    bufferOffset = _serializer.float32(obj.f_dynamics_absaccel_x, buffer, bufferOffset);
    // Serialize message field [f_dynamics_absaccel_x_std]
    bufferOffset = _serializer.float32(obj.f_dynamics_absaccel_x_std, buffer, bufferOffset);
    // Serialize message field [f_dynamics_absaccel_y]
    bufferOffset = _serializer.float32(obj.f_dynamics_absaccel_y, buffer, bufferOffset);
    // Serialize message field [f_dynamics_absaccel_y_std]
    bufferOffset = _serializer.float32(obj.f_dynamics_absaccel_y_std, buffer, bufferOffset);
    // Serialize message field [f_dynamics_absaccel_covariancexy]
    bufferOffset = _serializer.float32(obj.f_dynamics_absaccel_covariancexy, buffer, bufferOffset);
    // Serialize message field [u_dynamics_relaccel_invalidflags]
    bufferOffset = _serializer.uint8(obj.u_dynamics_relaccel_invalidflags, buffer, bufferOffset);
    // Serialize message field [f_dynamics_relaccel_x]
    bufferOffset = _serializer.float32(obj.f_dynamics_relaccel_x, buffer, bufferOffset);
    // Serialize message field [f_dynamics_relaccel_x_std]
    bufferOffset = _serializer.float32(obj.f_dynamics_relaccel_x_std, buffer, bufferOffset);
    // Serialize message field [f_dynamics_relaccel_y]
    bufferOffset = _serializer.float32(obj.f_dynamics_relaccel_y, buffer, bufferOffset);
    // Serialize message field [f_dynamics_relaccel_y_std]
    bufferOffset = _serializer.float32(obj.f_dynamics_relaccel_y_std, buffer, bufferOffset);
    // Serialize message field [f_dynamics_relaccel_covariancexy]
    bufferOffset = _serializer.float32(obj.f_dynamics_relaccel_covariancexy, buffer, bufferOffset);
    // Serialize message field [u_dynamics_orientation_invalidflags]
    bufferOffset = _serializer.uint8(obj.u_dynamics_orientation_invalidflags, buffer, bufferOffset);
    // Serialize message field [u_dynamics_orientation_rate_mean]
    bufferOffset = _serializer.float32(obj.u_dynamics_orientation_rate_mean, buffer, bufferOffset);
    // Serialize message field [u_dynamics_orientation_rate_std]
    bufferOffset = _serializer.float32(obj.u_dynamics_orientation_rate_std, buffer, bufferOffset);
    // Serialize message field [u_shape_length_status]
    bufferOffset = _serializer.uint32(obj.u_shape_length_status, buffer, bufferOffset);
    // Serialize message field [u_shape_length_edge_invalidflags]
    bufferOffset = _serializer.uint8(obj.u_shape_length_edge_invalidflags, buffer, bufferOffset);
    // Serialize message field [u_shape_length_edge_mean]
    bufferOffset = _serializer.float32(obj.u_shape_length_edge_mean, buffer, bufferOffset);
    // Serialize message field [u_shape_length_edge_std]
    bufferOffset = _serializer.float32(obj.u_shape_length_edge_std, buffer, bufferOffset);
    // Serialize message field [u_shape_width_status]
    bufferOffset = _serializer.uint32(obj.u_shape_width_status, buffer, bufferOffset);
    // Serialize message field [u_shape_width_edge_invalidflags]
    bufferOffset = _serializer.uint8(obj.u_shape_width_edge_invalidflags, buffer, bufferOffset);
    // Serialize message field [u_shape_width_edge_mean]
    bufferOffset = _serializer.float32(obj.u_shape_width_edge_mean, buffer, bufferOffset);
    // Serialize message field [u_shape_width_edge_std]
    bufferOffset = _serializer.float32(obj.u_shape_width_edge_std, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Object
    let len;
    let data = new Object(null);
    // Deserialize message field [u_statussensor]
    data.u_statussensor = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [u_id]
    data.u_id = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [u_age]
    data.u_age = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [u_statusmeasurement]
    data.u_statusmeasurement = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [u_statusmovement]
    data.u_statusmovement = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [u_position_invalidflags]
    data.u_position_invalidflags = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [u_position_reference]
    data.u_position_reference = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [u_position_x]
    data.u_position_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [u_position_x_std]
    data.u_position_x_std = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [u_position_y]
    data.u_position_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [u_position_y_std]
    data.u_position_y_std = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [u_position_z]
    data.u_position_z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [u_position_z_std]
    data.u_position_z_std = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [u_position_covariancexy]
    data.u_position_covariancexy = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [u_position_orientation]
    data.u_position_orientation = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [u_position_orientation_std]
    data.u_position_orientation_std = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [u_existence_invalidflags]
    data.u_existence_invalidflags = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [u_existence_probability]
    data.u_existence_probability = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [u_existence_ppv]
    data.u_existence_ppv = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [u_classification_car]
    data.u_classification_car = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [u_classification_truck]
    data.u_classification_truck = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [u_classification_motorcycle]
    data.u_classification_motorcycle = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [u_classification_bicycle]
    data.u_classification_bicycle = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [u_classification_pedestrian]
    data.u_classification_pedestrian = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [u_classification_animal]
    data.u_classification_animal = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [u_classification_hazard]
    data.u_classification_hazard = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [u_classification_unknown]
    data.u_classification_unknown = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [u_classification_overdrivable]
    data.u_classification_overdrivable = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [u_classification_underdrivable]
    data.u_classification_underdrivable = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [u_dynamics_absvel_invalidflags]
    data.u_dynamics_absvel_invalidflags = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [f_dynamics_absvel_x]
    data.f_dynamics_absvel_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [f_dynamics_absvel_x_std]
    data.f_dynamics_absvel_x_std = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [f_dynamics_absvel_y]
    data.f_dynamics_absvel_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [f_dynamics_absvel_y_std]
    data.f_dynamics_absvel_y_std = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [f_dynamics_absvel_covariancexy]
    data.f_dynamics_absvel_covariancexy = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [u_dynamics_relvel_invalidflags]
    data.u_dynamics_relvel_invalidflags = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [f_dynamics_relvel_x]
    data.f_dynamics_relvel_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [f_dynamics_relvel_x_std]
    data.f_dynamics_relvel_x_std = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [f_dynamics_relvel_y]
    data.f_dynamics_relvel_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [f_dynamics_relvel_y_std]
    data.f_dynamics_relvel_y_std = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [f_dynamics_relvel_covariancexy]
    data.f_dynamics_relvel_covariancexy = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [u_dynamics_absaccel_invalidflags]
    data.u_dynamics_absaccel_invalidflags = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [f_dynamics_absaccel_x]
    data.f_dynamics_absaccel_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [f_dynamics_absaccel_x_std]
    data.f_dynamics_absaccel_x_std = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [f_dynamics_absaccel_y]
    data.f_dynamics_absaccel_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [f_dynamics_absaccel_y_std]
    data.f_dynamics_absaccel_y_std = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [f_dynamics_absaccel_covariancexy]
    data.f_dynamics_absaccel_covariancexy = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [u_dynamics_relaccel_invalidflags]
    data.u_dynamics_relaccel_invalidflags = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [f_dynamics_relaccel_x]
    data.f_dynamics_relaccel_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [f_dynamics_relaccel_x_std]
    data.f_dynamics_relaccel_x_std = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [f_dynamics_relaccel_y]
    data.f_dynamics_relaccel_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [f_dynamics_relaccel_y_std]
    data.f_dynamics_relaccel_y_std = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [f_dynamics_relaccel_covariancexy]
    data.f_dynamics_relaccel_covariancexy = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [u_dynamics_orientation_invalidflags]
    data.u_dynamics_orientation_invalidflags = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [u_dynamics_orientation_rate_mean]
    data.u_dynamics_orientation_rate_mean = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [u_dynamics_orientation_rate_std]
    data.u_dynamics_orientation_rate_std = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [u_shape_length_status]
    data.u_shape_length_status = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [u_shape_length_edge_invalidflags]
    data.u_shape_length_edge_invalidflags = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [u_shape_length_edge_mean]
    data.u_shape_length_edge_mean = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [u_shape_length_edge_std]
    data.u_shape_length_edge_std = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [u_shape_width_status]
    data.u_shape_width_status = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [u_shape_width_edge_invalidflags]
    data.u_shape_width_edge_invalidflags = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [u_shape_width_edge_mean]
    data.u_shape_width_edge_mean = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [u_shape_width_edge_std]
    data.u_shape_width_edge_std = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 187;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ars548_messages/Object';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7a6bf48af76a68f467d67dd7b1137272';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint16 u_statussensor #tbd
    uint32 u_id #Unique ID of object
    uint16 u_age #Age of object
    uint8 u_statusmeasurement #Object Status
    uint8 u_statusmovement #Object Movement Status
    uint16 u_position_invalidflags #tbd
    uint8 u_position_reference #Reference point position
    float32 u_position_x #X Position of reference point
    float32 u_position_x_std #X Position Std
    float32 u_position_y #Y Position of reference point
    float32 u_position_y_std #Y Position Std
    float32 u_position_z #Z Position of reference point
    float32 u_position_z_std #Z Position Std
    float32 u_position_covariancexy #Covariance X Y
    float32 u_position_orientation #Object Orientation
    float32 u_position_orientation_std #Orientation Std
    uint8 u_existence_invalidflags #unused
    float32 u_existence_probability #Probability of Existence
    float32 u_existence_ppv #unused
    uint8 u_classification_car #Car Classification Probability
    uint8 u_classification_truck #Truck Classification Probability
    uint8 u_classification_motorcycle #Motorcycle Classification Probability
    uint8 u_classification_bicycle #Bicycle Classification Probability
    uint8 u_classification_pedestrian #Pedestrian Classification Probability
    uint8 u_classification_animal #Animal Classification Probability
    uint8 u_classification_hazard #Hazard Classification Probability
    uint8 u_classification_unknown #Unknown Classification Probability
    uint8 u_classification_overdrivable #unused
    uint8 u_classification_underdrivable #unused
    uint8 u_dynamics_absvel_invalidflags #unused
    float32 f_dynamics_absvel_x #X Absolute Velocity
    float32 f_dynamics_absvel_x_std #X Absolute Velocity Std
    float32 f_dynamics_absvel_y #Y Absolute Velocity
    float32 f_dynamics_absvel_y_std #Y Absolute Velocity Std
    float32 f_dynamics_absvel_covariancexy #Covariance Absolute Velocity X Y
    uint8 u_dynamics_relvel_invalidflags #unused
    float32 f_dynamics_relvel_x #X Relative Velocity
    float32 f_dynamics_relvel_x_std #X Relative Velocity Std
    float32 f_dynamics_relvel_y #Y Relative Velocity
    float32 f_dynamics_relvel_y_std #Y Relative Velocity Std
    float32 f_dynamics_relvel_covariancexy #Covariance Relative Velocity X Y
    uint8 u_dynamics_absaccel_invalidflags #unused
    float32 f_dynamics_absaccel_x #X Absolute Acceleration
    float32 f_dynamics_absaccel_x_std #X Absolute Acceleration Std
    float32 f_dynamics_absaccel_y #Y Absolute Acceleration
    float32 f_dynamics_absaccel_y_std #Y Absolute Acceleration Std
    float32 f_dynamics_absaccel_covariancexy #Covariance Absolute Acceleration X Y
    uint8 u_dynamics_relaccel_invalidflags #unused
    float32 f_dynamics_relaccel_x #X Relative Acceleration
    float32 f_dynamics_relaccel_x_std #X Relative Acceleration Std
    float32 f_dynamics_relaccel_y #Y Relative Acceleration
    float32 f_dynamics_relaccel_y_std #Y Relative Acceleration Std
    float32 f_dynamics_relaccel_covariancexy #Covariance Relative Acceleration X Y
    uint8 u_dynamics_orientation_invalidflags #unused
    float32 u_dynamics_orientation_rate_mean #Object Orientation Rate
    float32 u_dynamics_orientation_rate_std #Orientation Rate Std
    uint32 u_shape_length_status #(unused) Shape Length Status
    uint8 u_shape_length_edge_invalidflags #(unused) Invalid Flags Shape Length 
    float32 u_shape_length_edge_mean #Mean Shape Length
    float32 u_shape_length_edge_std #(unused) Shape Length Std
    uint32 u_shape_width_status #(unused) Shape Width Status 
    uint8 u_shape_width_edge_invalidflags #(unused) Invalid Flags Shape Width
    float32 u_shape_width_edge_mean #Mean Shape Width
    float32 u_shape_width_edge_std #(unused) Shape Width Std 
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Object(null);
    if (msg.u_statussensor !== undefined) {
      resolved.u_statussensor = msg.u_statussensor;
    }
    else {
      resolved.u_statussensor = 0
    }

    if (msg.u_id !== undefined) {
      resolved.u_id = msg.u_id;
    }
    else {
      resolved.u_id = 0
    }

    if (msg.u_age !== undefined) {
      resolved.u_age = msg.u_age;
    }
    else {
      resolved.u_age = 0
    }

    if (msg.u_statusmeasurement !== undefined) {
      resolved.u_statusmeasurement = msg.u_statusmeasurement;
    }
    else {
      resolved.u_statusmeasurement = 0
    }

    if (msg.u_statusmovement !== undefined) {
      resolved.u_statusmovement = msg.u_statusmovement;
    }
    else {
      resolved.u_statusmovement = 0
    }

    if (msg.u_position_invalidflags !== undefined) {
      resolved.u_position_invalidflags = msg.u_position_invalidflags;
    }
    else {
      resolved.u_position_invalidflags = 0
    }

    if (msg.u_position_reference !== undefined) {
      resolved.u_position_reference = msg.u_position_reference;
    }
    else {
      resolved.u_position_reference = 0
    }

    if (msg.u_position_x !== undefined) {
      resolved.u_position_x = msg.u_position_x;
    }
    else {
      resolved.u_position_x = 0.0
    }

    if (msg.u_position_x_std !== undefined) {
      resolved.u_position_x_std = msg.u_position_x_std;
    }
    else {
      resolved.u_position_x_std = 0.0
    }

    if (msg.u_position_y !== undefined) {
      resolved.u_position_y = msg.u_position_y;
    }
    else {
      resolved.u_position_y = 0.0
    }

    if (msg.u_position_y_std !== undefined) {
      resolved.u_position_y_std = msg.u_position_y_std;
    }
    else {
      resolved.u_position_y_std = 0.0
    }

    if (msg.u_position_z !== undefined) {
      resolved.u_position_z = msg.u_position_z;
    }
    else {
      resolved.u_position_z = 0.0
    }

    if (msg.u_position_z_std !== undefined) {
      resolved.u_position_z_std = msg.u_position_z_std;
    }
    else {
      resolved.u_position_z_std = 0.0
    }

    if (msg.u_position_covariancexy !== undefined) {
      resolved.u_position_covariancexy = msg.u_position_covariancexy;
    }
    else {
      resolved.u_position_covariancexy = 0.0
    }

    if (msg.u_position_orientation !== undefined) {
      resolved.u_position_orientation = msg.u_position_orientation;
    }
    else {
      resolved.u_position_orientation = 0.0
    }

    if (msg.u_position_orientation_std !== undefined) {
      resolved.u_position_orientation_std = msg.u_position_orientation_std;
    }
    else {
      resolved.u_position_orientation_std = 0.0
    }

    if (msg.u_existence_invalidflags !== undefined) {
      resolved.u_existence_invalidflags = msg.u_existence_invalidflags;
    }
    else {
      resolved.u_existence_invalidflags = 0
    }

    if (msg.u_existence_probability !== undefined) {
      resolved.u_existence_probability = msg.u_existence_probability;
    }
    else {
      resolved.u_existence_probability = 0.0
    }

    if (msg.u_existence_ppv !== undefined) {
      resolved.u_existence_ppv = msg.u_existence_ppv;
    }
    else {
      resolved.u_existence_ppv = 0.0
    }

    if (msg.u_classification_car !== undefined) {
      resolved.u_classification_car = msg.u_classification_car;
    }
    else {
      resolved.u_classification_car = 0
    }

    if (msg.u_classification_truck !== undefined) {
      resolved.u_classification_truck = msg.u_classification_truck;
    }
    else {
      resolved.u_classification_truck = 0
    }

    if (msg.u_classification_motorcycle !== undefined) {
      resolved.u_classification_motorcycle = msg.u_classification_motorcycle;
    }
    else {
      resolved.u_classification_motorcycle = 0
    }

    if (msg.u_classification_bicycle !== undefined) {
      resolved.u_classification_bicycle = msg.u_classification_bicycle;
    }
    else {
      resolved.u_classification_bicycle = 0
    }

    if (msg.u_classification_pedestrian !== undefined) {
      resolved.u_classification_pedestrian = msg.u_classification_pedestrian;
    }
    else {
      resolved.u_classification_pedestrian = 0
    }

    if (msg.u_classification_animal !== undefined) {
      resolved.u_classification_animal = msg.u_classification_animal;
    }
    else {
      resolved.u_classification_animal = 0
    }

    if (msg.u_classification_hazard !== undefined) {
      resolved.u_classification_hazard = msg.u_classification_hazard;
    }
    else {
      resolved.u_classification_hazard = 0
    }

    if (msg.u_classification_unknown !== undefined) {
      resolved.u_classification_unknown = msg.u_classification_unknown;
    }
    else {
      resolved.u_classification_unknown = 0
    }

    if (msg.u_classification_overdrivable !== undefined) {
      resolved.u_classification_overdrivable = msg.u_classification_overdrivable;
    }
    else {
      resolved.u_classification_overdrivable = 0
    }

    if (msg.u_classification_underdrivable !== undefined) {
      resolved.u_classification_underdrivable = msg.u_classification_underdrivable;
    }
    else {
      resolved.u_classification_underdrivable = 0
    }

    if (msg.u_dynamics_absvel_invalidflags !== undefined) {
      resolved.u_dynamics_absvel_invalidflags = msg.u_dynamics_absvel_invalidflags;
    }
    else {
      resolved.u_dynamics_absvel_invalidflags = 0
    }

    if (msg.f_dynamics_absvel_x !== undefined) {
      resolved.f_dynamics_absvel_x = msg.f_dynamics_absvel_x;
    }
    else {
      resolved.f_dynamics_absvel_x = 0.0
    }

    if (msg.f_dynamics_absvel_x_std !== undefined) {
      resolved.f_dynamics_absvel_x_std = msg.f_dynamics_absvel_x_std;
    }
    else {
      resolved.f_dynamics_absvel_x_std = 0.0
    }

    if (msg.f_dynamics_absvel_y !== undefined) {
      resolved.f_dynamics_absvel_y = msg.f_dynamics_absvel_y;
    }
    else {
      resolved.f_dynamics_absvel_y = 0.0
    }

    if (msg.f_dynamics_absvel_y_std !== undefined) {
      resolved.f_dynamics_absvel_y_std = msg.f_dynamics_absvel_y_std;
    }
    else {
      resolved.f_dynamics_absvel_y_std = 0.0
    }

    if (msg.f_dynamics_absvel_covariancexy !== undefined) {
      resolved.f_dynamics_absvel_covariancexy = msg.f_dynamics_absvel_covariancexy;
    }
    else {
      resolved.f_dynamics_absvel_covariancexy = 0.0
    }

    if (msg.u_dynamics_relvel_invalidflags !== undefined) {
      resolved.u_dynamics_relvel_invalidflags = msg.u_dynamics_relvel_invalidflags;
    }
    else {
      resolved.u_dynamics_relvel_invalidflags = 0
    }

    if (msg.f_dynamics_relvel_x !== undefined) {
      resolved.f_dynamics_relvel_x = msg.f_dynamics_relvel_x;
    }
    else {
      resolved.f_dynamics_relvel_x = 0.0
    }

    if (msg.f_dynamics_relvel_x_std !== undefined) {
      resolved.f_dynamics_relvel_x_std = msg.f_dynamics_relvel_x_std;
    }
    else {
      resolved.f_dynamics_relvel_x_std = 0.0
    }

    if (msg.f_dynamics_relvel_y !== undefined) {
      resolved.f_dynamics_relvel_y = msg.f_dynamics_relvel_y;
    }
    else {
      resolved.f_dynamics_relvel_y = 0.0
    }

    if (msg.f_dynamics_relvel_y_std !== undefined) {
      resolved.f_dynamics_relvel_y_std = msg.f_dynamics_relvel_y_std;
    }
    else {
      resolved.f_dynamics_relvel_y_std = 0.0
    }

    if (msg.f_dynamics_relvel_covariancexy !== undefined) {
      resolved.f_dynamics_relvel_covariancexy = msg.f_dynamics_relvel_covariancexy;
    }
    else {
      resolved.f_dynamics_relvel_covariancexy = 0.0
    }

    if (msg.u_dynamics_absaccel_invalidflags !== undefined) {
      resolved.u_dynamics_absaccel_invalidflags = msg.u_dynamics_absaccel_invalidflags;
    }
    else {
      resolved.u_dynamics_absaccel_invalidflags = 0
    }

    if (msg.f_dynamics_absaccel_x !== undefined) {
      resolved.f_dynamics_absaccel_x = msg.f_dynamics_absaccel_x;
    }
    else {
      resolved.f_dynamics_absaccel_x = 0.0
    }

    if (msg.f_dynamics_absaccel_x_std !== undefined) {
      resolved.f_dynamics_absaccel_x_std = msg.f_dynamics_absaccel_x_std;
    }
    else {
      resolved.f_dynamics_absaccel_x_std = 0.0
    }

    if (msg.f_dynamics_absaccel_y !== undefined) {
      resolved.f_dynamics_absaccel_y = msg.f_dynamics_absaccel_y;
    }
    else {
      resolved.f_dynamics_absaccel_y = 0.0
    }

    if (msg.f_dynamics_absaccel_y_std !== undefined) {
      resolved.f_dynamics_absaccel_y_std = msg.f_dynamics_absaccel_y_std;
    }
    else {
      resolved.f_dynamics_absaccel_y_std = 0.0
    }

    if (msg.f_dynamics_absaccel_covariancexy !== undefined) {
      resolved.f_dynamics_absaccel_covariancexy = msg.f_dynamics_absaccel_covariancexy;
    }
    else {
      resolved.f_dynamics_absaccel_covariancexy = 0.0
    }

    if (msg.u_dynamics_relaccel_invalidflags !== undefined) {
      resolved.u_dynamics_relaccel_invalidflags = msg.u_dynamics_relaccel_invalidflags;
    }
    else {
      resolved.u_dynamics_relaccel_invalidflags = 0
    }

    if (msg.f_dynamics_relaccel_x !== undefined) {
      resolved.f_dynamics_relaccel_x = msg.f_dynamics_relaccel_x;
    }
    else {
      resolved.f_dynamics_relaccel_x = 0.0
    }

    if (msg.f_dynamics_relaccel_x_std !== undefined) {
      resolved.f_dynamics_relaccel_x_std = msg.f_dynamics_relaccel_x_std;
    }
    else {
      resolved.f_dynamics_relaccel_x_std = 0.0
    }

    if (msg.f_dynamics_relaccel_y !== undefined) {
      resolved.f_dynamics_relaccel_y = msg.f_dynamics_relaccel_y;
    }
    else {
      resolved.f_dynamics_relaccel_y = 0.0
    }

    if (msg.f_dynamics_relaccel_y_std !== undefined) {
      resolved.f_dynamics_relaccel_y_std = msg.f_dynamics_relaccel_y_std;
    }
    else {
      resolved.f_dynamics_relaccel_y_std = 0.0
    }

    if (msg.f_dynamics_relaccel_covariancexy !== undefined) {
      resolved.f_dynamics_relaccel_covariancexy = msg.f_dynamics_relaccel_covariancexy;
    }
    else {
      resolved.f_dynamics_relaccel_covariancexy = 0.0
    }

    if (msg.u_dynamics_orientation_invalidflags !== undefined) {
      resolved.u_dynamics_orientation_invalidflags = msg.u_dynamics_orientation_invalidflags;
    }
    else {
      resolved.u_dynamics_orientation_invalidflags = 0
    }

    if (msg.u_dynamics_orientation_rate_mean !== undefined) {
      resolved.u_dynamics_orientation_rate_mean = msg.u_dynamics_orientation_rate_mean;
    }
    else {
      resolved.u_dynamics_orientation_rate_mean = 0.0
    }

    if (msg.u_dynamics_orientation_rate_std !== undefined) {
      resolved.u_dynamics_orientation_rate_std = msg.u_dynamics_orientation_rate_std;
    }
    else {
      resolved.u_dynamics_orientation_rate_std = 0.0
    }

    if (msg.u_shape_length_status !== undefined) {
      resolved.u_shape_length_status = msg.u_shape_length_status;
    }
    else {
      resolved.u_shape_length_status = 0
    }

    if (msg.u_shape_length_edge_invalidflags !== undefined) {
      resolved.u_shape_length_edge_invalidflags = msg.u_shape_length_edge_invalidflags;
    }
    else {
      resolved.u_shape_length_edge_invalidflags = 0
    }

    if (msg.u_shape_length_edge_mean !== undefined) {
      resolved.u_shape_length_edge_mean = msg.u_shape_length_edge_mean;
    }
    else {
      resolved.u_shape_length_edge_mean = 0.0
    }

    if (msg.u_shape_length_edge_std !== undefined) {
      resolved.u_shape_length_edge_std = msg.u_shape_length_edge_std;
    }
    else {
      resolved.u_shape_length_edge_std = 0.0
    }

    if (msg.u_shape_width_status !== undefined) {
      resolved.u_shape_width_status = msg.u_shape_width_status;
    }
    else {
      resolved.u_shape_width_status = 0
    }

    if (msg.u_shape_width_edge_invalidflags !== undefined) {
      resolved.u_shape_width_edge_invalidflags = msg.u_shape_width_edge_invalidflags;
    }
    else {
      resolved.u_shape_width_edge_invalidflags = 0
    }

    if (msg.u_shape_width_edge_mean !== undefined) {
      resolved.u_shape_width_edge_mean = msg.u_shape_width_edge_mean;
    }
    else {
      resolved.u_shape_width_edge_mean = 0.0
    }

    if (msg.u_shape_width_edge_std !== undefined) {
      resolved.u_shape_width_edge_std = msg.u_shape_width_edge_std;
    }
    else {
      resolved.u_shape_width_edge_std = 0.0
    }

    return resolved;
    }
};

module.exports = Object;
