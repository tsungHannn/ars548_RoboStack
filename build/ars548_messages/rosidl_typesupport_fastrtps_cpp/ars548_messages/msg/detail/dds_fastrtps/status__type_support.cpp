// generated from rosidl_typesupport_fastrtps_cpp/resource/idl__type_support.cpp.em
// with input from ars548_messages:msg/Status.idl
// generated code does not contain a copyright notice
#include "ars548_messages/msg/detail/status__rosidl_typesupport_fastrtps_cpp.hpp"
#include "ars548_messages/msg/detail/status__struct.hpp"

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
  const ars548_messages::msg::Status & ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  // Member: timestamp_nanoseconds
  cdr << ros_message.timestamp_nanoseconds;
  // Member: timestamp_seconds
  cdr << ros_message.timestamp_seconds;
  // Member: timestamp_syncstatus
  cdr << ros_message.timestamp_syncstatus;
  // Member: swversion_major
  cdr << ros_message.swversion_major;
  // Member: swversion_minor
  cdr << ros_message.swversion_minor;
  // Member: swversion_patch
  cdr << ros_message.swversion_patch;
  // Member: longitudinal
  cdr << ros_message.longitudinal;
  // Member: lateral
  cdr << ros_message.lateral;
  // Member: vertical
  cdr << ros_message.vertical;
  // Member: yaw
  cdr << ros_message.yaw;
  // Member: pitch
  cdr << ros_message.pitch;
  // Member: plugorientation
  cdr << ros_message.plugorientation;
  // Member: length
  cdr << ros_message.length;
  // Member: width
  cdr << ros_message.width;
  // Member: height
  cdr << ros_message.height;
  // Member: wheelbase
  cdr << ros_message.wheelbase;
  // Member: maximumdistance
  cdr << ros_message.maximumdistance;
  // Member: frequencyslot
  cdr << ros_message.frequencyslot;
  // Member: cycletime
  cdr << ros_message.cycletime;
  // Member: timeslot
  cdr << ros_message.timeslot;
  // Member: hcc
  cdr << ros_message.hcc;
  // Member: powersave_standstill
  cdr << ros_message.powersave_standstill;
  // Member: sensoripaddress_0
  cdr << ros_message.sensoripaddress_0;
  // Member: sensoripaddress_1
  cdr << ros_message.sensoripaddress_1;
  // Member: configurationcounter
  cdr << ros_message.configurationcounter;
  // Member: status_longitudinalvelocity
  cdr << ros_message.status_longitudinalvelocity;
  // Member: status_longitudinalacceleration
  cdr << ros_message.status_longitudinalacceleration;
  // Member: status_lateralacceleration
  cdr << ros_message.status_lateralacceleration;
  // Member: status_yawrate
  cdr << ros_message.status_yawrate;
  // Member: status_steeringangle
  cdr << ros_message.status_steeringangle;
  // Member: status_drivingdirection
  cdr << ros_message.status_drivingdirection;
  // Member: status_characteristicspeed
  cdr << ros_message.status_characteristicspeed;
  // Member: status_radarstatus
  cdr << ros_message.status_radarstatus;
  // Member: status_voltagestatus
  cdr << ros_message.status_voltagestatus;
  // Member: status_temperaturestatus
  cdr << ros_message.status_temperaturestatus;
  // Member: status_blockagestatus
  cdr << ros_message.status_blockagestatus;
  return true;
}

