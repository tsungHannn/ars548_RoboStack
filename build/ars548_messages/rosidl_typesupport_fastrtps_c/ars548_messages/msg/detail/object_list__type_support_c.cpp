// generated from rosidl_typesupport_fastrtps_c/resource/idl__type_support_c.cpp.em
// with input from ars548_messages:msg/ObjectList.idl
// generated code does not contain a copyright notice
#include "ars548_messages/msg/detail/object_list__rosidl_typesupport_fastrtps_c.h"


#include <cassert>
#include <limits>
#include <string>
#include "rosidl_typesupport_fastrtps_c/identifier.h"
#include "rosidl_typesupport_fastrtps_c/wstring_conversion.hpp"
#include "rosidl_typesupport_fastrtps_cpp/message_type_support.h"
#include "ars548_messages/msg/rosidl_typesupport_fastrtps_c__visibility_control.h"
#include "ars548_messages/msg/detail/object_list__struct.h"
#include "ars548_messages/msg/detail/object_list__functions.h"
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

#include "ars548_messages/msg/detail/object__functions.h"  // objectlist_objects
#include "std_msgs/msg/detail/header__functions.h"  // header

// forward declare type support functions
size_t get_serialized_size_ars548_messages__msg__Object(
  const void * untyped_ros_message,
  size_t current_alignment);

size_t max_serialized_size_ars548_messages__msg__Object(
  bool & full_bounded,
  bool & is_plain,
  size_t current_alignment);

const rosidl_message_type_support_t *
  ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_c, ars548_messages, msg, Object)();
ROSIDL_TYPESUPPORT_FASTRTPS_C_IMPORT_ars548_messages
size_t get_serialized_size_std_msgs__msg__Header(
  const void * untyped_ros_message,
  size_t current_alignment);

ROSIDL_TYPESUPPORT_FASTRTPS_C_IMPORT_ars548_messages
size_t max_serialized_size_std_msgs__msg__Header(
  bool & full_bounded,
  bool & is_plain,
  size_t current_alignment);

ROSIDL_TYPESUPPORT_FASTRTPS_C_IMPORT_ars548_messages
const rosidl_message_type_support_t *
  ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_c, std_msgs, msg, Header)();


using _ObjectList__ros_msg_type = ars548_messages__msg__ObjectList;

static bool _ObjectList__cdr_serialize(
  const void * untyped_ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  if (!untyped_ros_message) {
    fprintf(stderr, "ros message handle is null\n");
    return false;
  }
  const _ObjectList__ros_msg_type * ros_message = static_cast<const _ObjectList__ros_msg_type *>(untyped_ros_message);
  // Field name: header
  {
    const message_type_support_callbacks_t * callbacks =
      static_cast<const message_type_support_callbacks_t *>(
      ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(
        rosidl_typesupport_fastrtps_c, std_msgs, msg, Header
      )()->data);
    if (!callbacks->cdr_serialize(
        &ros_message->header, cdr))
    {
      return false;
    }
  }

  // Field name: crc
  {
    cdr << ros_message->crc;
  }

  // Field name: length
  {
    cdr << ros_message->length;
  }

  // Field name: sqc
  {
    cdr << ros_message->sqc;
  }

  // Field name: dataid
  {
    cdr << ros_message->dataid;
  }

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

  // Field name: eventdataqualifier
  {
    cdr << ros_message->eventdataqualifier;
  }

  // Field name: extendedqualifier
  {
    cdr << ros_message->extendedqualifier;
  }

  // Field name: objectlist_numofobjects
  {
    cdr << ros_message->objectlist_numofobjects;
  }

  // Field name: objectlist_objects
  {
    const message_type_support_callbacks_t * callbacks =
      static_cast<const message_type_support_callbacks_t *>(
      ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(
        rosidl_typesupport_fastrtps_c, ars548_messages, msg, Object
      )()->data);
    size_t size = 50;
    auto array_ptr = ros_message->objectlist_objects;
    for (size_t i = 0; i < size; ++i) {
      if (!callbacks->cdr_serialize(
          &array_ptr[i], cdr))
      {
        return false;
      }
    }
  }

  return true;
}

static bool _ObjectList__cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  void * untyped_ros_message)
{
  if (!untyped_ros_message) {
    fprintf(stderr, "ros message handle is null\n");
    return false;
  }
  _ObjectList__ros_msg_type * ros_message = static_cast<_ObjectList__ros_msg_type *>(untyped_ros_message);
  // Field name: header
  {
    const message_type_support_callbacks_t * callbacks =
      static_cast<const message_type_support_callbacks_t *>(
      ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(
        rosidl_typesupport_fastrtps_c, std_msgs, msg, Header
      )()->data);
    if (!callbacks->cdr_deserialize(
        cdr, &ros_message->header))
    {
      return false;
    }
  }

  // Field name: crc
  {
    cdr >> ros_message->crc;
  }

  // Field name: length
  {
    cdr >> ros_message->length;
  }

  // Field name: sqc
  {
    cdr >> ros_message->sqc;
  }

  // Field name: dataid
  {
    cdr >> ros_message->dataid;
  }

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

  // Field name: eventdataqualifier
  {
    cdr >> ros_message->eventdataqualifier;
  }

  // Field name: extendedqualifier
  {
    cdr >> ros_message->extendedqualifier;
  }

  // Field name: objectlist_numofobjects
  {
    cdr >> ros_message->objectlist_numofobjects;
  }

  // Field name: objectlist_objects
  {
    const message_type_support_callbacks_t * callbacks =
      static_cast<const message_type_support_callbacks_t *>(
      ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(
        rosidl_typesupport_fastrtps_c, ars548_messages, msg, Object
      )()->data);
    size_t size = 50;
    auto array_ptr = ros_message->objectlist_objects;
    for (size_t i = 0; i < size; ++i) {
      if (!callbacks->cdr_deserialize(
          cdr, &array_ptr[i]))
      {
        return false;
      }
    }
  }

  return true;
}  // NOLINT(readability/fn_size)

