// generated from rosidl_typesupport_fastrtps_c/resource/idl__type_support_c.cpp.em
// with input from ars548_messages:msg/DetectionList.idl
// generated code does not contain a copyright notice
#include "ars548_messages/msg/detail/detection_list__rosidl_typesupport_fastrtps_c.h"


#include <cassert>
#include <limits>
#include <string>
#include "rosidl_typesupport_fastrtps_c/identifier.h"
#include "rosidl_typesupport_fastrtps_c/wstring_conversion.hpp"
#include "rosidl_typesupport_fastrtps_cpp/message_type_support.h"
#include "ars548_messages/msg/rosidl_typesupport_fastrtps_c__visibility_control.h"
#include "ars548_messages/msg/detail/detection_list__struct.h"
#include "ars548_messages/msg/detail/detection_list__functions.h"
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

#include "ars548_messages/msg/detail/detection__functions.h"  // list_detections
#include "std_msgs/msg/detail/header__functions.h"  // header

// forward declare type support functions
size_t get_serialized_size_ars548_messages__msg__Detection(
  const void * untyped_ros_message,
  size_t current_alignment);

size_t max_serialized_size_ars548_messages__msg__Detection(
  bool & full_bounded,
  bool & is_plain,
  size_t current_alignment);

const rosidl_message_type_support_t *
  ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_c, ars548_messages, msg, Detection)();
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


using _DetectionList__ros_msg_type = ars548_messages__msg__DetectionList;

static bool _DetectionList__cdr_serialize(
  const void * untyped_ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  if (!untyped_ros_message) {
    fprintf(stderr, "ros message handle is null\n");
    return false;
  }
  const _DetectionList__ros_msg_type * ros_message = static_cast<const _DetectionList__ros_msg_type *>(untyped_ros_message);
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

  // Field name: origin_invalidflags
  {
    cdr << ros_message->origin_invalidflags;
  }

  // Field name: origin_xpos
  {
    cdr << ros_message->origin_xpos;
  }

  // Field name: origin_xstd
  {
    cdr << ros_message->origin_xstd;
  }

  // Field name: origin_ypos
  {
    cdr << ros_message->origin_ypos;
  }

  // Field name: origin_ystd
  {
    cdr << ros_message->origin_ystd;
  }

  // Field name: origin_zpos
  {
    cdr << ros_message->origin_zpos;
  }

  // Field name: origin_zstd
  {
    cdr << ros_message->origin_zstd;
  }

  // Field name: origin_roll
  {
    cdr << ros_message->origin_roll;
  }

  // Field name: origin_rollstd
  {
    cdr << ros_message->origin_rollstd;
  }

  // Field name: origin_pitch
  {
    cdr << ros_message->origin_pitch;
  }

  // Field name: origin_pitchstd
  {
    cdr << ros_message->origin_pitchstd;
  }

  // Field name: origin_yaw
  {
    cdr << ros_message->origin_yaw;
  }

  // Field name: origin_yawstd
  {
    cdr << ros_message->origin_yawstd;
  }

  // Field name: list_invalidflags
  {
    cdr << ros_message->list_invalidflags;
  }

  // Field name: list_detections
  {
    const message_type_support_callbacks_t * callbacks =
      static_cast<const message_type_support_callbacks_t *>(
      ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(
        rosidl_typesupport_fastrtps_c, ars548_messages, msg, Detection
      )()->data);
    size_t size = 800;
    auto array_ptr = ros_message->list_detections;
    for (size_t i = 0; i < size; ++i) {
      if (!callbacks->cdr_serialize(
          &array_ptr[i], cdr))
      {
        return false;
      }
    }
  }

  // Field name: list_radveldomain_min
  {
    cdr << ros_message->list_radveldomain_min;
  }

  // Field name: list_radveldomain_max
  {
    cdr << ros_message->list_radveldomain_max;
  }

  // Field name: list_numofdetections
  {
    cdr << ros_message->list_numofdetections;
  }

  // Field name: aln_azimuthcorrection
  {
    cdr << ros_message->aln_azimuthcorrection;
  }

  // Field name: aln_elevationcorrection
  {
    cdr << ros_message->aln_elevationcorrection;
  }

  // Field name: aln_status
  {
    cdr << ros_message->aln_status;
  }

  return true;
}

