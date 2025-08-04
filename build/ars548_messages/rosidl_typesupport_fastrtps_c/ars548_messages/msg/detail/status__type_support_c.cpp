// generated from rosidl_typesupport_fastrtps_c/resource/idl__type_support_c.cpp.em
// with input from ars548_messages:msg/Status.idl
// generated code does not contain a copyright notice
#include "ars548_messages/msg/detail/status__rosidl_typesupport_fastrtps_c.h"


#include <cassert>
#include <limits>
#include <string>
#include "rosidl_typesupport_fastrtps_c/identifier.h"
#include "rosidl_typesupport_fastrtps_c/wstring_conversion.hpp"
#include "rosidl_typesupport_fastrtps_cpp/message_type_support.h"
#include "ars548_messages/msg/rosidl_typesupport_fastrtps_c__visibility_control.h"
#include "ars548_messages/msg/detail/status__struct.h"
#include "ars548_messages/msg/detail/status__functions.h"
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


using _Status__ros_msg_type = ars548_messages__msg__Status;

static bool _Status__cdr_serialize(
  const void * untyped_ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  if (!untyped_ros_message) {
    fprintf(stderr, "ros message handle is null\n");
    return false;
  }
  const _Status__ros_msg_type * ros_message = static_cast<const _Status__ros_msg_type *>(untyped_ros_message);
  // Field name: timestamp_nanoseconds
  {
    cdr << ros_message->timestamp_nanoseconds;
  }

  // Field name: timestamp_seconds
  {
    cdr << ros_message->timestamp_seconds;
  }

  // Field name: timestamp_syncstatus
  {
    cdr << ros_message->timestamp_syncstatus;
  }

  // Field name: swversion_major
  {
    cdr << ros_message->swversion_major;
  }

  // Field name: swversion_minor
  {
    cdr << ros_message->swversion_minor;
  }

  // Field name: swversion_patch
  {
    cdr << ros_message->swversion_patch;
  }

  // Field name: longitudinal
  {
    cdr << ros_message->longitudinal;
  }

  // Field name: lateral
  {
    cdr << ros_message->lateral;
  }

  // Field name: vertical
  {
    cdr << ros_message->vertical;
  }

  // Field name: yaw
  {
    cdr << ros_message->yaw;
  }

  // Field name: pitch
  {
    cdr << ros_message->pitch;
  }

  // Field name: plugorientation
  {
    cdr << ros_message->plugorientation;
  }

  // Field name: length
  {
    cdr << ros_message->length;
  }

  // Field name: width
  {
    cdr << ros_message->width;
  }

  // Field name: height
  {
    cdr << ros_message->height;
  }

  // Field name: wheelbase
  {
    cdr << ros_message->wheelbase;
  }

  // Field name: maximumdistance
  {
    cdr << ros_message->maximumdistance;
  }

  // Field name: frequencyslot
  {
    cdr << ros_message->frequencyslot;
  }

  // Field name: cycletime
  {
    cdr << ros_message->cycletime;
  }

  // Field name: timeslot
  {
    cdr << ros_message->timeslot;
  }

  // Field name: hcc
  {
    cdr << ros_message->hcc;
  }

  // Field name: powersave_standstill
  {
    cdr << ros_message->powersave_standstill;
  }

  // Field name: sensoripaddress_0
  {
    cdr << ros_message->sensoripaddress_0;
  }

  // Field name: sensoripaddress_1
  {
    cdr << ros_message->sensoripaddress_1;
  }

  // Field name: configurationcounter
  {
    cdr << ros_message->configurationcounter;
  }

  // Field name: status_longitudinalvelocity
  {
    cdr << ros_message->status_longitudinalvelocity;
  }

  // Field name: status_longitudinalacceleration
  {
    cdr << ros_message->status_longitudinalacceleration;
  }

  // Field name: status_lateralacceleration
  {
    cdr << ros_message->status_lateralacceleration;
  }

  // Field name: status_yawrate
  {
    cdr << ros_message->status_yawrate;
  }

  // Field name: status_steeringangle
  {
    cdr << ros_message->status_steeringangle;
  }

  // Field name: status_drivingdirection
  {
    cdr << ros_message->status_drivingdirection;
  }

  // Field name: status_characteristicspeed
  {
    cdr << ros_message->status_characteristicspeed;
  }

  // Field name: status_radarstatus
  {
    cdr << ros_message->status_radarstatus;
  }

  // Field name: status_voltagestatus
  {
    cdr << ros_message->status_voltagestatus;
  }

  // Field name: status_temperaturestatus
  {
    cdr << ros_message->status_temperaturestatus;
  }

  // Field name: status_blockagestatus
  {
    cdr << ros_message->status_blockagestatus;
  }

  return true;
}