bool
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_ars548_messages
cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  ars548_messages::msg::Status & ros_message)
{
  // Member: timestamp_nanoseconds
  cdr >> ros_message.timestamp_nanoseconds;

  // Member: timestamp_seconds
  cdr >> ros_message.timestamp_seconds;

  // Member: timestamp_syncstatus
  cdr >> ros_message.timestamp_syncstatus;

  // Member: swversion_major
  cdr >> ros_message.swversion_major;

  // Member: swversion_minor
  cdr >> ros_message.swversion_minor;

  // Member: swversion_patch
  cdr >> ros_message.swversion_patch;

  // Member: longitudinal
  cdr >> ros_message.longitudinal;

  // Member: lateral
  cdr >> ros_message.lateral;

  // Member: vertical
  cdr >> ros_message.vertical;

  // Member: yaw
  cdr >> ros_message.yaw;

  // Member: pitch
  cdr >> ros_message.pitch;

  // Member: plugorientation
  cdr >> ros_message.plugorientation;

  // Member: length
  cdr >> ros_message.length;

  // Member: width
  cdr >> ros_message.width;

  // Member: height
  cdr >> ros_message.height;

  // Member: wheelbase
  cdr >> ros_message.wheelbase;

  // Member: maximumdistance
  cdr >> ros_message.maximumdistance;

  // Member: frequencyslot
  cdr >> ros_message.frequencyslot;

  // Member: cycletime
  cdr >> ros_message.cycletime;

  // Member: timeslot
  cdr >> ros_message.timeslot;

  // Member: hcc
  cdr >> ros_message.hcc;

  // Member: powersave_standstill
  cdr >> ros_message.powersave_standstill;

  // Member: sensoripaddress_0
  cdr >> ros_message.sensoripaddress_0;

  // Member: sensoripaddress_1
  cdr >> ros_message.sensoripaddress_1;

  // Member: configurationcounter
  cdr >> ros_message.configurationcounter;

  // Member: status_longitudinalvelocity
  cdr >> ros_message.status_longitudinalvelocity;

  // Member: status_longitudinalacceleration
  cdr >> ros_message.status_longitudinalacceleration;

  // Member: status_lateralacceleration
  cdr >> ros_message.status_lateralacceleration;

  // Member: status_yawrate
  cdr >> ros_message.status_yawrate;

  // Member: status_steeringangle
  cdr >> ros_message.status_steeringangle;

  // Member: status_drivingdirection
  cdr >> ros_message.status_drivingdirection;

  // Member: status_characteristicspeed
  cdr >> ros_message.status_characteristicspeed;

  // Member: status_radarstatus
  cdr >> ros_message.status_radarstatus;

  // Member: status_voltagestatus
  cdr >> ros_message.status_voltagestatus;

  // Member: status_temperaturestatus
  cdr >> ros_message.status_temperaturestatus;

  // Member: status_blockagestatus
  cdr >> ros_message.status_blockagestatus;

  return true;
}