static bool _DetectionList__cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  void * untyped_ros_message)
{
  if (!untyped_ros_message) {
    fprintf(stderr, "ros message handle is null\n");
    return false;
  }
  _DetectionList__ros_msg_type * ros_message = static_cast<_DetectionList__ros_msg_type *>(untyped_ros_message);
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

  // Field name: origin_invalidflags
  {
    cdr >> ros_message->origin_invalidflags;
  }

  // Field name: origin_xpos
  {
    cdr >> ros_message->origin_xpos;
  }

  // Field name: origin_xstd
  {
    cdr >> ros_message->origin_xstd;
  }

  // Field name: origin_ypos
  {
    cdr >> ros_message->origin_ypos;
  }

  // Field name: origin_ystd
  {
    cdr >> ros_message->origin_ystd;
  }

  // Field name: origin_zpos
  {
    cdr >> ros_message->origin_zpos;
  }

  // Field name: origin_zstd
  {
    cdr >> ros_message->origin_zstd;
  }

  // Field name: origin_roll
  {
    cdr >> ros_message->origin_roll;
  }

  // Field name: origin_rollstd
  {
    cdr >> ros_message->origin_rollstd;
  }

  // Field name: origin_pitch
  {
    cdr >> ros_message->origin_pitch;
  }

  // Field name: origin_pitchstd
  {
    cdr >> ros_message->origin_pitchstd;
  }

  // Field name: origin_yaw
  {
    cdr >> ros_message->origin_yaw;
  }

  // Field name: origin_yawstd
  {
    cdr >> ros_message->origin_yawstd;
  }

  // Field name: list_invalidflags
  {
    cdr >> ros_message->list_invalidflags;
  }

  // Field name: list_detections
  {
    const message_type_support_callbacks_t * callbacks =
      static_cast<const message_type_support_callbacks_t *>(
      ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(
        rosidl_typesupport_fastrtps_c, ars548_messages, msg, Detection
      )()->data);
    size_t size = 800;
    auto array_ptr = ros_message->list_detections;
    for (size_t i = 0; i < size; ++i) {
      if (!callbacks->cdr_deserialize(
          cdr, &array_ptr[i]))
      {
        return false;
      }
    }
  }

  // Field name: list_radveldomain_min
  {
    cdr >> ros_message->list_radveldomain_min;
  }

  // Field name: list_radveldomain_max
  {
    cdr >> ros_message->list_radveldomain_max;
  }

  // Field name: list_numofdetections
  {
    cdr >> ros_message->list_numofdetections;
  }

  // Field name: aln_azimuthcorrection
  {
    cdr >> ros_message->aln_azimuthcorrection;
  }

  // Field name: aln_elevationcorrection
  {
    cdr >> ros_message->aln_elevationcorrection;
  }

  // Field name: aln_status
  {
    cdr >> ros_message->aln_status;
  }

  return true;
}  // NOLINT(readability/fn_size)