static bool _Status__cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  void * untyped_ros_message)
{
  if (!untyped_ros_message) {
    fprintf(stderr, "ros message handle is null\n");
    return false;
  }
  _Status__ros_msg_type * ros_message = static_cast<_Status__ros_msg_type *>(untyped_ros_message);
  // Field name: timestamp_nanoseconds
  {
    cdr >> ros_message->timestamp_nanoseconds;
  }

  // Field name: timestamp_seconds
  {
    cdr >> ros_message->timestamp_seconds;
  }

  // Field name: timestamp_syncstatus
  {
    cdr >> ros_message->timestamp_syncstatus;
  }

  // Field name: swversion_major
  {
    cdr >> ros_message->swversion_major;
  }

  // Field name: swversion_minor
  {
    cdr >> ros_message->swversion_minor;
  }

  // Field name: swversion_patch
  {
    cdr >> ros_message->swversion_patch;
  }

  // Field name: longitudinal
  {
    cdr >> ros_message->longitudinal;
  }

  // Field name: lateral
  {
    cdr >> ros_message->lateral;
  }

  // Field name: vertical
  {
    cdr >> ros_message->vertical;
  }

  // Field name: yaw
  {
    cdr >> ros_message->yaw;
  }

  // Field name: pitch
  {
    cdr >> ros_message->pitch;
  }

  // Field name: plugorientation
  {
    cdr >> ros_message->plugorientation;
  }

  // Field name: length
  {
    cdr >> ros_message->length;
  }

  // Field name: width
  {
    cdr >> ros_message->width;
  }

  // Field name: height
  {
    cdr >> ros_message->height;
  }

  // Field name: wheelbase
  {
    cdr >> ros_message->wheelbase;
  }

  // Field name: maximumdistance
  {
    cdr >> ros_message->maximumdistance;
  }

  // Field name: frequencyslot
  {
    cdr >> ros_message->frequencyslot;
  }

  // Field name: cycletime
  {
    cdr >> ros_message->cycletime;
  }

  // Field name: timeslot
  {
    cdr >> ros_message->timeslot;
  }

  // Field name: hcc
  {
    cdr >> ros_message->hcc;
  }

  // Field name: powersave_standstill
  {
    cdr >> ros_message->powersave_standstill;
  }

  // Field name: sensoripaddress_0
  {
    cdr >> ros_message->sensoripaddress_0;
  }

  // Field name: sensoripaddress_1
  {
    cdr >> ros_message->sensoripaddress_1;
  }

  // Field name: configurationcounter
  {
    cdr >> ros_message->configurationcounter;
  }

  // Field name: status_longitudinalvelocity
  {
    cdr >> ros_message->status_longitudinalvelocity;
  }

  // Field name: status_longitudinalacceleration
  {
    cdr >> ros_message->status_longitudinalacceleration;
  }

  // Field name: status_lateralacceleration
  {
    cdr >> ros_message->status_lateralacceleration;
  }

  // Field name: status_yawrate
  {
    cdr >> ros_message->status_yawrate;
  }

  // Field name: status_steeringangle
  {
    cdr >> ros_message->status_steeringangle;
  }

  // Field name: status_drivingdirection
  {
    cdr >> ros_message->status_drivingdirection;
  }

  // Field name: status_characteristicspeed
  {
    cdr >> ros_message->status_characteristicspeed;
  }

  // Field name: status_radarstatus
  {
    cdr >> ros_message->status_radarstatus;
  }

  // Field name: status_voltagestatus
  {
    cdr >> ros_message->status_voltagestatus;
  }

  // Field name: status_temperaturestatus
  {
    cdr >> ros_message->status_temperaturestatus;
  }

  // Field name: status_blockagestatus
  {
    cdr >> ros_message->status_blockagestatus;
  }

  return true;
}  // NOLINT(readability/fn_size)

