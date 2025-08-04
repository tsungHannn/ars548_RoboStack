// generated from rosidl_typesupport_fastrtps_cpp/resource/idl__type_support.cpp.em
// with input from ars548_messages:msg/ObjectList.idl
// generated code does not contain a copyright notice
#include "ars548_messages/msg/detail/object_list__rosidl_typesupport_fastrtps_cpp.hpp"
#include "ars548_messages/msg/detail/object_list__struct.hpp"

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
namespace std_msgs
{
namespace msg
{
namespace typesupport_fastrtps_cpp
{
bool cdr_serialize(
  const std_msgs::msg::Header &,
  eprosima::fastcdr::Cdr &);
bool cdr_deserialize(
  eprosima::fastcdr::Cdr &,
  std_msgs::msg::Header &);
size_t get_serialized_size(
  const std_msgs::msg::Header &,
  size_t current_alignment);
size_t
max_serialized_size_Header(
  bool & full_bounded,
  bool & is_plain,
  size_t current_alignment);
}  // namespace typesupport_fastrtps_cpp
}  // namespace msg
}  // namespace std_msgs

namespace ars548_messages
{
namespace msg
{
namespace typesupport_fastrtps_cpp
{
bool cdr_serialize(
  const ars548_messages::msg::Object &,
  eprosima::fastcdr::Cdr &);
bool cdr_deserialize(
  eprosima::fastcdr::Cdr &,
  ars548_messages::msg::Object &);
size_t get_serialized_size(
  const ars548_messages::msg::Object &,
  size_t current_alignment);
size_t
max_serialized_size_Object(
  bool & full_bounded,
  bool & is_plain,
  size_t current_alignment);
}  // namespace typesupport_fastrtps_cpp
}  // namespace msg
}  // namespace ars548_messages