ROSIDL_TYPESUPPORT_FASTRTPS_C_PUBLIC_ars548_messages
size_t get_serialized_size_ars548_messages__msg__ObjectList(
  const void * untyped_ros_message,
  size_t current_alignment)
{
  const _ObjectList__ros_msg_type * ros_message = static_cast<const _ObjectList__ros_msg_type *>(untyped_ros_message);
  (void)ros_message;
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  (void)padding;
  (void)wchar_size;

  // field.name header

  current_alignment += get_serialized_size_std_msgs__msg__Header(
    &(ros_message->header), current_alignment);
  // field.name crc
  {
    size_t item_size = sizeof(ros_message->crc);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name length
  {
    size_t item_size = sizeof(ros_message->length);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name sqc
  {
    size_t item_size = sizeof(ros_message->sqc);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name dataid
  {
    size_t item_size = sizeof(ros_message->dataid);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
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
  // field.name eventdataqualifier
  {
    size_t item_size = sizeof(ros_message->eventdataqualifier);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name extendedqualifier
  {
    size_t item_size = sizeof(ros_message->extendedqualifier);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name objectlist_numofobjects
  {
    size_t item_size = sizeof(ros_message->objectlist_numofobjects);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name objectlist_objects
  {
    size_t array_size = 50;
    auto array_ptr = ros_message->objectlist_objects;

    for (size_t index = 0; index < array_size; ++index) {
      current_alignment += get_serialized_size_ars548_messages__msg__Object(
        &array_ptr[index], current_alignment);
    }
  }

  return current_alignment - initial_alignment;
}

static uint32_t _ObjectList__get_serialized_size(const void * untyped_ros_message)
{
  return static_cast<uint32_t>(
    get_serialized_size_ars548_messages__msg__ObjectList(
      untyped_ros_message, 0));
}

ROSIDL_TYPESUPPORT_FASTRTPS_C_PUBLIC_ars548_messages
size_t max_serialized_size_ars548_messages__msg__ObjectList(
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

  // member: header
  {
    size_t array_size = 1;


    last_member_size = 0;
    for (size_t index = 0; index < array_size; ++index) {
      bool inner_full_bounded;
      bool inner_is_plain;
      size_t inner_size;
      inner_size =
        max_serialized_size_std_msgs__msg__Header(
        inner_full_bounded, inner_is_plain, current_alignment);
      last_member_size += inner_size;
      current_alignment += inner_size;
      full_bounded &= inner_full_bounded;
      is_plain &= inner_is_plain;
    }
  }
  // member: crc
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint64_t);
    current_alignment += array_size * sizeof(uint64_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint64_t));
  }
  // member: length
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: sqc
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: dataid
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
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
  // member: eventdataqualifier
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: extendedqualifier
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: objectlist_numofobjects
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: objectlist_objects
  {
    size_t array_size = 50;


    last_member_size = 0;
    for (size_t index = 0; index < array_size; ++index) {
      bool inner_full_bounded;
      bool inner_is_plain;
      size_t inner_size;
      inner_size =
        max_serialized_size_ars548_messages__msg__Object(
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
    using DataType = ars548_messages__msg__ObjectList;
    is_plain =
      (
      offsetof(DataType, objectlist_objects) +
      last_member_size
      ) == ret_val;
  }

  return ret_val;
}

static size_t _ObjectList__max_serialized_size(char & bounds_info)
{
  bool full_bounded;
  bool is_plain;
  size_t ret_val;

  ret_val = max_serialized_size_ars548_messages__msg__ObjectList(
    full_bounded, is_plain, 0);

  bounds_info =
    is_plain ? ROSIDL_TYPESUPPORT_FASTRTPS_PLAIN_TYPE :
    full_bounded ? ROSIDL_TYPESUPPORT_FASTRTPS_BOUNDED_TYPE : ROSIDL_TYPESUPPORT_FASTRTPS_UNBOUNDED_TYPE;
  return ret_val;
}


static message_type_support_callbacks_t __callbacks_ObjectList = {
  "ars548_messages::msg",
  "ObjectList",
  _ObjectList__cdr_serialize,
  _ObjectList__cdr_deserialize,
  _ObjectList__get_serialized_size,
  _ObjectList__max_serialized_size
};

static rosidl_message_type_support_t _ObjectList__type_support = {
  rosidl_typesupport_fastrtps_c__identifier,
  &__callbacks_ObjectList,
  get_message_typesupport_handle_function,
};

const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_c, ars548_messages, msg, ObjectList)() {
  return &_ObjectList__type_support;
}

#if defined(__cplusplus)
}
#endif
