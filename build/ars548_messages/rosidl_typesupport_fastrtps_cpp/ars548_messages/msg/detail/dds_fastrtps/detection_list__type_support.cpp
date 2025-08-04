// generated from rosidl_typesupport_fastrtps_cpp/resource/idl__type_support.cpp.em
// with input from ars548_messages:msg/DetectionList.idl
// generated code does not contain a copyright notice
#include "ars548_messages/msg/detail/detection_list__rosidl_typesupport_fastrtps_cpp.hpp"
#include "ars548_messages/msg/detail/detection_list__struct.hpp"

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
  const ars548_messages::msg::Detection &,
  eprosima::fastcdr::Cdr &);
bool cdr_deserialize(
  eprosima::fastcdr::Cdr &,
  ars548_messages::msg::Detection &);
size_t get_serialized_size(
  const ars548_messages::msg::Detection &,
  size_t current_alignment);
size_t
max_serialized_size_Detection(
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
  const ars548_messages::msg::DetectionList & ros_message,
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
  // Member: origin_invalidflags
  cdr << ros_message.origin_invalidflags;
  // Member: origin_xpos
  cdr << ros_message.origin_xpos;
  // Member: origin_xstd
  cdr << ros_message.origin_xstd;
  // Member: origin_ypos
  cdr << ros_message.origin_ypos;
  // Member: origin_ystd
  cdr << ros_message.origin_ystd;
  // Member: origin_zpos
  cdr << ros_message.origin_zpos;
  // Member: origin_zstd
  cdr << ros_message.origin_zstd;
  // Member: origin_roll
  cdr << ros_message.origin_roll;
  // Member: origin_rollstd
  cdr << ros_message.origin_rollstd;
  // Member: origin_pitch
  cdr << ros_message.origin_pitch;
  // Member: origin_pitchstd
  cdr << ros_message.origin_pitchstd;
  // Member: origin_yaw
  cdr << ros_message.origin_yaw;
  // Member: origin_yawstd
  cdr << ros_message.origin_yawstd;
  // Member: list_invalidflags
  cdr << ros_message.list_invalidflags;
  // Member: list_detections
  {
    for (size_t i = 0; i < 800; i++) {
      ars548_messages::msg::typesupport_fastrtps_cpp::cdr_serialize(
        ros_message.list_detections[i],
        cdr);
    }
  }
  // Member: list_radveldomain_min
  cdr << ros_message.list_radveldomain_min;
  // Member: list_radveldomain_max
  cdr << ros_message.list_radveldomain_max;
  // Member: list_numofdetections
  cdr << ros_message.list_numofdetections;
  // Member: aln_azimuthcorrection
  cdr << ros_message.aln_azimuthcorrection;
  // Member: aln_elevationcorrection
  cdr << ros_message.aln_elevationcorrection;
  // Member: aln_status
  cdr << ros_message.aln_status;
  return true;
}

bool
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_ars548_messages
cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  ars548_messages::msg::DetectionList & ros_message)
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

  // Member: origin_invalidflags
  cdr >> ros_message.origin_invalidflags;

  // Member: origin_xpos
  cdr >> ros_message.origin_xpos;

  // Member: origin_xstd
  cdr >> ros_message.origin_xstd;

  // Member: origin_ypos
  cdr >> ros_message.origin_ypos;

  // Member: origin_ystd
  cdr >> ros_message.origin_ystd;

  // Member: origin_zpos
  cdr >> ros_message.origin_zpos;

  // Member: origin_zstd
  cdr >> ros_message.origin_zstd;

  // Member: origin_roll
  cdr >> ros_message.origin_roll;

  // Member: origin_rollstd
  cdr >> ros_message.origin_rollstd;

  // Member: origin_pitch
  cdr >> ros_message.origin_pitch;

  // Member: origin_pitchstd
  cdr >> ros_message.origin_pitchstd;

  // Member: origin_yaw
  cdr >> ros_message.origin_yaw;

  // Member: origin_yawstd
  cdr >> ros_message.origin_yawstd;

  // Member: list_invalidflags
  cdr >> ros_message.list_invalidflags;

  // Member: list_detections
  {
    for (size_t i = 0; i < 800; i++) {
      ars548_messages::msg::typesupport_fastrtps_cpp::cdr_deserialize(
        cdr,
        ros_message.list_detections[i]);
    }
  }

  // Member: list_radveldomain_min
  cdr >> ros_message.list_radveldomain_min;

  // Member: list_radveldomain_max
  cdr >> ros_message.list_radveldomain_max;

  // Member: list_numofdetections
  cdr >> ros_message.list_numofdetections;

  // Member: aln_azimuthcorrection
  cdr >> ros_message.aln_azimuthcorrection;

  // Member: aln_elevationcorrection
  cdr >> ros_message.aln_elevationcorrection;

  // Member: aln_status
  cdr >> ros_message.aln_status;

  return true;
}

