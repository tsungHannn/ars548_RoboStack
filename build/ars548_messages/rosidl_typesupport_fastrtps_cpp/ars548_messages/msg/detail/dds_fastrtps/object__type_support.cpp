// generated from rosidl_typesupport_fastrtps_cpp/resource/idl__type_support.cpp.em
// with input from ars548_messages:msg/Object.idl
// generated code does not contain a copyright notice
#include "ars548_messages/msg/detail/object__rosidl_typesupport_fastrtps_cpp.hpp"
#include "ars548_messages/msg/detail/object__struct.hpp"

#include <limits>
#include <stdexcept>
#include <string>
#include "rosidl_typesupport_cpp/message_type_support.hpp"
#include "rosidl_typesupport_fastrtps_cpp/identifier.hpp"
#include "rosidl_typesupport_fastrtps_cpp/message_type_support.h"
#include "rosidl_typesupport_fastrtps_cpp/message_type_support_decl.hpp"
#include "rosidl_typesupport_fastrtps_cpp/wstring_conversion.hpp"
#include "fastcdr/Cdr.h"


// forward declaration of message dependencies and their conversion functions

namespace ars548_messages
{

namespace msg
{

namespace typesupport_fastrtps_cpp
{

bool
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_ars548_messages
cdr_serialize(
  const ars548_messages::msg::Object & ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  // Member: u_statussensor
  cdr << ros_message.u_statussensor;
  // Member: u_id
  cdr << ros_message.u_id;
  // Member: u_age
  cdr << ros_message.u_age;
  // Member: u_statusmeasurement
  cdr << ros_message.u_statusmeasurement;
  // Member: u_statusmovement
  cdr << ros_message.u_statusmovement;
  // Member: u_position_invalidflags
  cdr << ros_message.u_position_invalidflags;
  // Member: u_position_reference
  cdr << ros_message.u_position_reference;
  // Member: u_position_x
  cdr << ros_message.u_position_x;
  // Member: u_position_x_std
  cdr << ros_message.u_position_x_std;
  // Member: u_position_y
  cdr << ros_message.u_position_y;
  // Member: u_position_y_std
  cdr << ros_message.u_position_y_std;
  // Member: u_position_z
  cdr << ros_message.u_position_z;
  // Member: u_position_z_std
  cdr << ros_message.u_position_z_std;
  // Member: u_position_covariancexy
  cdr << ros_message.u_position_covariancexy;
  // Member: u_position_orientation
  cdr << ros_message.u_position_orientation;
  // Member: u_position_orientation_std
  cdr << ros_message.u_position_orientation_std;
  // Member: u_existence_invalidflags
  cdr << ros_message.u_existence_invalidflags;
  // Member: u_existence_probability
  cdr << ros_message.u_existence_probability;
  // Member: u_existence_ppv
  cdr << ros_message.u_existence_ppv;
  // Member: u_classification_car
  cdr << ros_message.u_classification_car;
  // Member: u_classification_truck
  cdr << ros_message.u_classification_truck;
  // Member: u_classification_motorcycle
  cdr << ros_message.u_classification_motorcycle;
  // Member: u_classification_bicycle
  cdr << ros_message.u_classification_bicycle;
  // Member: u_classification_pedestrian
  cdr << ros_message.u_classification_pedestrian;
  // Member: u_classification_animal
  cdr << ros_message.u_classification_animal;
  // Member: u_classification_hazard
  cdr << ros_message.u_classification_hazard;
  // Member: u_classification_unknown
  cdr << ros_message.u_classification_unknown;
  // Member: u_classification_overdrivable
  cdr << ros_message.u_classification_overdrivable;
  // Member: u_classification_underdrivable
  cdr << ros_message.u_classification_underdrivable;
  // Member: u_dynamics_absvel_invalidflags
  cdr << ros_message.u_dynamics_absvel_invalidflags;
  // Member: f_dynamics_absvel_x
  cdr << ros_message.f_dynamics_absvel_x;
  // Member: f_dynamics_absvel_x_std
  cdr << ros_message.f_dynamics_absvel_x_std;
  // Member: f_dynamics_absvel_y
  cdr << ros_message.f_dynamics_absvel_y;
  // Member: f_dynamics_absvel_y_std
  cdr << ros_message.f_dynamics_absvel_y_std;
  // Member: f_dynamics_absvel_covariancexy
  cdr << ros_message.f_dynamics_absvel_covariancexy;
  // Member: u_dynamics_relvel_invalidflags
  cdr << ros_message.u_dynamics_relvel_invalidflags;
  // Member: f_dynamics_relvel_x
  cdr << ros_message.f_dynamics_relvel_x;
  // Member: f_dynamics_relvel_x_std
  cdr << ros_message.f_dynamics_relvel_x_std;
  // Member: f_dynamics_relvel_y
  cdr << ros_message.f_dynamics_relvel_y;
  // Member: f_dynamics_relvel_y_std
  cdr << ros_message.f_dynamics_relvel_y_std;
  // Member: f_dynamics_relvel_covariancexy
  cdr << ros_message.f_dynamics_relvel_covariancexy;
  // Member: u_dynamics_absaccel_invalidflags
  cdr << ros_message.u_dynamics_absaccel_invalidflags;
  // Member: f_dynamics_absaccel_x
  cdr << ros_message.f_dynamics_absaccel_x;
  // Member: f_dynamics_absaccel_x_std
  cdr << ros_message.f_dynamics_absaccel_x_std;
  // Member: f_dynamics_absaccel_y
  cdr << ros_message.f_dynamics_absaccel_y;
  // Member: f_dynamics_absaccel_y_std
  cdr << ros_message.f_dynamics_absaccel_y_std;
  // Member: f_dynamics_absaccel_covariancexy
  cdr << ros_message.f_dynamics_absaccel_covariancexy;
  // Member: u_dynamics_relaccel_invalidflags
  cdr << ros_message.u_dynamics_relaccel_invalidflags;
  // Member: f_dynamics_relaccel_x
  cdr << ros_message.f_dynamics_relaccel_x;
  // Member: f_dynamics_relaccel_x_std
  cdr << ros_message.f_dynamics_relaccel_x_std;
  // Member: f_dynamics_relaccel_y
  cdr << ros_message.f_dynamics_relaccel_y;
  // Member: f_dynamics_relaccel_y_std
  cdr << ros_message.f_dynamics_relaccel_y_std;
  // Member: f_dynamics_relaccel_covariancexy
  cdr << ros_message.f_dynamics_relaccel_covariancexy;
  // Member: u_dynamics_orientation_invalidflags
  cdr << ros_message.u_dynamics_orientation_invalidflags;
  // Member: u_dynamics_orientation_rate_mean
  cdr << ros_message.u_dynamics_orientation_rate_mean;
  // Member: u_dynamics_orientation_rate_std
  cdr << ros_message.u_dynamics_orientation_rate_std;
  // Member: u_shape_length_status
  cdr << ros_message.u_shape_length_status;
  // Member: u_shape_length_edge_invalidflags
  cdr << ros_message.u_shape_length_edge_invalidflags;
  // Member: u_shape_length_edge_mean
  cdr << ros_message.u_shape_length_edge_mean;
  // Member: u_shape_length_edge_std
  cdr << ros_message.u_shape_length_edge_std;
  // Member: u_shape_width_status
  cdr << ros_message.u_shape_width_status;
  // Member: u_shape_width_edge_invalidflags
  cdr << ros_message.u_shape_width_edge_invalidflags;
  // Member: u_shape_width_edge_mean
  cdr << ros_message.u_shape_width_edge_mean;
  // Member: u_shape_width_edge_std
  cdr << ros_message.u_shape_width_edge_std;
  return true;
}

bool
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_ars548_messages
cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  ars548_messages::msg::Object & ros_message)
{
  // Member: u_statussensor
  cdr >> ros_message.u_statussensor;

  // Member: u_id
  cdr >> ros_message.u_id;

  // Member: u_age
  cdr >> ros_message.u_age;

  // Member: u_statusmeasurement
  cdr >> ros_message.u_statusmeasurement;

  // Member: u_statusmovement
  cdr >> ros_message.u_statusmovement;

  // Member: u_position_invalidflags
  cdr >> ros_message.u_position_invalidflags;

  // Member: u_position_reference
  cdr >> ros_message.u_position_reference;

  // Member: u_position_x
  cdr >> ros_message.u_position_x;

  // Member: u_position_x_std
  cdr >> ros_message.u_position_x_std;

  // Member: u_position_y
  cdr >> ros_message.u_position_y;

  // Member: u_position_y_std
  cdr >> ros_message.u_position_y_std;

  // Member: u_position_z
  cdr >> ros_message.u_position_z;

  // Member: u_position_z_std
  cdr >> ros_message.u_position_z_std;

  // Member: u_position_covariancexy
  cdr >> ros_message.u_position_covariancexy;

  // Member: u_position_orientation
  cdr >> ros_message.u_position_orientation;

  // Member: u_position_orientation_std
  cdr >> ros_message.u_position_orientation_std;

  // Member: u_existence_invalidflags
  cdr >> ros_message.u_existence_invalidflags;

  // Member: u_existence_probability
  cdr >> ros_message.u_existence_probability;

  // Member: u_existence_ppv
  cdr >> ros_message.u_existence_ppv;

  // Member: u_classification_car
  cdr >> ros_message.u_classification_car;

  // Member: u_classification_truck
  cdr >> ros_message.u_classification_truck;

  // Member: u_classification_motorcycle
  cdr >> ros_message.u_classification_motorcycle;

  // Member: u_classification_bicycle
  cdr >> ros_message.u_classification_bicycle;

  // Member: u_classification_pedestrian
  cdr >> ros_message.u_classification_pedestrian;

  // Member: u_classification_animal
  cdr >> ros_message.u_classification_animal;

  // Member: u_classification_hazard
  cdr >> ros_message.u_classification_hazard;

  // Member: u_classification_unknown
  cdr >> ros_message.u_classification_unknown;

  // Member: u_classification_overdrivable
  cdr >> ros_message.u_classification_overdrivable;

  // Member: u_classification_underdrivable
  cdr >> ros_message.u_classification_underdrivable;

  // Member: u_dynamics_absvel_invalidflags
  cdr >> ros_message.u_dynamics_absvel_invalidflags;

  // Member: f_dynamics_absvel_x
  cdr >> ros_message.f_dynamics_absvel_x;

  // Member: f_dynamics_absvel_x_std
  cdr >> ros_message.f_dynamics_absvel_x_std;

  // Member: f_dynamics_absvel_y
  cdr >> ros_message.f_dynamics_absvel_y;

  // Member: f_dynamics_absvel_y_std
  cdr >> ros_message.f_dynamics_absvel_y_std;

  // Member: f_dynamics_absvel_covariancexy
  cdr >> ros_message.f_dynamics_absvel_covariancexy;

  // Member: u_dynamics_relvel_invalidflags
  cdr >> ros_message.u_dynamics_relvel_invalidflags;

  // Member: f_dynamics_relvel_x
  cdr >> ros_message.f_dynamics_relvel_x;

  // Member: f_dynamics_relvel_x_std
  cdr >> ros_message.f_dynamics_relvel_x_std;

  // Member: f_dynamics_relvel_y
  cdr >> ros_message.f_dynamics_relvel_y;

  // Member: f_dynamics_relvel_y_std
  cdr >> ros_message.f_dynamics_relvel_y_std;

  // Member: f_dynamics_relvel_covariancexy
  cdr >> ros_message.f_dynamics_relvel_covariancexy;

  // Member: u_dynamics_absaccel_invalidflags
  cdr >> ros_message.u_dynamics_absaccel_invalidflags;

  // Member: f_dynamics_absaccel_x
  cdr >> ros_message.f_dynamics_absaccel_x;

  // Member: f_dynamics_absaccel_x_std
  cdr >> ros_message.f_dynamics_absaccel_x_std;

  // Member: f_dynamics_absaccel_y
  cdr >> ros_message.f_dynamics_absaccel_y;

  // Member: f_dynamics_absaccel_y_std
  cdr >> ros_message.f_dynamics_absaccel_y_std;

  // Member: f_dynamics_absaccel_covariancexy
  cdr >> ros_message.f_dynamics_absaccel_covariancexy;

  // Member: u_dynamics_relaccel_invalidflags
  cdr >> ros_message.u_dynamics_relaccel_invalidflags;

  // Member: f_dynamics_relaccel_x
  cdr >> ros_message.f_dynamics_relaccel_x;

  // Member: f_dynamics_relaccel_x_std
  cdr >> ros_message.f_dynamics_relaccel_x_std;

  // Member: f_dynamics_relaccel_y
  cdr >> ros_message.f_dynamics_relaccel_y;

  // Member: f_dynamics_relaccel_y_std
  cdr >> ros_message.f_dynamics_relaccel_y_std;

  // Member: f_dynamics_relaccel_covariancexy
  cdr >> ros_message.f_dynamics_relaccel_covariancexy;

  // Member: u_dynamics_orientation_invalidflags
  cdr >> ros_message.u_dynamics_orientation_invalidflags;

  // Member: u_dynamics_orientation_rate_mean
  cdr >> ros_message.u_dynamics_orientation_rate_mean;

  // Member: u_dynamics_orientation_rate_std
  cdr >> ros_message.u_dynamics_orientation_rate_std;

  // Member: u_shape_length_status
  cdr >> ros_message.u_shape_length_status;

  // Member: u_shape_length_edge_invalidflags
  cdr >> ros_message.u_shape_length_edge_invalidflags;

  // Member: u_shape_length_edge_mean
  cdr >> ros_message.u_shape_length_edge_mean;

  // Member: u_shape_length_edge_std
  cdr >> ros_message.u_shape_length_edge_std;

  // Member: u_shape_width_status
  cdr >> ros_message.u_shape_width_status;

  // Member: u_shape_width_edge_invalidflags
  cdr >> ros_message.u_shape_width_edge_invalidflags;

  // Member: u_shape_width_edge_mean
  cdr >> ros_message.u_shape_width_edge_mean;

  // Member: u_shape_width_edge_std
  cdr >> ros_message.u_shape_width_edge_std;

  return true;
}

size_t
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_ars548_messages
get_serialized_size(
  const ars548_messages::msg::Object & ros_message,
  size_t current_alignment)
{
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  (void)padding;
  (void)wchar_size;

  // Member: u_statussensor
  {
    size_t item_size = sizeof(ros_message.u_statussensor);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_id
  {
    size_t item_size = sizeof(ros_message.u_id);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_age
  {
    size_t item_size = sizeof(ros_message.u_age);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_statusmeasurement
  {
    size_t item_size = sizeof(ros_message.u_statusmeasurement);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_statusmovement
  {
    size_t item_size = sizeof(ros_message.u_statusmovement);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_position_invalidflags
  {
    size_t item_size = sizeof(ros_message.u_position_invalidflags);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_position_reference
  {
    size_t item_size = sizeof(ros_message.u_position_reference);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_position_x
  {
    size_t item_size = sizeof(ros_message.u_position_x);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_position_x_std
  {
    size_t item_size = sizeof(ros_message.u_position_x_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_position_y
  {
    size_t item_size = sizeof(ros_message.u_position_y);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_position_y_std
  {
    size_t item_size = sizeof(ros_message.u_position_y_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_position_z
  {
    size_t item_size = sizeof(ros_message.u_position_z);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_position_z_std
  {
    size_t item_size = sizeof(ros_message.u_position_z_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_position_covariancexy
  {
    size_t item_size = sizeof(ros_message.u_position_covariancexy);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_position_orientation
  {
    size_t item_size = sizeof(ros_message.u_position_orientation);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_position_orientation_std
  {
    size_t item_size = sizeof(ros_message.u_position_orientation_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_existence_invalidflags
  {
    size_t item_size = sizeof(ros_message.u_existence_invalidflags);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_existence_probability
  {
    size_t item_size = sizeof(ros_message.u_existence_probability);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_existence_ppv
  {
    size_t item_size = sizeof(ros_message.u_existence_ppv);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_classification_car
  {
    size_t item_size = sizeof(ros_message.u_classification_car);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_classification_truck
  {
    size_t item_size = sizeof(ros_message.u_classification_truck);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_classification_motorcycle
  {
    size_t item_size = sizeof(ros_message.u_classification_motorcycle);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_classification_bicycle
  {
    size_t item_size = sizeof(ros_message.u_classification_bicycle);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_classification_pedestrian
  {
    size_t item_size = sizeof(ros_message.u_classification_pedestrian);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_classification_animal
  {
    size_t item_size = sizeof(ros_message.u_classification_animal);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_classification_hazard
  {
    size_t item_size = sizeof(ros_message.u_classification_hazard);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_classification_unknown
  {
    size_t item_size = sizeof(ros_message.u_classification_unknown);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_classification_overdrivable
  {
    size_t item_size = sizeof(ros_message.u_classification_overdrivable);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_classification_underdrivable
  {
    size_t item_size = sizeof(ros_message.u_classification_underdrivable);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_dynamics_absvel_invalidflags
  {
    size_t item_size = sizeof(ros_message.u_dynamics_absvel_invalidflags);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_dynamics_absvel_x
  {
    size_t item_size = sizeof(ros_message.f_dynamics_absvel_x);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_dynamics_absvel_x_std
  {
    size_t item_size = sizeof(ros_message.f_dynamics_absvel_x_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_dynamics_absvel_y
  {
    size_t item_size = sizeof(ros_message.f_dynamics_absvel_y);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_dynamics_absvel_y_std
  {
    size_t item_size = sizeof(ros_message.f_dynamics_absvel_y_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_dynamics_absvel_covariancexy
  {
    size_t item_size = sizeof(ros_message.f_dynamics_absvel_covariancexy);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_dynamics_relvel_invalidflags
  {
    size_t item_size = sizeof(ros_message.u_dynamics_relvel_invalidflags);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_dynamics_relvel_x
  {
    size_t item_size = sizeof(ros_message.f_dynamics_relvel_x);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_dynamics_relvel_x_std
  {
    size_t item_size = sizeof(ros_message.f_dynamics_relvel_x_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_dynamics_relvel_y
  {
    size_t item_size = sizeof(ros_message.f_dynamics_relvel_y);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_dynamics_relvel_y_std
  {
    size_t item_size = sizeof(ros_message.f_dynamics_relvel_y_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_dynamics_relvel_covariancexy
  {
    size_t item_size = sizeof(ros_message.f_dynamics_relvel_covariancexy);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_dynamics_absaccel_invalidflags
  {
    size_t item_size = sizeof(ros_message.u_dynamics_absaccel_invalidflags);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_dynamics_absaccel_x
  {
    size_t item_size = sizeof(ros_message.f_dynamics_absaccel_x);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_dynamics_absaccel_x_std
  {
    size_t item_size = sizeof(ros_message.f_dynamics_absaccel_x_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_dynamics_absaccel_y
  {
    size_t item_size = sizeof(ros_message.f_dynamics_absaccel_y);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_dynamics_absaccel_y_std
  {
    size_t item_size = sizeof(ros_message.f_dynamics_absaccel_y_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_dynamics_absaccel_covariancexy
  {
    size_t item_size = sizeof(ros_message.f_dynamics_absaccel_covariancexy);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_dynamics_relaccel_invalidflags
  {
    size_t item_size = sizeof(ros_message.u_dynamics_relaccel_invalidflags);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_dynamics_relaccel_x
  {
    size_t item_size = sizeof(ros_message.f_dynamics_relaccel_x);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_dynamics_relaccel_x_std
  {
    size_t item_size = sizeof(ros_message.f_dynamics_relaccel_x_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_dynamics_relaccel_y
  {
    size_t item_size = sizeof(ros_message.f_dynamics_relaccel_y);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_dynamics_relaccel_y_std
  {
    size_t item_size = sizeof(ros_message.f_dynamics_relaccel_y_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_dynamics_relaccel_covariancexy
  {
    size_t item_size = sizeof(ros_message.f_dynamics_relaccel_covariancexy);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_dynamics_orientation_invalidflags
  {
    size_t item_size = sizeof(ros_message.u_dynamics_orientation_invalidflags);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_dynamics_orientation_rate_mean
  {
    size_t item_size = sizeof(ros_message.u_dynamics_orientation_rate_mean);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_dynamics_orientation_rate_std
  {
    size_t item_size = sizeof(ros_message.u_dynamics_orientation_rate_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_shape_length_status
  {
    size_t item_size = sizeof(ros_message.u_shape_length_status);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_shape_length_edge_invalidflags
  {
    size_t item_size = sizeof(ros_message.u_shape_length_edge_invalidflags);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_shape_length_edge_mean
  {
    size_t item_size = sizeof(ros_message.u_shape_length_edge_mean);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_shape_length_edge_std
  {
    size_t item_size = sizeof(ros_message.u_shape_length_edge_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_shape_width_status
  {
    size_t item_size = sizeof(ros_message.u_shape_width_status);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_shape_width_edge_invalidflags
  {
    size_t item_size = sizeof(ros_message.u_shape_width_edge_invalidflags);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_shape_width_edge_mean
  {
    size_t item_size = sizeof(ros_message.u_shape_width_edge_mean);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_shape_width_edge_std
  {
    size_t item_size = sizeof(ros_message.u_shape_width_edge_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }

  return current_alignment - initial_alignment;
}

size_t
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_ars548_messages
max_serialized_size_Object(
  bool & full_bounded,
  bool & is_plain,
  size_t current_alignment)
{
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  size_t last_member_size = 0;
  (void)last_member_size;
  (void)padding;
  (void)wchar_size;

  full_bounded = true;
  is_plain = true;


  // Member: u_statussensor
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint16_t);
    current_alignment += array_size * sizeof(uint16_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint16_t));
  }

  // Member: u_id
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: u_age
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint16_t);
    current_alignment += array_size * sizeof(uint16_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint16_t));
  }

  // Member: u_statusmeasurement
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: u_statusmovement
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: u_position_invalidflags
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint16_t);
    current_alignment += array_size * sizeof(uint16_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint16_t));
  }

  // Member: u_position_reference
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: u_position_x
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: u_position_x_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: u_position_y
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: u_position_y_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: u_position_z
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: u_position_z_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: u_position_covariancexy
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: u_position_orientation
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: u_position_orientation_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: u_existence_invalidflags
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: u_existence_probability
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: u_existence_ppv
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: u_classification_car
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: u_classification_truck
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: u_classification_motorcycle
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: u_classification_bicycle
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: u_classification_pedestrian
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: u_classification_animal
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: u_classification_hazard
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: u_classification_unknown
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: u_classification_overdrivable
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: u_classification_underdrivable
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: u_dynamics_absvel_invalidflags
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: f_dynamics_absvel_x
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: f_dynamics_absvel_x_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: f_dynamics_absvel_y
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: f_dynamics_absvel_y_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: f_dynamics_absvel_covariancexy
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: u_dynamics_relvel_invalidflags
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: f_dynamics_relvel_x
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: f_dynamics_relvel_x_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: f_dynamics_relvel_y
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: f_dynamics_relvel_y_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: f_dynamics_relvel_covariancexy
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: u_dynamics_absaccel_invalidflags
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: f_dynamics_absaccel_x
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: f_dynamics_absaccel_x_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: f_dynamics_absaccel_y
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: f_dynamics_absaccel_y_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: f_dynamics_absaccel_covariancexy
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: u_dynamics_relaccel_invalidflags
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: f_dynamics_relaccel_x
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: f_dynamics_relaccel_x_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: f_dynamics_relaccel_y
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: f_dynamics_relaccel_y_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: f_dynamics_relaccel_covariancexy
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: u_dynamics_orientation_invalidflags
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: u_dynamics_orientation_rate_mean
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: u_dynamics_orientation_rate_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: u_shape_length_status
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: u_shape_length_edge_invalidflags
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: u_shape_length_edge_mean
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: u_shape_length_edge_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: u_shape_width_status
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: u_shape_width_edge_invalidflags
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: u_shape_width_edge_mean
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: u_shape_width_edge_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  size_t ret_val = current_alignment - initial_alignment;
  if (is_plain) {
    // All members are plain, and type is not empty.
    // We still need to check that the in-memory alignment
    // is the same as the CDR mandated alignment.
    using DataType = ars548_messages::msg::Object;
    is_plain =
      (
      offsetof(DataType, u_shape_width_edge_std) +
      last_member_size
      ) == ret_val;
  }

  return ret_val;
}

static bool _Object__cdr_serialize(
  const void * untyped_ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  auto typed_message =
    static_cast<const ars548_messages::msg::Object *>(
    untyped_ros_message);
  return cdr_serialize(*typed_message, cdr);
}

static bool _Object__cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  void * untyped_ros_message)
{
  auto typed_message =
    static_cast<ars548_messages::msg::Object *>(
    untyped_ros_message);
  return cdr_deserialize(cdr, *typed_message);
}

static uint32_t _Object__get_serialized_size(
  const void * untyped_ros_message)
{
  auto typed_message =
    static_cast<const ars548_messages::msg::Object *>(
    untyped_ros_message);
  return static_cast<uint32_t>(get_serialized_size(*typed_message, 0));
}

static size_t _Object__max_serialized_size(char & bounds_info)
{
  bool full_bounded;
  bool is_plain;
  size_t ret_val;

  ret_val = max_serialized_size_Object(full_bounded, is_plain, 0);

  bounds_info =
    is_plain ? ROSIDL_TYPESUPPORT_FASTRTPS_PLAIN_TYPE :
    full_bounded ? ROSIDL_TYPESUPPORT_FASTRTPS_BOUNDED_TYPE : ROSIDL_TYPESUPPORT_FASTRTPS_UNBOUNDED_TYPE;
  return ret_val;
}

static message_type_support_callbacks_t _Object__callbacks = {
  "ars548_messages::msg",
  "Object",
  _Object__cdr_serialize,
  _Object__cdr_deserialize,
  _Object__get_serialized_size,
  _Object__max_serialized_size
};

static rosidl_message_type_support_t _Object__handle = {
  rosidl_typesupport_fastrtps_cpp::typesupport_identifier,
  &_Object__callbacks,
  get_message_typesupport_handle_function,
};

}  // namespace typesupport_fastrtps_cpp

}  // namespace msg

}  // namespace ars548_messages

namespace rosidl_typesupport_fastrtps_cpp
{

template<>
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_EXPORT_ars548_messages
const rosidl_message_type_support_t *
get_message_type_support_handle<ars548_messages::msg::Object>()
{
  return &ars548_messages::msg::typesupport_fastrtps_cpp::_Object__handle;
}

}  // namespace rosidl_typesupport_fastrtps_cpp

#ifdef __cplusplus
extern "C"
{
#endif

const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_cpp, ars548_messages, msg, Object)() {
  return &ars548_messages::msg::typesupport_fastrtps_cpp::_Object__handle;
}

#ifdef __cplusplus
}
#endif
