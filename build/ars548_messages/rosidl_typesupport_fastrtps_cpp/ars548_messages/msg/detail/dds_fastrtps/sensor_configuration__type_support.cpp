// generated from rosidl_typesupport_fastrtps_cpp/resource/idl__type_support.cpp.em
// with input from ars548_messages:msg/SensorConfiguration.idl
// generated code does not contain a copyright notice
#include "ars548_messages/msg/detail/sensor_configuration__rosidl_typesupport_fastrtps_cpp.hpp"
#include "ars548_messages/msg/detail/sensor_configuration__struct.hpp"

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
  const ars548_messages::msg::SensorConfiguration & ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
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
  // Member: frequencslot
  cdr << ros_message.frequencslot;
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
  // Member: newsensormounting
  cdr << ros_message.newsensormounting;
  // Member: newvehicleparameters
  cdr << ros_message.newvehicleparameters;
  // Member: newradarparameters
  cdr << ros_message.newradarparameters;
  // Member: newnetworkconfiguration
  cdr << ros_message.newnetworkconfiguration;
  return true;
}

bool
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_ars548_messages
cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  ars548_messages::msg::SensorConfiguration & ros_message)
{
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

  // Member: frequencslot
  cdr >> ros_message.frequencslot;

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

  // Member: newsensormounting
  cdr >> ros_message.newsensormounting;

  // Member: newvehicleparameters
  cdr >> ros_message.newvehicleparameters;

  // Member: newradarparameters
  cdr >> ros_message.newradarparameters;

  // Member: newnetworkconfiguration
  cdr >> ros_message.newnetworkconfiguration;

  return true;
}

size_t
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_ars548_messages
get_serialized_size(
  const ars548_messages::msg::SensorConfiguration & ros_message,
  size_t current_alignment)
{
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  (void)padding;
  (void)wchar_size;

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
  // Member: frequencslot
  {
    size_t item_size = sizeof(ros_message.frequencslot);
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
  // Member: newsensormounting
  {
    size_t item_size = sizeof(ros_message.newsensormounting);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: newvehicleparameters
  {
    size_t item_size = sizeof(ros_message.newvehicleparameters);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: newradarparameters
  {
    size_t item_size = sizeof(ros_message.newradarparameters);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: newnetworkconfiguration
  {
    size_t item_size = sizeof(ros_message.newnetworkconfiguration);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }

  return current_alignment - initial_alignment;
}

size_t
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_ars548_messages
max_serialized_size_SensorConfiguration(
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

  // Member: frequencslot
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

  // Member: newsensormounting
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: newvehicleparameters
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: newradarparameters
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: newnetworkconfiguration
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
    using DataType = ars548_messages::msg::SensorConfiguration;
    is_plain =
      (
      offsetof(DataType, newnetworkconfiguration) +
      last_member_size
      ) == ret_val;
  }

  return ret_val;
}

static bool _SensorConfiguration__cdr_serialize(
  const void * untyped_ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  auto typed_message =
    static_cast<const ars548_messages::msg::SensorConfiguration *>(
    untyped_ros_message);
  return cdr_serialize(*typed_message, cdr);
}

static bool _SensorConfiguration__cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  void * untyped_ros_message)
{
  auto typed_message =
    static_cast<ars548_messages::msg::SensorConfiguration *>(
    untyped_ros_message);
  return cdr_deserialize(cdr, *typed_message);
}

static uint32_t _SensorConfiguration__get_serialized_size(
  const void * untyped_ros_message)
{
  auto typed_message =
    static_cast<const ars548_messages::msg::SensorConfiguration *>(
    untyped_ros_message);
  return static_cast<uint32_t>(get_serialized_size(*typed_message, 0));
}

static size_t _SensorConfiguration__max_serialized_size(char & bounds_info)
{
  bool full_bounded;
  bool is_plain;
  size_t ret_val;

  ret_val = max_serialized_size_SensorConfiguration(full_bounded, is_plain, 0);

  bounds_info =
    is_plain ? ROSIDL_TYPESUPPORT_FASTRTPS_PLAIN_TYPE :
    full_bounded ? ROSIDL_TYPESUPPORT_FASTRTPS_BOUNDED_TYPE : ROSIDL_TYPESUPPORT_FASTRTPS_UNBOUNDED_TYPE;
  return ret_val;
}

static message_type_support_callbacks_t _SensorConfiguration__callbacks = {
  "ars548_messages::msg",
  "SensorConfiguration",
  _SensorConfiguration__cdr_serialize,
  _SensorConfiguration__cdr_deserialize,
  _SensorConfiguration__get_serialized_size,
  _SensorConfiguration__max_serialized_size
};

static rosidl_message_type_support_t _SensorConfiguration__handle = {
  rosidl_typesupport_fastrtps_cpp::typesupport_identifier,
  &_SensorConfiguration__callbacks,
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
get_message_type_support_handle<ars548_messages::msg::SensorConfiguration>()
{
  return &ars548_messages::msg::typesupport_fastrtps_cpp::_SensorConfiguration__handle;
}

}  // namespace rosidl_typesupport_fastrtps_cpp

#ifdef __cplusplus
extern "C"
{
#endif

const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_cpp, ars548_messages, msg, SensorConfiguration)() {
  return &ars548_messages::msg::typesupport_fastrtps_cpp::_SensorConfiguration__handle;
}

#ifdef __cplusplus
}
#endif