namespace ars548_messages
{

namespace msg
{

namespace typesupport_fastrtps_cpp
{

bool
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_ars548_messages
cdr_serialize(
  const ars548_messages::msg::ObjectList & ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  // Member: header
  std_msgs::msg::typesupport_fastrtps_cpp::cdr_serialize(
    ros_message.header,
    cdr);
  // Member: crc
  cdr << ros_message.crc;
  // Member: length
  cdr << ros_message.length;
  // Member: sqc
  cdr << ros_message.sqc;
  // Member: dataid
  cdr << ros_message.dataid;
  // Member: timestamp_nanoseconds
  cdr << ros_message.timestamp_nanoseconds;
  // Member: timestamp_seconds
  cdr << ros_message.timestamp_seconds;
  // Member: timestamp_syncstatus
  cdr << ros_message.timestamp_syncstatus;
  // Member: eventdataqualifier
  cdr << ros_message.eventdataqualifier;
  // Member: extendedqualifier
  cdr << ros_message.extendedqualifier;
  // Member: objectlist_numofobjects
  cdr << ros_message.objectlist_numofobjects;
  // Member: objectlist_objects
  {
    for (size_t i = 0; i < 50; i++) {
      ars548_messages::msg::typesupport_fastrtps_cpp::cdr_serialize(
        ros_message.objectlist_objects[i],
        cdr);
    }
  }
  return true;
}

bool
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_ars548_messages
cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  ars548_messages::msg::ObjectList & ros_message)
{
  // Member: header
  std_msgs::msg::typesupport_fastrtps_cpp::cdr_deserialize(
    cdr, ros_message.header);

  // Member: crc
  cdr >> ros_message.crc;

  // Member: length
  cdr >> ros_message.length;

  // Member: sqc
  cdr >> ros_message.sqc;

  // Member: dataid
  cdr >> ros_message.dataid;

  // Member: timestamp_nanoseconds
  cdr >> ros_message.timestamp_nanoseconds;

  // Member: timestamp_seconds
  cdr >> ros_message.timestamp_seconds;

  // Member: timestamp_syncstatus
  cdr >> ros_message.timestamp_syncstatus;

  // Member: eventdataqualifier
  cdr >> ros_message.eventdataqualifier;

  // Member: extendedqualifier
  cdr >> ros_message.extendedqualifier;

  // Member: objectlist_numofobjects
  cdr >> ros_message.objectlist_numofobjects;

  // Member: objectlist_objects
  {
    for (size_t i = 0; i < 50; i++) {
      ars548_messages::msg::typesupport_fastrtps_cpp::cdr_deserialize(
        cdr,
        ros_message.objectlist_objects[i]);
    }
  }

  return true;
}

size_t
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_ars548_messages
get_serialized_size(
  const ars548_messages::msg::ObjectList & ros_message,
  size_t current_alignment)
{
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  (void)padding;
  (void)wchar_size;

  // Member: header

  current_alignment +=
    std_msgs::msg::typesupport_fastrtps_cpp::get_serialized_size(
    ros_message.header, current_alignment);
  // Member: crc
  {
    size_t item_size = sizeof(ros_message.crc);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: length
  {
    size_t item_size = sizeof(ros_message.length);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: sqc
  {
    size_t item_size = sizeof(ros_message.sqc);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: dataid
  {
    size_t item_size = sizeof(ros_message.dataid);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
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
  // Member: eventdataqualifier
  {
    size_t item_size = sizeof(ros_message.eventdataqualifier);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: extendedqualifier
  {
    size_t item_size = sizeof(ros_message.extendedqualifier);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: objectlist_numofobjects
  {
    size_t item_size = sizeof(ros_message.objectlist_numofobjects);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: objectlist_objects
  {
    size_t array_size = 50;

    for (size_t index = 0; index < array_size; ++index) {
      current_alignment +=
        ars548_messages::msg::typesupport_fastrtps_cpp::get_serialized_size(
        ros_message.objectlist_objects[index], current_alignment);
    }
  }

  return current_alignment - initial_alignment;
}

size_t
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_ars548_messages
max_serialized_size_ObjectList(
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


  // Member: header
  {
    size_t array_size = 1;


    last_member_size = 0;
    for (size_t index = 0; index < array_size; ++index) {
      bool inner_full_bounded;
      bool inner_is_plain;
      size_t inner_size =
        std_msgs::msg::typesupport_fastrtps_cpp::max_serialized_size_Header(
        inner_full_bounded, inner_is_plain, current_alignment);
      last_member_size += inner_size;
      current_alignment += inner_size;
      full_bounded &= inner_full_bounded;
      is_plain &= inner_is_plain;
    }
  }

  // Member: crc
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint64_t);
    current_alignment += array_size * sizeof(uint64_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint64_t));
  }

  // Member: length
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: sqc
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: dataid
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

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

  // Member: eventdataqualifier
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: extendedqualifier
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: objectlist_numofobjects
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: objectlist_objects
  {
    size_t array_size = 50;


    last_member_size = 0;
    for (size_t index = 0; index < array_size; ++index) {
      bool inner_full_bounded;
      bool inner_is_plain;
      size_t inner_size =
        ars548_messages::msg::typesupport_fastrtps_cpp::max_serialized_size_Object(
        inner_full_bounded, inner_is_plain, current_alignment);
      last_member_size += inner_size;
      current_alignment += inner_size;
      full_bounded &= inner_full_bounded;
      is_plain &= inner_is_plain;
    }
  }

  size_t ret_val = current_alignment - initial_alignment;
  if (is_plain) {
    // All members are plain, and type is not empty.
    // We still need to check that the in-memory alignment
    // is the same as the CDR mandated alignment.
    using DataType = ars548_messages::msg::ObjectList;
    is_plain =
      (
      offsetof(DataType, objectlist_objects) +
      last_member_size
      ) == ret_val;
  }

  return ret_val;
}

static bool _ObjectList__cdr_serialize(
  const void * untyped_ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  auto typed_message =
    static_cast<const ars548_messages::msg::ObjectList *>(
    untyped_ros_message);
  return cdr_serialize(*typed_message, cdr);
}

static bool _ObjectList__cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  void * untyped_ros_message)
{
  auto typed_message =
    static_cast<ars548_messages::msg::ObjectList *>(
    untyped_ros_message);
  return cdr_deserialize(cdr, *typed_message);
}

static uint32_t _ObjectList__get_serialized_size(
  const void * untyped_ros_message)
{
  auto typed_message =
    static_cast<const ars548_messages::msg::ObjectList *>(
    untyped_ros_message);
  return static_cast<uint32_t>(get_serialized_size(*typed_message, 0));
}

static size_t _ObjectList__max_serialized_size(char & bounds_info)
{
  bool full_bounded;
  bool is_plain;
  size_t ret_val;

  ret_val = max_serialized_size_ObjectList(full_bounded, is_plain, 0);

  bounds_info =
    is_plain ? ROSIDL_TYPESUPPORT_FASTRTPS_PLAIN_TYPE :
    full_bounded ? ROSIDL_TYPESUPPORT_FASTRTPS_BOUNDED_TYPE : ROSIDL_TYPESUPPORT_FASTRTPS_UNBOUNDED_TYPE;
  return ret_val;
}

static message_type_support_callbacks_t _ObjectList__callbacks = {
  "ars548_messages::msg",
  "ObjectList",
  _ObjectList__cdr_serialize,
  _ObjectList__cdr_deserialize,
  _ObjectList__get_serialized_size,
  _ObjectList__max_serialized_size
};

static rosidl_message_type_support_t _ObjectList__handle = {
  rosidl_typesupport_fastrtps_cpp::typesupport_identifier,
  &_ObjectList__callbacks,
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
get_message_type_support_handle<ars548_messages::msg::ObjectList>()
{
  return &ars548_messages::msg::typesupport_fastrtps_cpp::_ObjectList__handle;
}

}  // namespace rosidl_typesupport_fastrtps_cpp

#ifdef __cplusplus
extern "C"
{
#endif

const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_cpp, ars548_messages, msg, ObjectList)() {
  return &ars548_messages::msg::typesupport_fastrtps_cpp::_ObjectList__handle;
}

#ifdef __cplusplus
}
#endif
