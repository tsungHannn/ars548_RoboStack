// generated from rosidl_typesupport_fastrtps_cpp/resource/idl__type_support.cpp.em
// with input from ars548_messages:msg/Detection.idl
// generated code does not contain a copyright notice
#include "ars548_messages/msg/detail/detection__rosidl_typesupport_fastrtps_cpp.hpp"
#include "ars548_messages/msg/detail/detection__struct.hpp"

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
  const ars548_messages::msg::Detection & ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  // Member: f_azimuthangle
  cdr << ros_message.f_azimuthangle;
  // Member: f_azimuthanglestd
  cdr << ros_message.f_azimuthanglestd;
  // Member: u_invalidflags
  cdr << ros_message.u_invalidflags;
  // Member: f_elevationangle
  cdr << ros_message.f_elevationangle;
  // Member: f_elevationanglestd
  cdr << ros_message.f_elevationanglestd;
  // Member: f_range
  cdr << ros_message.f_range;
  // Member: f_rangestd
  cdr << ros_message.f_rangestd;
  // Member: f_rangerate
  cdr << ros_message.f_rangerate;
  // Member: f_rangeratestd
  cdr << ros_message.f_rangeratestd;
  // Member: s_rcs
  cdr << ros_message.s_rcs;
  // Member: u_measurementid
  cdr << ros_message.u_measurementid;
  // Member: u_positivepredictivevalue
  cdr << ros_message.u_positivepredictivevalue;
  // Member: u_classification
  cdr << ros_message.u_classification;
  // Member: u_multitargetprobabilitym
  cdr << ros_message.u_multitargetprobabilitym;
  // Member: u_objectid
  cdr << ros_message.u_objectid;
  // Member: u_ambiguityflag
  cdr << ros_message.u_ambiguityflag;
  // Member: u_sortindex
  cdr << ros_message.u_sortindex;
  return true;
}

bool
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_ars548_messages
cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  ars548_messages::msg::Detection & ros_message)
{
  // Member: f_azimuthangle
  cdr >> ros_message.f_azimuthangle;

  // Member: f_azimuthanglestd
  cdr >> ros_message.f_azimuthanglestd;

  // Member: u_invalidflags
  cdr >> ros_message.u_invalidflags;

  // Member: f_elevationangle
  cdr >> ros_message.f_elevationangle;

  // Member: f_elevationanglestd
  cdr >> ros_message.f_elevationanglestd;

  // Member: f_range
  cdr >> ros_message.f_range;

  // Member: f_rangestd
  cdr >> ros_message.f_rangestd;

  // Member: f_rangerate
  cdr >> ros_message.f_rangerate;

  // Member: f_rangeratestd
  cdr >> ros_message.f_rangeratestd;

  // Member: s_rcs
  cdr >> ros_message.s_rcs;

  // Member: u_measurementid
  cdr >> ros_message.u_measurementid;

  // Member: u_positivepredictivevalue
  cdr >> ros_message.u_positivepredictivevalue;

  // Member: u_classification
  cdr >> ros_message.u_classification;

  // Member: u_multitargetprobabilitym
  cdr >> ros_message.u_multitargetprobabilitym;

  // Member: u_objectid
  cdr >> ros_message.u_objectid;

  // Member: u_ambiguityflag
  cdr >> ros_message.u_ambiguityflag;

  // Member: u_sortindex
  cdr >> ros_message.u_sortindex;

  return true;
}