ROSIDL_TYPESUPPORT_FASTRTPS_C_PUBLIC_ars548_messages
size_t get_serialized_size_ars548_messages__msg__DetectionList(
  const void * untyped_ros_message,
  size_t current_alignment)
{
  const _DetectionList__ros_msg_type * ros_message = static_cast<const _DetectionList__ros_msg_type *>(untyped_ros_message);
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
  // field.name origin_invalidflags
  {
    size_t item_size = sizeof(ros_message->origin_invalidflags);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name origin_xpos
  {
    size_t item_size = sizeof(ros_message->origin_xpos);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name origin_xstd
  {
    size_t item_size = sizeof(ros_message->origin_xstd);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name origin_ypos
  {
    size_t item_size = sizeof(ros_message->origin_ypos);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name origin_ystd
  {
    size_t item_size = sizeof(ros_message->origin_ystd);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name origin_zpos
  {
    size_t item_size = sizeof(ros_message->origin_zpos);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name origin_zstd
  {
    size_t item_size = sizeof(ros_message->origin_zstd);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name origin_roll
  {
    size_t item_size = sizeof(ros_message->origin_roll);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name origin_rollstd
  {
    size_t item_size = sizeof(ros_message->origin_rollstd);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name origin_pitch
  {
    size_t item_size = sizeof(ros_message->origin_pitch);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name origin_pitchstd
  {
    size_t item_size = sizeof(ros_message->origin_pitchstd);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name origin_yaw
  {
    size_t item_size = sizeof(ros_message->origin_yaw);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name origin_yawstd
  {
    size_t item_size = sizeof(ros_message->origin_yawstd);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name list_invalidflags
  {
    size_t item_size = sizeof(ros_message->list_invalidflags);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name list_detections
  {
    size_t array_size = 800;
    auto array_ptr = ros_message->list_detections;

    for (size_t index = 0; index < array_size; ++index) {
      current_alignment += get_serialized_size_ars548_messages__msg__Detection(
        &array_ptr[index], current_alignment);
    }
  }
  // field.name list_radveldomain_min
  {
    size_t item_size = sizeof(ros_message->list_radveldomain_min);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name list_radveldomain_max
  {
    size_t item_size = sizeof(ros_message->list_radveldomain_max);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name list_numofdetections
  {
    size_t item_size = sizeof(ros_message->list_numofdetections);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name aln_azimuthcorrection
  {
    size_t item_size = sizeof(ros_message->aln_azimuthcorrection);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name aln_elevationcorrection
  {
    size_t item_size = sizeof(ros_message->aln_elevationcorrection);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name aln_status
  {
    size_t item_size = sizeof(ros_message->aln_status);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }

  return current_alignment - initial_alignment;
}

static uint32_t _DetectionList__get_serialized_size(const void * untyped_ros_message)
{
  return static_cast<uint32_t>(
    get_serialized_size_ars548_messages__msg__DetectionList(
      untyped_ros_message, 0));
}

ROSIDL_TYPESUPPORT_FASTRTPS_C_PUBLIC_ars548_messages
size_t max_serialized_size_ars548_messages__msg__DetectionList(
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
  // member: origin_invalidflags
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint16_t);
    current_alignment += array_size * sizeof(uint16_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint16_t));
  }
  // member: origin_xpos
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: origin_xstd
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: origin_ypos
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: origin_ystd
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: origin_zpos
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: origin_zstd
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: origin_roll
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: origin_rollstd
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: origin_pitch
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: origin_pitchstd
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: origin_yaw
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: origin_yawstd
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: list_invalidflags
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: list_detections
  {
    size_t array_size = 800;


    last_member_size = 0;
    for (size_t index = 0; index < array_size; ++index) {
      bool inner_full_bounded;
      bool inner_is_plain;
      size_t inner_size;
      inner_size =
        max_serialized_size_ars548_messages__msg__Detection(
        inner_full_bounded, inner_is_plain, current_alignment);
      last_member_size += inner_size;
      current_alignment += inner_size;
      full_bounded &= inner_full_bounded;
      is_plain &= inner_is_plain;
    }
  }
  // member: list_radveldomain_min
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: list_radveldomain_max
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: list_numofdetections
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: aln_azimuthcorrection
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: aln_elevationcorrection
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: aln_status
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
    using DataType = ars548_messages__msg__DetectionList;
    is_plain =
      (
      offsetof(DataType, aln_status) +
      last_member_size
      ) == ret_val;
  }

  return ret_val;
}

static size_t _DetectionList__max_serialized_size(char & bounds_info)
{
  bool full_bounded;
  bool is_plain;
  size_t ret_val;

  ret_val = max_serialized_size_ars548_messages__msg__DetectionList(
    full_bounded, is_plain, 0);

  bounds_info =
    is_plain ? ROSIDL_TYPESUPPORT_FASTRTPS_PLAIN_TYPE :
    full_bounded ? ROSIDL_TYPESUPPORT_FASTRTPS_BOUNDED_TYPE : ROSIDL_TYPESUPPORT_FASTRTPS_UNBOUNDED_TYPE;
  return ret_val;
}


static message_type_support_callbacks_t __callbacks_DetectionList = {
  "ars548_messages::msg",
  "DetectionList",
  _DetectionList__cdr_serialize,
  _DetectionList__cdr_deserialize,
  _DetectionList__get_serialized_size,
  _DetectionList__max_serialized_size
};

static rosidl_message_type_support_t _DetectionList__type_support = {
  rosidl_typesupport_fastrtps_c__identifier,
  &__callbacks_DetectionList,
  get_message_typesupport_handle_function,
};

const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_c, ars548_messages, msg, DetectionList)() {
  return &_DetectionList__type_support;
}

#if defined(__cplusplus)
}
#endif
