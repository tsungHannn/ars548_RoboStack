// generated from rosidl_typesupport_fastrtps_c/resource/idl__type_support_c.cpp.em
// with input from ars548_messages:msg/Object.idl
// generated code does not contain a copyright notice
#include "ars548_messages/msg/detail/object__rosidl_typesupport_fastrtps_c.h"


#include <cassert>
#include <limits>
#include <string>
#include "rosidl_typesupport_fastrtps_c/identifier.h"
#include "rosidl_typesupport_fastrtps_c/wstring_conversion.hpp"
#include "rosidl_typesupport_fastrtps_cpp/message_type_support.h"
#include "ars548_messages/msg/rosidl_typesupport_fastrtps_c__visibility_control.h"
#include "ars548_messages/msg/detail/object__struct.h"
#include "ars548_messages/msg/detail/object__functions.h"
#include "fastcdr/Cdr.h"

#ifndef _WIN32
# pragma GCC diagnostic push
# pragma GCC diagnostic ignored "-Wunused-parameter"
# ifdef __clang__
#  pragma clang diagnostic ignored "-Wdeprecated-register"
#  pragma clang diagnostic ignored "-Wreturn-type-c-linkage"
# endif
#endif
#ifndef _WIN32
# pragma GCC diagnostic pop
#endif

// includes and forward declarations of message dependencies and their conversion functions

