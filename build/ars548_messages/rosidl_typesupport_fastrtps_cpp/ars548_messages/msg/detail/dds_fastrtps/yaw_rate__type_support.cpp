// generated from rosidl_typesupport_fastrtps_cpp/resource/idl__type_support.cpp.em
// with input from ars548_messages:msg/YawRate.idl
// generated code does not contain a copyright notice
#include "ars548_messages/msg/detail/yaw_rate__rosidl_typesupport_fastrtps_cpp.hpp"
#include "ars548_messages/msg/detail/yaw_rate__struct.hpp"

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
  const ars548_messages::msg::YawRate & ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  // Member: yawrateerramp
  cdr << ros_message.yawrateerramp;
  // Member: yawrateerramp_invalidflag
  cdr << ros_message.yawrateerramp_invalidflag;
  // Member: qualifieryawrate
  cdr << ros_message.qualifieryawrate;
  // Member: yawrate
  cdr << ros_message.yawrate;
  // Member: yawrate_invalidflag
  cdr << ros_message.yawrate_invalidflag;
  // Member: yawrateeventdataqualifier
  cdr << ros_message.yawrateeventdataqualifier;
  return true;
}

bool
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_ars548_messages
cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  ars548_messages::msg::YawRate & ros_message)
{
  // Member: yawrateerramp
  cdr >> ros_message.yawrateerramp;

  // Member: yawrateerramp_invalidflag
  cdr >> ros_message.yawrateerramp_invalidflag;

  // Member: qualifieryawrate
  cdr >> ros_message.qualifieryawrate;

  // Member: yawrate
  cdr >> ros_message.yawrate;

  // Member: yawrate_invalidflag
  cdr >> ros_message.yawrate_invalidflag;

  // Member: yawrateeventdataqualifier
  cdr >> ros_message.yawrateeventdataqualifier;

  return true;
}

size_t
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_ars548_messages
get_serialized_size(
  const ars548_messages::msg::YawRate & ros_message,
  size_t current_alignment)
{
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  (void)padding;
  (void)wchar_size;

  // Member: yawrateerramp
  {
    size_t item_size = sizeof(ros_message.yawrateerramp);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: yawrateerramp_invalidflag
  {
    size_t item_size = sizeof(ros_message.yawrateerramp_invalidflag);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: qualifieryawrate
  {
    size_t item_size = sizeof(ros_message.qualifieryawrate);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: yawrate
  {
    size_t item_size = sizeof(ros_message.yawrate);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: yawrate_invalidflag
  {
    size_t item_size = sizeof(ros_message.yawrate_invalidflag);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: yawrateeventdataqualifier
  {
    size_t item_size = sizeof(ros_message.yawrateeventdataqualifier);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }

  return current_alignment - initial_alignment;
}

size_t
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_ars548_messages
max_serialized_size_YawRate(
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


  // Member: yawrateerramp
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: yawrateerramp_invalidflag
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: qualifieryawrate
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: yawrate
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: yawrate_invalidflag
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: yawrateeventdataqualifier
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
    using DataType = ars548_messages::msg::YawRate;
    is_plain =
      (
      offsetof(DataType, yawrateeventdataqualifier) +
      last_member_size
      ) == ret_val;
  }

  return ret_val;
}

static bool _YawRate__cdr_serialize(
  const void * untyped_ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  auto typed_message =
    static_cast<const ars548_messages::msg::YawRate *>(
    untyped_ros_message);
  return cdr_serialize(*typed_message, cdr);
}

static bool _YawRate__cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  void * untyped_ros_message)
{
  auto typed_message =
    static_cast<ars548_messages::msg::YawRate *>(
    untyped_ros_message);
  return cdr_deserialize(cdr, *typed_message);
}

static uint32_t _YawRate__get_serialized_size(
  const void * untyped_ros_message)
{
  auto typed_message =
    static_cast<const ars548_messages::msg::YawRate *>(
    untyped_ros_message);
  return static_cast<uint32_t>(get_serialized_size(*typed_message, 0));
}

static size_t _YawRate__max_serialized_size(char & bounds_info)
{
  bool full_bounded;
  bool is_plain;
  size_t ret_val;

  ret_val = max_serialized_size_YawRate(full_bounded, is_plain, 0);

  bounds_info =
    is_plain ? ROSIDL_TYPESUPPORT_FASTRTPS_PLAIN_TYPE :
    full_bounded ? ROSIDL_TYPESUPPORT_FASTRTPS_BOUNDED_TYPE : ROSIDL_TYPESUPPORT_FASTRTPS_UNBOUNDED_TYPE;
  return ret_val;
}

static message_type_support_callbacks_t _YawRate__callbacks = {
  "ars548_messages::msg",
  "YawRate",
  _YawRate__cdr_serialize,
  _YawRate__cdr_deserialize,
  _YawRate__get_serialized_size,
  _YawRate__max_serialized_size
};

static rosidl_message_type_support_t _YawRate__handle = {
  rosidl_typesupport_fastrtps_cpp::typesupport_identifier,
  &_YawRate__callbacks,
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
get_message_type_support_handle<ars548_messages::msg::YawRate>()
{
  return &ars548_messages::msg::typesupport_fastrtps_cpp::_YawRate__handle;
}

}  // namespace rosidl_typesupport_fastrtps_cpp

#ifdef __cplusplus
extern "C"
{
#endif

const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_cpp, ars548_messages, msg, YawRate)() {
  return &ars548_messages::msg::typesupport_fastrtps_cpp::_YawRate__handle;
}

#ifdef __cplusplus
}
#endif