size_t
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_ars548_messages
get_serialized_size(
  const ars548_messages::msg::DetectionList & ros_message,
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
  // Member: origin_invalidflags
  {
    size_t item_size = sizeof(ros_message.origin_invalidflags);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: origin_xpos
  {
    size_t item_size = sizeof(ros_message.origin_xpos);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: origin_xstd
  {
    size_t item_size = sizeof(ros_message.origin_xstd);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: origin_ypos
  {
    size_t item_size = sizeof(ros_message.origin_ypos);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: origin_ystd
  {
    size_t item_size = sizeof(ros_message.origin_ystd);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: origin_zpos
  {
    size_t item_size = sizeof(ros_message.origin_zpos);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: origin_zstd
  {
    size_t item_size = sizeof(ros_message.origin_zstd);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: origin_roll
  {
    size_t item_size = sizeof(ros_message.origin_roll);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: origin_rollstd
  {
    size_t item_size = sizeof(ros_message.origin_rollstd);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: origin_pitch
  {
    size_t item_size = sizeof(ros_message.origin_pitch);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: origin_pitchstd
  {
    size_t item_size = sizeof(ros_message.origin_pitchstd);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: origin_yaw
  {
    size_t item_size = sizeof(ros_message.origin_yaw);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: origin_yawstd
  {
    size_t item_size = sizeof(ros_message.origin_yawstd);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: list_invalidflags
  {
    size_t item_size = sizeof(ros_message.list_invalidflags);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: list_detections
  {
    size_t array_size = 800;

    for (size_t index = 0; index < array_size; ++index) {
      current_alignment +=
        ars548_messages::msg::typesupport_fastrtps_cpp::get_serialized_size(
        ros_message.list_detections[index], current_alignment);
    }
  }
  // Member: list_radveldomain_min
  {
    size_t item_size = sizeof(ros_message.list_radveldomain_min);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: list_radveldomain_max
  {
    size_t item_size = sizeof(ros_message.list_radveldomain_max);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: list_numofdetections
  {
    size_t item_size = sizeof(ros_message.list_numofdetections);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: aln_azimuthcorrection
  {
    size_t item_size = sizeof(ros_message.aln_azimuthcorrection);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: aln_elevationcorrection
  {
    size_t item_size = sizeof(ros_message.aln_elevationcorrection);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }
  // Member: aln_status
  {
    size_t item_size = sizeof(ros_message.aln_status);
    current_alignment += item_size +
      eprosima::fastcdr::Cdr::alignment(current_alignment, item_size);
  }

  return current_alignment - initial_alignment;
}

size_t
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_ars548_messages
max_serialized_size_DetectionList(
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

  // Member: origin_invalidflags
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint16_t);
    current_alignment += array_size * sizeof(uint16_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint16_t));
  }

  // Member: origin_xpos
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: origin_xstd
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: origin_ypos
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: origin_ystd
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: origin_zpos
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: origin_zstd
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: origin_roll
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: origin_rollstd
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: origin_pitch
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: origin_pitchstd
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: origin_yaw
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: origin_yawstd
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: list_invalidflags
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint8_t);
    current_alignment += array_size * sizeof(uint8_t);
  }

  // Member: list_detections
  {
    size_t array_size = 800;


    last_member_size = 0;
    for (size_t index = 0; index < array_size; ++index) {
      bool inner_full_bounded;
      bool inner_is_plain;
      size_t inner_size =
        ars548_messages::msg::typesupport_fastrtps_cpp::max_serialized_size_Detection(
        inner_full_bounded, inner_is_plain, current_alignment);
      last_member_size += inner_size;
      current_alignment += inner_size;
      full_bounded &= inner_full_bounded;
      is_plain &= inner_is_plain;
    }
  }

  // Member: list_radveldomain_min
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: list_radveldomain_max
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: list_numofdetections
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: aln_azimuthcorrection
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: aln_elevationcorrection
  {
    size_t array_size = 1;

    last_member_size = array_size * sizeof(uint32_t);
    current_alignment += array_size * sizeof(uint32_t) +
      eprosima::fastcdr::Cdr::alignment(current_alignment, sizeof(uint32_t));
  }

  // Member: aln_status
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
    using DataType = ars548_messages::msg::DetectionList;
    is_plain =
      (
      offsetof(DataType, aln_status) +
      last_member_size
      ) == ret_val;
  }

  return ret_val;
}

static bool _DetectionList__cdr_serialize(
  const void * untyped_ros_message,
  eprosima::fastcdr::Cdr & cdr)
{
  auto typed_message =
    static_cast<const ars548_messages::msg::DetectionList *>(
    untyped_ros_message);
  return cdr_serialize(*typed_message, cdr);
}

static bool _DetectionList__cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  void * untyped_ros_message)
{
  auto typed_message =
    static_cast<ars548_messages::msg::DetectionList *>(
    untyped_ros_message);
  return cdr_deserialize(cdr, *typed_message);
}

static uint32_t _DetectionList__get_serialized_size(
  const void * untyped_ros_message)
{
  auto typed_message =
    static_cast<const ars548_messages::msg::DetectionList *>(
    untyped_ros_message);
  return static_cast<uint32_t>(get_serialized_size(*typed_message, 0));
}

static size_t _DetectionList__max_serialized_size(char & bounds_info)
{
  bool full_bounded;
  bool is_plain;
  size_t ret_val;

  ret_val = max_serialized_size_DetectionList(full_bounded, is_plain, 0);

  bounds_info =
    is_plain ? ROSIDL_TYPESUPPORT_FASTRTPS_PLAIN_TYPE :
    full_bounded ? ROSIDL_TYPESUPPORT_FASTRTPS_BOUNDED_TYPE : ROSIDL_TYPESUPPORT_FASTRTPS_UNBOUNDED_TYPE;
  return ret_val;
}

static message_type_support_callbacks_t _DetectionList__callbacks = {
  "ars548_messages::msg",
  "DetectionList",
  _DetectionList__cdr_serialize,
  _DetectionList__cdr_deserialize,
  _DetectionList__get_serialized_size,
  _DetectionList__max_serialized_size
};

static rosidl_message_type_support_t _DetectionList__handle = {
  rosidl_typesupport_fastrtps_cpp::typesupport_identifier,
  &_DetectionList__callbacks,
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
get_message_type_support_handle<ars548_messages::msg::DetectionList>()
{
  return &ars548_messages::msg::typesupport_fastrtps_cpp::_DetectionList__handle;
}

}  // namespace rosidl_typesupport_fastrtps_cpp

#ifdef __cplusplus
extern "C"
{
#endif

const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_cpp, ars548_messages, msg, DetectionList)() {
  return &ars548_messages::msg::typesupport_fastrtps_cpp::_DetectionList__handle;
}

#ifdef __cplusplus
}
#endif