#if defined(__cplusplus)
extern "C"
{
#endif


// forward declare type support functions


using _Object__ros_msg_type = ars548_messages__msg__Object;

static bool _Object__cdr_serialize(
  const void * untyped_ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  if (!untyped_ros_message) {
    fprintf(stderr, "ros message handle is null\n");
    return false;
  }
  const _Object__ros_msg_type * ros_message = static_cast<const _Object__ros_msg_type *>(untyped_ros_message);
  // Field name: u_statussensor
  {
    cdr << ros_message->u_statussensor;
  }

  // Field name: u_id
  {
    cdr << ros_message->u_id;
  }

  // Field name: u_age
  {
    cdr << ros_message->u_age;
  }

  // Field name: u_statusmeasurement
  {
    cdr << ros_message->u_statusmeasurement;
  }

  // Field name: u_statusmovement
  {
    cdr << ros_message->u_statusmovement;
  }

  // Field name: u_position_invalidflags
  {
    cdr << ros_message->u_position_invalidflags;
  }

  // Field name: u_position_reference
  {
    cdr << ros_message->u_position_reference;
  }

  // Field name: u_position_x
  {
    cdr << ros_message->u_position_x;
  }

  // Field name: u_position_x_std
  {
    cdr << ros_message->u_position_x_std;
  }

  // Field name: u_position_y
  {
    cdr << ros_message->u_position_y;
  }

  // Field name: u_position_y_std
  {
    cdr << ros_message->u_position_y_std;
  }

  // Field name: u_position_z
  {
    cdr << ros_message->u_position_z;
  }

  // Field name: u_position_z_std
  {
    cdr << ros_message->u_position_z_std;
  }

  // Field name: u_position_covariancexy
  {
    cdr << ros_message->u_position_covariancexy;
  }

  // Field name: u_position_orientation
  {
    cdr << ros_message->u_position_orientation;
  }

  // Field name: u_position_orientation_std
  {
    cdr << ros_message->u_position_orientation_std;
  }

  // Field name: u_existence_invalidflags
  {
    cdr << ros_message->u_existence_invalidflags;
  }

  // Field name: u_existence_probability
  {
    cdr << ros_message->u_existence_probability;
  }

  // Field name: u_existence_ppv
  {
    cdr << ros_message->u_existence_ppv;
  }

  // Field name: u_classification_car
  {
    cdr << ros_message->u_classification_car;
  }

  // Field name: u_classification_truck
  {
    cdr << ros_message->u_classification_truck;
  }

  // Field name: u_classification_motorcycle
  {
    cdr << ros_message->u_classification_motorcycle;
  }

  // Field name: u_classification_bicycle
  {
    cdr << ros_message->u_classification_bicycle;
  }

  // Field name: u_classification_pedestrian
  {
    cdr << ros_message->u_classification_pedestrian;
  }

  // Field name: u_classification_animal
  {
    cdr << ros_message->u_classification_animal;
  }

  // Field name: u_classification_hazard
  {
    cdr << ros_message->u_classification_hazard;
  }

  // Field name: u_classification_unknown
  {
    cdr << ros_message->u_classification_unknown;
  }

  // Field name: u_classification_overdrivable
  {
    cdr << ros_message->u_classification_overdrivable;
  }

  // Field name: u_classification_underdrivable
  {
    cdr << ros_message->u_classification_underdrivable;
  }

  // Field name: u_dynamics_absvel_invalidflags
  {
    cdr << ros_message->u_dynamics_absvel_invalidflags;
  }

  // Field name: f_dynamics_absvel_x
  {
    cdr << ros_message->f_dynamics_absvel_x;
  }

  // Field name: f_dynamics_absvel_x_std
  {
    cdr << ros_message->f_dynamics_absvel_x_std;
  }

  // Field name: f_dynamics_absvel_y
  {
    cdr << ros_message->f_dynamics_absvel_y;
  }

  // Field name: f_dynamics_absvel_y_std
  {
    cdr << ros_message->f_dynamics_absvel_y_std;
  }

  // Field name: f_dynamics_absvel_covariancexy
  {
    cdr << ros_message->f_dynamics_absvel_covariancexy;
  }

  // Field name: u_dynamics_relvel_invalidflags
  {
    cdr << ros_message->u_dynamics_relvel_invalidflags;
  }

  // Field name: f_dynamics_relvel_x
  {
    cdr << ros_message->f_dynamics_relvel_x;
  }

  // Field name: f_dynamics_relvel_x_std
  {
    cdr << ros_message->f_dynamics_relvel_x_std;
  }

  // Field name: f_dynamics_relvel_y
  {
    cdr << ros_message->f_dynamics_relvel_y;
  }

  // Field name: f_dynamics_relvel_y_std
  {
    cdr << ros_message->f_dynamics_relvel_y_std;
  }

  // Field name: f_dynamics_relvel_covariancexy
  {
    cdr << ros_message->f_dynamics_relvel_covariancexy;
  }

  // Field name: u_dynamics_absaccel_invalidflags
  {
    cdr << ros_message->u_dynamics_absaccel_invalidflags;
  }

  // Field name: f_dynamics_absaccel_x
  {
    cdr << ros_message->f_dynamics_absaccel_x;
  }

  // Field name: f_dynamics_absaccel_x_std
  {
    cdr << ros_message->f_dynamics_absaccel_x_std;
  }

  // Field name: f_dynamics_absaccel_y
  {
    cdr << ros_message->f_dynamics_absaccel_y;
  }

  // Field name: f_dynamics_absaccel_y_std
  {
    cdr << ros_message->f_dynamics_absaccel_y_std;
  }

  // Field name: f_dynamics_absaccel_covariancexy
  {
    cdr << ros_message->f_dynamics_absaccel_covariancexy;
  }

  // Field name: u_dynamics_relaccel_invalidflags
  {
    cdr << ros_message->u_dynamics_relaccel_invalidflags;
  }

  // Field name: f_dynamics_relaccel_x
  {
    cdr << ros_message->f_dynamics_relaccel_x;
  }

  // Field name: f_dynamics_relaccel_x_std
  {
    cdr << ros_message->f_dynamics_relaccel_x_std;
  }

  // Field name: f_dynamics_relaccel_y
  {
    cdr << ros_message->f_dynamics_relaccel_y;
  }

  // Field name: f_dynamics_relaccel_y_std
  {
    cdr << ros_message->f_dynamics_relaccel_y_std;
  }

  // Field name: f_dynamics_relaccel_covariancexy
  {
    cdr << ros_message->f_dynamics_relaccel_covariancexy;
  }

  // Field name: u_dynamics_orientation_invalidflags
  {
    cdr << ros_message->u_dynamics_orientation_invalidflags;
  }

  // Field name: u_dynamics_orientation_rate_mean
  {
    cdr << ros_message->u_dynamics_orientation_rate_mean;
  }

  // Field name: u_dynamics_orientation_rate_std
  {
    cdr << ros_message->u_dynamics_orientation_rate_std;
  }

  // Field name: u_shape_length_status
  {
    cdr << ros_message->u_shape_length_status;
  }

  // Field name: u_shape_length_edge_invalidflags
  {
    cdr << ros_message->u_shape_length_edge_invalidflags;
  }

  // Field name: u_shape_length_edge_mean
  {
    cdr << ros_message->u_shape_length_edge_mean;
  }

  // Field name: u_shape_length_edge_std
  {
    cdr << ros_message->u_shape_length_edge_std;
  }

  // Field name: u_shape_width_status
  {
    cdr << ros_message->u_shape_width_status;
  }

  // Field name: u_shape_width_edge_invalidflags
  {
    cdr << ros_message->u_shape_width_edge_invalidflags;
  }

  // Field name: u_shape_width_edge_mean
  {
    cdr << ros_message->u_shape_width_edge_mean;
  }

  // Field name: u_shape_width_edge_std
  {
    cdr << ros_message->u_shape_width_edge_std;
  }

  return true;
}

static bool _Object__cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  void * untyped_ros_message)
{
  if (!untyped_ros_message) {
    fprintf(stderr, "ros message handle is null\n");
    return false;
  }
  _Object__ros_msg_type * ros_message = static_cast<_Object__ros_msg_type *>(untyped_ros_message);
  // Field name: u_statussensor
  {
    cdr >> ros_message->u_statussensor;
  }

  // Field name: u_id
  {
    cdr >> ros_message->u_id;
  }

  // Field name: u_age
  {
    cdr >> ros_message->u_age;
  }

  // Field name: u_statusmeasurement
  {
    cdr >> ros_message->u_statusmeasurement;
  }

  // Field name: u_statusmovement
  {
    cdr >> ros_message->u_statusmovement;
  }

  // Field name: u_position_invalidflags
  {
    cdr >> ros_message->u_position_invalidflags;
  }

  // Field name: u_position_reference
  {
    cdr >> ros_message->u_position_reference;
  }

  // Field name: u_position_x
  {
    cdr >> ros_message->u_position_x;
  }

  // Field name: u_position_x_std
  {
    cdr >> ros_message->u_position_x_std;
  }

  // Field name: u_position_y
  {
    cdr >> ros_message->u_position_y;
  }

  // Field name: u_position_y_std
  {
    cdr >> ros_message->u_position_y_std;
  }

  // Field name: u_position_z
  {
    cdr >> ros_message->u_position_z;
  }

  // Field name: u_position_z_std
  {
    cdr >> ros_message->u_position_z_std;
  }

  // Field name: u_position_covariancexy
  {
    cdr >> ros_message->u_position_covariancexy;
  }

  // Field name: u_position_orientation
  {
    cdr >> ros_message->u_position_orientation;
  }

  // Field name: u_position_orientation_std
  {
    cdr >> ros_message->u_position_orientation_std;
  }

  // Field name: u_existence_invalidflags
  {
    cdr >> ros_message->u_existence_invalidflags;
  }

  // Field name: u_existence_probability
  {
    cdr >> ros_message->u_existence_probability;
  }

  // Field name: u_existence_ppv
  {
    cdr >> ros_message->u_existence_ppv;
  }

  // Field name: u_classification_car
  {
    cdr >> ros_message->u_classification_car;
  }

  // Field name: u_classification_truck
  {
    cdr >> ros_message->u_classification_truck;
  }

  // Field name: u_classification_motorcycle
  {
    cdr >> ros_message->u_classification_motorcycle;
  }

  // Field name: u_classification_bicycle
  {
    cdr >> ros_message->u_classification_bicycle;
  }

  // Field name: u_classification_pedestrian
  {
    cdr >> ros_message->u_classification_pedestrian;
  }

  // Field name: u_classification_animal
  {
    cdr >> ros_message->u_classification_animal;
  }

  // Field name: u_classification_hazard
  {
    cdr >> ros_message->u_classification_hazard;
  }

  // Field name: u_classification_unknown
  {
    cdr >> ros_message->u_classification_unknown;
  }

  // Field name: u_classification_overdrivable
  {
    cdr >> ros_message->u_classification_overdrivable;
  }

  // Field name: u_classification_underdrivable
  {
    cdr >> ros_message->u_classification_underdrivable;
  }

  // Field name: u_dynamics_absvel_invalidflags
  {
    cdr >> ros_message->u_dynamics_absvel_invalidflags;
  }

  // Field name: f_dynamics_absvel_x
  {
    cdr >> ros_message->f_dynamics_absvel_x;
  }

  // Field name: f_dynamics_absvel_x_std
  {
    cdr >> ros_message->f_dynamics_absvel_x_std;
  }

  // Field name: f_dynamics_absvel_y
  {
    cdr >> ros_message->f_dynamics_absvel_y;
  }

  // Field name: f_dynamics_absvel_y_std
  {
    cdr >> ros_message->f_dynamics_absvel_y_std;
  }

  // Field name: f_dynamics_absvel_covariancexy
  {
    cdr >> ros_message->f_dynamics_absvel_covariancexy;
  }

  // Field name: u_dynamics_relvel_invalidflags
  {
    cdr >> ros_message->u_dynamics_relvel_invalidflags;
  }

  // Field name: f_dynamics_relvel_x
  {
    cdr >> ros_message->f_dynamics_relvel_x;
  }

  // Field name: f_dynamics_relvel_x_std
  {
    cdr >> ros_message->f_dynamics_relvel_x_std;
  }

  // Field name: f_dynamics_relvel_y
  {
    cdr >> ros_message->f_dynamics_relvel_y;
  }

  // Field name: f_dynamics_relvel_y_std
  {
    cdr >> ros_message->f_dynamics_relvel_y_std;
  }

  // Field name: f_dynamics_relvel_covariancexy
  {
    cdr >> ros_message->f_dynamics_relvel_covariancexy;
  }

  // Field name: u_dynamics_absaccel_invalidflags
  {
    cdr >> ros_message->u_dynamics_absaccel_invalidflags;
  }

  // Field name: f_dynamics_absaccel_x
  {
    cdr >> ros_message->f_dynamics_absaccel_x;
  }

  // Field name: f_dynamics_absaccel_x_std
  {
    cdr >> ros_message->f_dynamics_absaccel_x_std;
  }

  // Field name: f_dynamics_absaccel_y
  {
    cdr >> ros_message->f_dynamics_absaccel_y;
  }

  // Field name: f_dynamics_absaccel_y_std
  {
    cdr >> ros_message->f_dynamics_absaccel_y_std;
  }

  // Field name: f_dynamics_absaccel_covariancexy
  {
    cdr >> ros_message->f_dynamics_absaccel_covariancexy;
  }

  // Field name: u_dynamics_relaccel_invalidflags
  {
    cdr >> ros_message->u_dynamics_relaccel_invalidflags;
  }

  // Field name: f_dynamics_relaccel_x
  {
    cdr >> ros_message->f_dynamics_relaccel_x;
  }

  // Field name: f_dynamics_relaccel_x_std
  {
    cdr >> ros_message->f_dynamics_relaccel_x_std;
  }

  // Field name: f_dynamics_relaccel_y
  {
    cdr >> ros_message->f_dynamics_relaccel_y;
  }

  // Field name: f_dynamics_relaccel_y_std
  {
    cdr >> ros_message->f_dynamics_relaccel_y_std;
  }

  // Field name: f_dynamics_relaccel_covariancexy
  {
    cdr >> ros_message->f_dynamics_relaccel_covariancexy;
  }

  // Field name: u_dynamics_orientation_invalidflags
  {
    cdr >> ros_message->u_dynamics_orientation_invalidflags;
  }

  // Field name: u_dynamics_orientation_rate_mean
  {
    cdr >> ros_message->u_dynamics_orientation_rate_mean;
  }

  // Field name: u_dynamics_orientation_rate_std
  {
    cdr >> ros_message->u_dynamics_orientation_rate_std;
  }

  // Field name: u_shape_length_status
  {
    cdr >> ros_message->u_shape_length_status;
  }

  // Field name: u_shape_length_edge_invalidflags
  {
    cdr >> ros_message->u_shape_length_edge_invalidflags;
  }

  // Field name: u_shape_length_edge_mean
  {
    cdr >> ros_message->u_shape_length_edge_mean;
  }

  // Field name: u_shape_length_edge_std
  {
    cdr >> ros_message->u_shape_length_edge_std;
  }

  // Field name: u_shape_width_status
  {
    cdr >> ros_message->u_shape_width_status;
  }

  // Field name: u_shape_width_edge_invalidflags
  {
    cdr >> ros_message->u_shape_width_edge_invalidflags;
  }

  // Field name: u_shape_width_edge_mean
  {
    cdr >> ros_message->u_shape_width_edge_mean;
  }

  // Field name: u_shape_width_edge_std
  {
    cdr >> ros_message->u_shape_width_edge_std;
  }

  return true;
}  // NOLINT(readability/fn_size)