size_t
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_ars548_messages
get_serialized_size(
  const ars548_messages::msg::Status & ros_message,
  size_t current_alignment)
{
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  (void)padding;
  (void)wchar_size;

  // Member: timestamp_nanoseconds
  {
    size_t item_size = sizeof(ros_message.timestamp_nanoseconds);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: timestamp_seconds
  {
    size_t item_size = sizeof(ros_message.timestamp_seconds);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: timestamp_syncstatus
  {
    size_t item_size = sizeof(ros_message.timestamp_syncstatus);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: swversion_major
  {
    size_t item_size = sizeof(ros_message.swversion_major);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: swversion_minor
  {
    size_t item_size = sizeof(ros_message.swversion_minor);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: swversion_patch
  {
    size_t item_size = sizeof(ros_message.swversion_patch);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: longitudinal
  {
    size_t item_size = sizeof(ros_message.longitudinal);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: lateral
  {
    size_t item_size = sizeof(ros_message.lateral);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: vertical
  {
    size_t item_size = sizeof(ros_message.vertical);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: yaw
  {
    size_t item_size = sizeof(ros_message.yaw);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: pitch
  {
    size_t item_size = sizeof(ros_message.pitch);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: plugorientation
  {
    size_t item_size = sizeof(ros_message.plugorientation);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: length
  {
    size_t item_size = sizeof(ros_message.length);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: width
  {
    size_t item_size = sizeof(ros_message.width);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: height
  {
    size_t item_size = sizeof(ros_message.height);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: wheelbase
  {
    size_t item_size = sizeof(ros_message.wheelbase);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: maximumdistance
  {
    size_t item_size = sizeof(ros_message.maximumdistance);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: frequencyslot
  {
    size_t item_size = sizeof(ros_message.frequencyslot);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: cycletime
  {
    size_t item_size = sizeof(ros_message.cycletime);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: timeslot
  {
    size_t item_size = sizeof(ros_message.timeslot);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: hcc
  {
    size_t item_size = sizeof(ros_message.hcc);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: powersave_standstill
  {
    size_t item_size = sizeof(ros_message.powersave_standstill);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: sensoripaddress_0
  {
    size_t item_size = sizeof(ros_message.sensoripaddress_0);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: sensoripaddress_1
  {
    size_t item_size = sizeof(ros_message.sensoripaddress_1);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: configurationcounter
  {
    size_t item_size = sizeof(ros_message.configurationcounter);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: status_longitudinalvelocity
  {
    size_t item_size = sizeof(ros_message.status_longitudinalvelocity);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: status_longitudinalacceleration
  {
    size_t item_size = sizeof(ros_message.status_longitudinalacceleration);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: status_lateralacceleration
  {
    size_t item_size = sizeof(ros_message.status_lateralacceleration);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: status_yawrate
  {
    size_t item_size = sizeof(ros_message.status_yawrate);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: status_steeringangle
  {
    size_t item_size = sizeof(ros_message.status_steeringangle);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: status_drivingdirection
  {
    size_t item_size = sizeof(ros_message.status_drivingdirection);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: status_characteristicspeed
  {
    size_t item_size = sizeof(ros_message.status_characteristicspeed);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: status_radarstatus
  {
    size_t item_size = sizeof(ros_message.status_radarstatus);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: status_voltagestatus
  {
    size_t item_size = sizeof(ros_message.status_voltagestatus);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: status_temperaturestatus
  {
    size_t item_size = sizeof(ros_message.status_temperaturestatus);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: status_blockagestatus
  {
    size_t item_size = sizeof(ros_message.status_blockagestatus);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }

  return current_alignment - initial_alignment;
}

size_t
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_ars548_messages
max_serialized_size_Status(
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


  // Member: timestamp_nanoseconds
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: timestamp_seconds
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: timestamp_syncstatus
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: swversion_major
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: swversion_minor
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: swversion_patch
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: longitudinal
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: lateral
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: vertical
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: yaw
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: pitch
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: plugorientation
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: length
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: width
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: height
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: wheelbase
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: maximumdistance
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint16_t);
    current_alignment += array_size * sizeof(uint16_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint16_t));
  }

  // Member: frequencyslot
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: cycletime
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: timeslot
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: hcc
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: powersave_standstill
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: sensoripaddress_0
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: sensoripaddress_1
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: configurationcounter
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: status_longitudinalvelocity
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: status_longitudinalacceleration
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: status_lateralacceleration
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: status_yawrate
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: status_steeringangle
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: status_drivingdirection
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: status_characteristicspeed
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: status_radarstatus
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: status_voltagestatus
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: status_temperaturestatus
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: status_blockagestatus
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
    using DataType = ars548_messages::msg::Status;
    is_plain =
      (
      offsetof(DataType, status_blockagestatus) +
      last_member_size
      ) == ret_val;
  }

  return ret_val;
}

static bool _Status__cdr_serialize(
  const void * untyped_ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  auto typed_message =
    static_cast<const ars548_messages::msg::Status *>(
    untyped_ros_message);
  return cdr_serialize(*typed_message, cdr);
}

static bool _Status__cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  void * untyped_ros_message)
{
  auto typed_message =
    static_cast<ars548_messages::msg::Status *>(
    untyped_ros_message);
  return cdr_deserialize(cdr, *typed_message);
}

static uint32_t _Status__get_serialized_size(
  const void * untyped_ros_message)
{
  auto typed_message =
    static_cast<const ars548_messages::msg::Status *>(
    untyped_ros_message);
  return static_cast<uint32_t>(get_serialized_size(*typed_message, 0));
}

static size_t _Status__max_serialized_size(char & bounds_info)
{
  bool full_bounded;
  bool is_plain;
  size_t ret_val;

  ret_val = max_serialized_size_Status(full_bounded, is_plain, 0);

  bounds_info =
    is_plain ? ROSIDL_TYPESUPPORT_FASTRTPS_PLAIN_TYPE :
    full_bounded ? ROSIDL_TYPESUPPORT_FASTRTPS_BOUNDED_TYPE : ROSIDL_TYPESUPPORT_FASTRTPS_UNBOUNDED_TYPE;
  return ret_val;
}

static message_type_support_callbacks_t _Status__callbacks = {
  "ars548_messages::msg",
  "Status",
  _Status__cdr_serialize,
  _Status__cdr_deserialize,
  _Status__get_serialized_size,
  _Status__max_serialized_size
};

static rosidl_message_type_support_t _Status__handle = {
  rosidl_typesupport_fastrtps_cpp::typesupport_identifier,
  &_Status__callbacks,
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
get_message_type_support_handle<ars548_messages::msg::Status>()
{
  return &ars548_messages::msg::typesupport_fastrtps_cpp::_Status__handle;
}

}  // namespace rosidl_typesupport_fastrtps_cpp

#ifdef __cplusplus
extern "C"
{
#endif

const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_cpp, ars548_messages, msg, Status)() {
  return &ars548_messages::msg::typesupport_fastrtps_cpp::_Status__handle;
}

#ifdef __cplusplus
}
#endif
