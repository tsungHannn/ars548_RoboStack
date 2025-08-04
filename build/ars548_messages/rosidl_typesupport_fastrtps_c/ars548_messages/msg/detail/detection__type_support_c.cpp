// generated from rosidl_typesupport_fastrtps_c/resource/idl__type_support_c.cpp.em
// with input from ars548_messages:msg/Detection.idl
// generated code does not contain a copyright notice
#include "ars548_messages/msg/detail/detection__rosidl_typesupport_fastrtps_c.h"


#include <cassert>
#include <limits>
#include <string>
#include "rosidl_typesupport_fastrtps_c/identifier.h"
#include "rosidl_typesupport_fastrtps_c/wstring_conversion.hpp"
#include "rosidl_typesupport_fastrtps_cpp/message_type_support.h"
#include "ars548_messages/msg/rosidl_typesupport_fastrtps_c__visibility_control.h"
#include "ars548_messages/msg/detail/detection__struct.h"
#include "ars548_messages/msg/detail/detection__functions.h"
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


using _Detection__ros_msg_type = ars548_messages__msg__Detection;

static bool _Detection__cdr_serialize(
  const void * untyped_ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  if (!untyped_ros_message) {
    fprintf(stderr, "ros message handle is null\n");
    return false;
  }
  const _Detection__ros_msg_type * ros_message = static_cast<const _Detection__ros_msg_type *>(untyped_ros_message);
  // Field name: f_azimuthangle
  {
    cdr << ros_message->f_azimuthangle;
  }

  // Field name: f_azimuthanglestd
  {
    cdr << ros_message->f_azimuthanglestd;
  }

  // Field name: u_invalidflags
  {
    cdr << ros_message->u_invalidflags;
  }

  // Field name: f_elevationangle
  {
    cdr << ros_message->f_elevationangle;
  }

  // Field name: f_elevationanglestd
  {
    cdr << ros_message->f_elevationanglestd;
  }

  // Field name: f_range
  {
    cdr << ros_message->f_range;
  }

  // Field name: f_rangestd
  {
    cdr << ros_message->f_rangestd;
  }

  // Field name: f_rangerate
  {
    cdr << ros_message->f_rangerate;
  }

  // Field name: f_rangeratestd
  {
    cdr << ros_message->f_rangeratestd;
  }

  // Field name: s_rcs
  {
    cdr << ros_message->s_rcs;
  }

  // Field name: u_measurementid
  {
    cdr << ros_message->u_measurementid;
  }

  // Field name: u_positivepredictivevalue
  {
    cdr << ros_message->u_positivepredictivevalue;
  }

  // Field name: u_classification
  {
    cdr << ros_message->u_classification;
  }

  // Field name: u_multitargetprobabilitym
  {
    cdr << ros_message->u_multitargetprobabilitym;
  }

  // Field name: u_objectid
  {
    cdr << ros_message->u_objectid;
  }

  // Field name: u_ambiguityflag
  {
    cdr << ros_message->u_ambiguityflag;
  }

  // Field name: u_sortindex
  {
    cdr << ros_message->u_sortindex;
  }

  return true;
}

static bool _Detection__cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  void * untyped_ros_message)
{
  if (!untyped_ros_message) {
    fprintf(stderr, "ros message handle is null\n");
    return false;
  }
  _Detection__ros_msg_type * ros_message = static_cast<_Detection__ros_msg_type *>(untyped_ros_message);
  // Field name: f_azimuthangle
  {
    cdr >> ros_message->f_azimuthangle;
  }

  // Field name: f_azimuthanglestd
  {
    cdr >> ros_message->f_azimuthanglestd;
  }

  // Field name: u_invalidflags
  {
    cdr >> ros_message->u_invalidflags;
  }

  // Field name: f_elevationangle
  {
    cdr >> ros_message->f_elevationangle;
  }

  // Field name: f_elevationanglestd
  {
    cdr >> ros_message->f_elevationanglestd;
  }

  // Field name: f_range
  {
    cdr >> ros_message->f_range;
  }

  // Field name: f_rangestd
  {
    cdr >> ros_message->f_rangestd;
  }

  // Field name: f_rangerate
  {
    cdr >> ros_message->f_rangerate;
  }

  // Field name: f_rangeratestd
  {
    cdr >> ros_message->f_rangeratestd;
  }

  // Field name: s_rcs
  {
    cdr >> ros_message->s_rcs;
  }

  // Field name: u_measurementid
  {
    cdr >> ros_message->u_measurementid;
  }

  // Field name: u_positivepredictivevalue
  {
    cdr >> ros_message->u_positivepredictivevalue;
  }

  // Field name: u_classification
  {
    cdr >> ros_message->u_classification;
  }

  // Field name: u_multitargetprobabilitym
  {
    cdr >> ros_message->u_multitargetprobabilitym;
  }

  // Field name: u_objectid
  {
    cdr >> ros_message->u_objectid;
  }

  // Field name: u_ambiguityflag
  {
    cdr >> ros_message->u_ambiguityflag;
  }

  // Field name: u_sortindex
  {
    cdr >> ros_message->u_sortindex;
  }

  return true;
}  // NOLINT(readability/fn_size)