ROSIDL_TYPESUPPORT_FASTRTPS_C_PUBLIC_ars548_messages
size_t get_serialized_size_ars548_messages__msg__Object(
  const void * untyped_ros_message,
  size_t current_alignment)
{
  const _Object__ros_msg_type * ros_message = static_cast<const _Object__ros_msg_type *>(untyped_ros_message);
  (void)ros_message;
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  (void)padding;
  (void)wchar_size;

  // field.name u_statussensor
  {
    size_t item_size = sizeof(ros_message->u_statussensor);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_id
  {
    size_t item_size = sizeof(ros_message->u_id);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_age
  {
    size_t item_size = sizeof(ros_message->u_age);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_statusmeasurement
  {
    size_t item_size = sizeof(ros_message->u_statusmeasurement);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_statusmovement
  {
    size_t item_size = sizeof(ros_message->u_statusmovement);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_position_invalidflags
  {
    size_t item_size = sizeof(ros_message->u_position_invalidflags);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_position_reference
  {
    size_t item_size = sizeof(ros_message->u_position_reference);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_position_x
  {
    size_t item_size = sizeof(ros_message->u_position_x);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_position_x_std
  {
    size_t item_size = sizeof(ros_message->u_position_x_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_position_y
  {
    size_t item_size = sizeof(ros_message->u_position_y);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_position_y_std
  {
    size_t item_size = sizeof(ros_message->u_position_y_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_position_z
  {
    size_t item_size = sizeof(ros_message->u_position_z);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_position_z_std
  {
    size_t item_size = sizeof(ros_message->u_position_z_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_position_covariancexy
  {
    size_t item_size = sizeof(ros_message->u_position_covariancexy);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_position_orientation
  {
    size_t item_size = sizeof(ros_message->u_position_orientation);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_position_orientation_std
  {
    size_t item_size = sizeof(ros_message->u_position_orientation_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_existence_invalidflags
  {
    size_t item_size = sizeof(ros_message->u_existence_invalidflags);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_existence_probability
  {
    size_t item_size = sizeof(ros_message->u_existence_probability);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_existence_ppv
  {
    size_t item_size = sizeof(ros_message->u_existence_ppv);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_classification_car
  {
    size_t item_size = sizeof(ros_message->u_classification_car);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_classification_truck
  {
    size_t item_size = sizeof(ros_message->u_classification_truck);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_classification_motorcycle
  {
    size_t item_size = sizeof(ros_message->u_classification_motorcycle);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_classification_bicycle
  {
    size_t item_size = sizeof(ros_message->u_classification_bicycle);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_classification_pedestrian
  {
    size_t item_size = sizeof(ros_message->u_classification_pedestrian);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_classification_animal
  {
    size_t item_size = sizeof(ros_message->u_classification_animal);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_classification_hazard
  {
    size_t item_size = sizeof(ros_message->u_classification_hazard);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_classification_unknown
  {
    size_t item_size = sizeof(ros_message->u_classification_unknown);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_classification_overdrivable
  {
    size_t item_size = sizeof(ros_message->u_classification_overdrivable);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_classification_underdrivable
  {
    size_t item_size = sizeof(ros_message->u_classification_underdrivable);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_dynamics_absvel_invalidflags
  {
    size_t item_size = sizeof(ros_message->u_dynamics_absvel_invalidflags);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_dynamics_absvel_x
  {
    size_t item_size = sizeof(ros_message->f_dynamics_absvel_x);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_dynamics_absvel_x_std
  {
    size_t item_size = sizeof(ros_message->f_dynamics_absvel_x_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_dynamics_absvel_y
  {
    size_t item_size = sizeof(ros_message->f_dynamics_absvel_y);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_dynamics_absvel_y_std
  {
    size_t item_size = sizeof(ros_message->f_dynamics_absvel_y_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_dynamics_absvel_covariancexy
  {
    size_t item_size = sizeof(ros_message->f_dynamics_absvel_covariancexy);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_dynamics_relvel_invalidflags
  {
    size_t item_size = sizeof(ros_message->u_dynamics_relvel_invalidflags);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_dynamics_relvel_x
  {
    size_t item_size = sizeof(ros_message->f_dynamics_relvel_x);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_dynamics_relvel_x_std
  {
    size_t item_size = sizeof(ros_message->f_dynamics_relvel_x_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_dynamics_relvel_y
  {
    size_t item_size = sizeof(ros_message->f_dynamics_relvel_y);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_dynamics_relvel_y_std
  {
    size_t item_size = sizeof(ros_message->f_dynamics_relvel_y_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_dynamics_relvel_covariancexy
  {
    size_t item_size = sizeof(ros_message->f_dynamics_relvel_covariancexy);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_dynamics_absaccel_invalidflags
  {
    size_t item_size = sizeof(ros_message->u_dynamics_absaccel_invalidflags);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_dynamics_absaccel_x
  {
    size_t item_size = sizeof(ros_message->f_dynamics_absaccel_x);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_dynamics_absaccel_x_std
  {
    size_t item_size = sizeof(ros_message->f_dynamics_absaccel_x_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_dynamics_absaccel_y
  {
    size_t item_size = sizeof(ros_message->f_dynamics_absaccel_y);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_dynamics_absaccel_y_std
  {
    size_t item_size = sizeof(ros_message->f_dynamics_absaccel_y_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_dynamics_absaccel_covariancexy
  {
    size_t item_size = sizeof(ros_message->f_dynamics_absaccel_covariancexy);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_dynamics_relaccel_invalidflags
  {
    size_t item_size = sizeof(ros_message->u_dynamics_relaccel_invalidflags);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_dynamics_relaccel_x
  {
    size_t item_size = sizeof(ros_message->f_dynamics_relaccel_x);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_dynamics_relaccel_x_std
  {
    size_t item_size = sizeof(ros_message->f_dynamics_relaccel_x_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_dynamics_relaccel_y
  {
    size_t item_size = sizeof(ros_message->f_dynamics_relaccel_y);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_dynamics_relaccel_y_std
  {
    size_t item_size = sizeof(ros_message->f_dynamics_relaccel_y_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_dynamics_relaccel_covariancexy
  {
    size_t item_size = sizeof(ros_message->f_dynamics_relaccel_covariancexy);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_dynamics_orientation_invalidflags
  {
    size_t item_size = sizeof(ros_message->u_dynamics_orientation_invalidflags);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_dynamics_orientation_rate_mean
  {
    size_t item_size = sizeof(ros_message->u_dynamics_orientation_rate_mean);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_dynamics_orientation_rate_std
  {
    size_t item_size = sizeof(ros_message->u_dynamics_orientation_rate_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_shape_length_status
  {
    size_t item_size = sizeof(ros_message->u_shape_length_status);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_shape_length_edge_invalidflags
  {
    size_t item_size = sizeof(ros_message->u_shape_length_edge_invalidflags);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_shape_length_edge_mean
  {
    size_t item_size = sizeof(ros_message->u_shape_length_edge_mean);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_shape_length_edge_std
  {
    size_t item_size = sizeof(ros_message->u_shape_length_edge_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_shape_width_status
  {
    size_t item_size = sizeof(ros_message->u_shape_width_status);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_shape_width_edge_invalidflags
  {
    size_t item_size = sizeof(ros_message->u_shape_width_edge_invalidflags);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_shape_width_edge_mean
  {
    size_t item_size = sizeof(ros_message->u_shape_width_edge_mean);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_shape_width_edge_std
  {
    size_t item_size = sizeof(ros_message->u_shape_width_edge_std);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }

  return current_alignment - initial_alignment;
}

static uint32_t _Object__get_serialized_size(const void * untyped_ros_message)
{
  return static_cast<uint32_t>(
    get_serialized_size_ars548_messages__msg__Object(
      untyped_ros_message, 0));
}

ROSIDL_TYPESUPPORT_FASTRTPS_C_PUBLIC_ars548_messages
size_t max_serialized_size_ars548_messages__msg__Object(
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

  // member: u_statussensor
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint16_t);
    current_alignment += array_size * sizeof(uint16_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint16_t));
  }
  // member: u_id
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: u_age
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint16_t);
    current_alignment += array_size * sizeof(uint16_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint16_t));
  }
  // member: u_statusmeasurement
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: u_statusmovement
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: u_position_invalidflags
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint16_t);
    current_alignment += array_size * sizeof(uint16_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint16_t));
  }
  // member: u_position_reference
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: u_position_x
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: u_position_x_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: u_position_y
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: u_position_y_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: u_position_z
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: u_position_z_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: u_position_covariancexy
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: u_position_orientation
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: u_position_orientation_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: u_existence_invalidflags
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: u_existence_probability
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: u_existence_ppv
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: u_classification_car
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: u_classification_truck
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: u_classification_motorcycle
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: u_classification_bicycle
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: u_classification_pedestrian
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: u_classification_animal
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: u_classification_hazard
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: u_classification_unknown
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: u_classification_overdrivable
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: u_classification_underdrivable
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: u_dynamics_absvel_invalidflags
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: f_dynamics_absvel_x
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: f_dynamics_absvel_x_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: f_dynamics_absvel_y
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: f_dynamics_absvel_y_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: f_dynamics_absvel_covariancexy
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: u_dynamics_relvel_invalidflags
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: f_dynamics_relvel_x
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: f_dynamics_relvel_x_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: f_dynamics_relvel_y
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: f_dynamics_relvel_y_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: f_dynamics_relvel_covariancexy
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: u_dynamics_absaccel_invalidflags
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: f_dynamics_absaccel_x
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: f_dynamics_absaccel_x_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: f_dynamics_absaccel_y
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: f_dynamics_absaccel_y_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: f_dynamics_absaccel_covariancexy
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: u_dynamics_relaccel_invalidflags
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: f_dynamics_relaccel_x
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: f_dynamics_relaccel_x_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: f_dynamics_relaccel_y
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: f_dynamics_relaccel_y_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: f_dynamics_relaccel_covariancexy
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: u_dynamics_orientation_invalidflags
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: u_dynamics_orientation_rate_mean
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: u_dynamics_orientation_rate_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: u_shape_length_status
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: u_shape_length_edge_invalidflags
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: u_shape_length_edge_mean
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: u_shape_length_edge_std
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: u_shape_width_status
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: u_shape_width_edge_invalidflags
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: u_shape_width_edge_mean
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: u_shape_width_edge_std
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
    using DataType = ars548_messages__msg__Object;
    is_plain =
      (
      offsetof(DataType, u_shape_width_edge_std) +
      last_member_size
      ) == ret_val;
  }

  return ret_val;
}

static size_t _Object__max_serialized_size(char & bounds_info)
{
  bool full_bounded;
  bool is_plain;
  size_t ret_val;

  ret_val = max_serialized_size_ars548_messages__msg__Object(
    full_bounded, is_plain, 0);

  bounds_info =
    is_plain ? ROSIDL_TYPESUPPORT_FASTRTPS_PLAIN_TYPE :
    full_bounded ? ROSIDL_TYPESUPPORT_FASTRTPS_BOUNDED_TYPE : ROSIDL_TYPESUPPORT_FASTRTPS_UNBOUNDED_TYPE;
  return ret_val;
}


static message_type_support_callbacks_t __callbacks_Object = {
  "ars548_messages::msg",
  "Object",
  _Object__cdr_serialize,
  _Object__cdr_deserialize,
  _Object__get_serialized_size,
  _Object__max_serialized_size
};

static rosidl_message_type_support_t _Object__type_support = {
  rosidl_typesupport_fastrtps_c__identifier,
  &__callbacks_Object,
  get_message_typesupport_handle_function,
};

const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_c, ars548_messages, msg, Object)() {
  return &_Object__type_support;
}

#if defined(__cplusplus)
}
#endif