size_t
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_ars548_messages
get_serialized_size(
  const ars548_messages::msg::Detection & ros_message,
  size_t current_alignment)
{
  size_t initial_alignment = current_alignment;

  const size_t padding = 4;
  const size_t wchar_size = 4;
  (void)padding;
  (void)wchar_size;

  // Member: f_azimuthangle
  {
    size_t item_size = sizeof(ros_message.f_azimuthangle);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_azimuthanglestd
  {
    size_t item_size = sizeof(ros_message.f_azimuthanglestd);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_invalidflags
  {
    size_t item_size = sizeof(ros_message.u_invalidflags);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_elevationangle
  {
    size_t item_size = sizeof(ros_message.f_elevationangle);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_elevationanglestd
  {
    size_t item_size = sizeof(ros_message.f_elevationanglestd);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_range
  {
    size_t item_size = sizeof(ros_message.f_range);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_rangestd
  {
    size_t item_size = sizeof(ros_message.f_rangestd);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_rangerate
  {
    size_t item_size = sizeof(ros_message.f_rangerate);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: f_rangeratestd
  {
    size_t item_size = sizeof(ros_message.f_rangeratestd);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: s_rcs
  {
    size_t item_size = sizeof(ros_message.s_rcs);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_measurementid
  {
    size_t item_size = sizeof(ros_message.u_measurementid);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_positivepredictivevalue
  {
    size_t item_size = sizeof(ros_message.u_positivepredictivevalue);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_classification
  {
    size_t item_size = sizeof(ros_message.u_classification);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_multitargetprobabilitym
  {
    size_t item_size = sizeof(ros_message.u_multitargetprobabilitym);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_objectid
  {
    size_t item_size = sizeof(ros_message.u_objectid);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_ambiguityflag
  {
    size_t item_size = sizeof(ros_message.u_ambiguityflag);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: u_sortindex
  {
    size_t item_size = sizeof(ros_message.u_sortindex);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }

  return current_alignment - initial_alignment;
}

size_t
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_ars548_messages
max_serialized_size_Detection(
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


  // Member: f_azimuthangle
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: f_azimuthanglestd
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: u_invalidflags
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: f_elevationangle
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: f_elevationanglestd
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: f_range
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: f_rangestd
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: f_rangerate
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: f_rangeratestd
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: s_rcs
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: u_measurementid
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint16_t);
    current_alignment += array_size * sizeof(uint16_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint16_t));
  }

  // Member: u_positivepredictivevalue
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: u_classification
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: u_multitargetprobabilitym
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: u_objectid
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint16_t);
    current_alignment += array_size * sizeof(uint16_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint16_t));
  }

  // Member: u_ambiguityflag
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: u_sortindex
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
    using DataType = ars548_messages::msg::Detection;
    is_plain =
      (
      offsetof(DataType, u_sortindex) +
      last_member_size
      ) == ret_val;
  }

  return ret_val;
}

static bool _Detection__cdr_serialize(
  const void * untyped_ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  auto typed_message =
    static_cast<const ars548_messages::msg::Detection *>(
    untyped_ros_message);
  return cdr_serialize(*typed_message, cdr);
}

static bool _Detection__cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  void * untyped_ros_message)
{
  auto typed_message =
    static_cast<ars548_messages::msg::Detection *>(
    untyped_ros_message);
  return cdr_deserialize(cdr, *typed_message);
}

static uint32_t _Detection__get_serialized_size(
  const void * untyped_ros_message)
{
  auto typed_message =
    static_cast<const ars548_messages::msg::Detection *>(
    untyped_ros_message);
  return static_cast<uint32_t>(get_serialized_size(*typed_message, 0));
}

static size_t _Detection__max_serialized_size(char & bounds_info)
{
  bool full_bounded;
  bool is_plain;
  size_t ret_val;

  ret_val = max_serialized_size_Detection(full_bounded, is_plain, 0);

  bounds_info =
    is_plain ? ROSIDL_TYPESUPPORT_FASTRTPS_PLAIN_TYPE :
    full_bounded ? ROSIDL_TYPESUPPORT_FASTRTPS_BOUNDED_TYPE : ROSIDL_TYPESUPPORT_FASTRTPS_UNBOUNDED_TYPE;
  return ret_val;
}

static message_type_support_callbacks_t _Detection__callbacks = {
  "ars548_messages::msg",
  "Detection",
  _Detection__cdr_serialize,
  _Detection__cdr_deserialize,
  _Detection__get_serialized_size,
  _Detection__max_serialized_size
};

static rosidl_message_type_support_t _Detection__handle = {
  rosidl_typesupport_fastrtps_cpp::typesupport_identifier,
  &_Detection__callbacks,
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
get_message_type_support_handle<ars548_messages::msg::Detection>()
{
  return &ars548_messages::msg::typesupport_fastrtps_cpp::_Detection__handle;
}

}  // namespace rosidl_typesupport_fastrtps_cpp

#ifdef __cplusplus
extern "C"
{
#endif

const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_cpp, ars548_messages, msg, Detection)() {
  return &ars548_messages::msg::typesupport_fastrtps_cpp::_Detection__handle;
}

#ifdef __cplusplus
}
#endif