ROSIDL_TYPESUPPORT_FASTRTPS_C_PUBLIC_ars548_messages
size_t get_serialized_size_ars548_messages__msg__Detection(
  const void * untyped_ros_message,
  size_t current_alignment)
{
  const _Detection__ros_msg_type * ros_message = static_cast<const _Detection__ros_msg_type *>(untyped_ros_message);
  (void)ros_message;
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  (void)padding;
  (void)wchar_size;

  // field.name f_azimuthangle
  {
    size_t item_size = sizeof(ros_message->f_azimuthangle);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_azimuthanglestd
  {
    size_t item_size = sizeof(ros_message->f_azimuthanglestd);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_invalidflags
  {
    size_t item_size = sizeof(ros_message->u_invalidflags);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_elevationangle
  {
    size_t item_size = sizeof(ros_message->f_elevationangle);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_elevationanglestd
  {
    size_t item_size = sizeof(ros_message->f_elevationanglestd);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_range
  {
    size_t item_size = sizeof(ros_message->f_range);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_rangestd
  {
    size_t item_size = sizeof(ros_message->f_rangestd);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_rangerate
  {
    size_t item_size = sizeof(ros_message->f_rangerate);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name f_rangeratestd
  {
    size_t item_size = sizeof(ros_message->f_rangeratestd);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name s_rcs
  {
    size_t item_size = sizeof(ros_message->s_rcs);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_measurementid
  {
    size_t item_size = sizeof(ros_message->u_measurementid);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_positivepredictivevalue
  {
    size_t item_size = sizeof(ros_message->u_positivepredictivevalue);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_classification
  {
    size_t item_size = sizeof(ros_message->u_classification);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_multitargetprobabilitym
  {
    size_t item_size = sizeof(ros_message->u_multitargetprobabilitym);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_objectid
  {
    size_t item_size = sizeof(ros_message->u_objectid);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_ambiguityflag
  {
    size_t item_size = sizeof(ros_message->u_ambiguityflag);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // field.name u_sortindex
  {
    size_t item_size = sizeof(ros_message->u_sortindex);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }

  return current_alignment - initial_alignment;
}

static uint32_t _Detection__get_serialized_size(const void * untyped_ros_message)
{
  return static_cast<uint32_t>(
    get_serialized_size_ars548_messages__msg__Detection(
      untyped_ros_message, 0));
}

ROSIDL_TYPESUPPORT_FASTRTPS_C_PUBLIC_ars548_messages
size_t max_serialized_size_ars548_messages__msg__Detection(
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

  // member: f_azimuthangle
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: f_azimuthanglestd
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: u_invalidflags
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: f_elevationangle
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: f_elevationanglestd
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: f_range
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: f_rangestd
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: f_rangerate
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: f_rangeratestd
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }
  // member: s_rcs
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: u_measurementid
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint16_t);
    current_alignment += array_size * sizeof(uint16_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint16_t));
  }
  // member: u_positivepredictivevalue
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: u_classification
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: u_multitargetprobabilitym
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: u_objectid
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint16_t);
    current_alignment += array_size * sizeof(uint16_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint16_t));
  }
  // member: u_ambiguityflag
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }
  // member: u_sortindex
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint16_t);
    current_alignment += array_size * sizeof(uint16_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint16_t));
  }

  size_t ret_val = current_alignment - initial_alignment;
  if (is_plain) {
    // All members are plain, and type is not empty.
    // We still need to check that the in-memory alignment
    // is the same as the CDR mandated alignment.
    using DataType = ars548_messages__msg__Detection;
    is_plain =
      (
      offsetof(DataType, u_sortindex) +
      last_member_size
      ) == ret_val;
  }

  return ret_val;
}

static size_t _Detection__max_serialized_size(char & bounds_info)
{
  bool full_bounded;
  bool is_plain;
  size_t ret_val;

  ret_val = max_serialized_size_ars548_messages__msg__Detection(
    full_bounded, is_plain, 0);

  bounds_info =
    is_plain ? ROSIDL_TYPESUPPORT_FASTRTPS_PLAIN_TYPE :
    full_bounded ? ROSIDL_TYPESUPPORT_FASTRTPS_BOUNDED_TYPE : ROSIDL_TYPESUPPORT_FASTRTPS_UNBOUNDED_TYPE;
  return ret_val;
}


static message_type_support_callbacks_t __callbacks_Detection = {
  "ars548_messages::msg",
  "Detection",
  _Detection__cdr_serialize,
  _Detection__cdr_deserialize,
  _Detection__get_serialized_size,
  _Detection__max_serialized_size
};

static rosidl_message_type_support_t _Detection__type_support = {
  rosidl_typesupport_fastrtps_c__identifier,
  &__callbacks_Detection,
  get_message_typesupport_handle_function,
};

const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_c, ars548_messages, msg, Detection)() {
  return &_Detection__type_support;
}

#if defined(__cplusplus)
}
#endif