ROSIDL_TYPESUPPORT_FASTRTPS_C_PUBLIC_ars548_messages
size_t get_serialized_size_ars548_messages__msg__Status(
  const void * untyped_ros_message,
  size_t current_alignment)
{
  const _Status__ros_msg_type * ros_message = static_cast<const _Status__ros_msg_type *>(untyped_ros_message);
  (void)ros_message;
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  (void)padding;
  (void)wchar_size;

  // field.name timestamp_nanoseconds
  {
    size_t item_size = sizeof(ros_message->timestamp_nanoseconds);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name timestamp_seconds
  {
    size_t item_size = sizeof(ros_message->timestamp_seconds);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name timestamp_syncstatus
  {
    size_t item_size = sizeof(ros_message->timestamp_syncstatus);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name swversion_major
  {
    size_t item_size = sizeof(ros_message->swversion_major);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name swversion_minor
  {
    size_t item_size = sizeof(ros_message->swversion_minor);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name swversion_patch
  {
    size_t item_size = sizeof(ros_message->swversion_patch);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name longitudinal
  {
    size_t item_size = sizeof(ros_message->longitudinal);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name lateral
  {
    size_t item_size = sizeof(ros_message->lateral);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name vertical
  {
    size_t item_size = sizeof(ros_message->vertical);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name yaw
  {
    size_t item_size = sizeof(ros_message->yaw);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name pitch
  {
    size_t item_size = sizeof(ros_message->pitch);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name plugorientation
  {
    size_t item_size = sizeof(ros_message->plugorientation);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name length
  {
    size_t item_size = sizeof(ros_message->length);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name width
  {
    size_t item_size = sizeof(ros_message->width);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name height
  {
    size_t item_size = sizeof(ros_message->height);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name wheelbase
  {
    size_t item_size = sizeof(ros_message->wheelbase);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name maximumdistance
  {
    size_t item_size = sizeof(ros_message->maximumdistance);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name frequencyslot
  {
    size_t item_size = sizeof(ros_message->frequencyslot);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name cycletime
  {
    size_t item_size = sizeof(ros_message->cycletime);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name timeslot
  {
    size_t item_size = sizeof(ros_message->timeslot);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name hcc
  {
    size_t item_size = sizeof(ros_message->hcc);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name powersave_standstill
  {
    size_t item_size = sizeof(ros_message->powersave_standstill);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name sensoripaddress_0
  {
    size_t item_size = sizeof(ros_message->sensoripaddress_0);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name sensoripaddress_1
  {
    size_t item_size = sizeof(ros_message->sensoripaddress_1);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name configurationcounter
  {
    size_t item_size = sizeof(ros_message->configurationcounter);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name status_longitudinalvelocity
  {
    size_t item_size = sizeof(ros_message->status_longitudinalvelocity);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name status_longitudinalacceleration
  {
    size_t item_size = sizeof(ros_message->status_longitudinalacceleration);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name status_lateralacceleration
  {
    size_t item_size = sizeof(ros_message->status_lateralacceleration);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name status_yawrate
  {
    size_t item_size = sizeof(ros_message->status_yawrate);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name status_steeringangle
  {
    size_t item_size = sizeof(ros_message->status_steeringangle);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name status_drivingdirection
  {
    size_t item_size = sizeof(ros_message->status_drivingdirection);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name status_characteristicspeed
  {
    size_t item_size = sizeof(ros_message->status_characteristicspeed);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name status_radarstatus
  {
    size_t item_size = sizeof(ros_message->status_radarstatus);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name status_voltagestatus
  {
    size_t item_size = sizeof(ros_message->status_voltagestatus);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name status_temperaturestatus
  {
    size_t item_size = sizeof(ros_message->status_temperaturestatus);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name status_blockagestatus
  {
    size_t item_size = sizeof(ros_message->status_blockagestatus);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }

  return current_alignment - initial_alignment;
}

static uint32_t _Status__get_serialized_size(const void * untyped_ros_message)
{
  return static_cast<uint32_t>(
    get_serialized_size_ars548_messages__msg__Status(
      untyped_ros_message, 0));
}

ROSIDL_TYPESUPPORT_FASTRTPS_C_PUBLIC_ars548_messages
size_t max_serialized_size_ars548_messages__msg__Status(
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

  // member: timestamp_nanoseconds
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: timestamp_seconds
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: timestamp_syncstatus
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: swversion_major
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: swversion_minor
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: swversion_patch
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: longitudinal
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: lateral
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: vertical
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: yaw
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: pitch
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: plugorientation
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: length
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: width
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: height
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: wheelbase
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: maximumdistance
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint16_t);
    current_alignment += array_size * sizeof(uint16_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint16_t));
  }
  // member: frequencyslot
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: cycletime
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: timeslot
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: hcc
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: powersave_standstill
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: sensoripaddress_0
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: sensoripaddress_1
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: configurationcounter
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: status_longitudinalvelocity
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: status_longitudinalacceleration
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: status_lateralacceleration
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: status_yawrate
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: status_steeringangle
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: status_drivingdirection
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: status_characteristicspeed
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: status_radarstatus
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: status_voltagestatus
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: status_temperaturestatus
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: status_blockagestatus
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  size_t ret_val = current_alignment - initial_alignment;
  if (is_plain) {
    // All members are plain, and type is not empty.
    // We still need to check that the in-memory alignment
    // is the same as the CDR mandated alignment.
    using DataType = ars548_messages__msg__Status;
    is_plain =
      (
      offsetof(DataType, status_blockagestatus) +
      last_member_size
      ) == ret_val;
  }

  return ret_val;
}

static size_t _Status__max_serialized_size(char & bounds_info)
{
  bool full_bounded;
  bool is_plain;
  size_t ret_val;

  ret_val = max_serialized_size_ars548_messages__msg__Status(
    full_bounded, is_plain, 0);

  bounds_info =
    is_plain ? ROSIDL_TYPESUPPORT_FASTRTPS_PLAIN_TYPE :
    full_bounded ? ROSIDL_TYPESUPPORT_FASTRTPS_BOUNDED_TYPE : ROSIDL_TYPESUPPORT_FASTRTPS_UNBOUNDED_TYPE;
  return ret_val;
}


static message_type_support_callbacks_t __callbacks_Status = {
  "ars548_messages::msg",
  "Status",
  _Status__cdr_serialize,
  _Status__cdr_deserialize,
  _Status__get_serialized_size,
  _Status__max_serialized_size
};

static rosidl_message_type_support_t _Status__type_support = {
  rosidl_typesupport_fastrtps_c__identifier,
  &__callbacks_Status,
  get_message_typesupport_handle_function,
};

const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_c, ars548_messages, msg, Status)() {
  return &_Status__type_support;
}

#if defined(__cplusplus)
}
#endif
