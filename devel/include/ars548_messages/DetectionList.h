// Generated by gencpp from file ars548_messages/DetectionList.msg
// DO NOT EDIT!


#ifndef ARS548_MESSAGES_MESSAGE_DETECTIONLIST_H
#define ARS548_MESSAGES_MESSAGE_DETECTIONLIST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <ars548_messages/Detection.h>

namespace ars548_messages
{
template <class ContainerAllocator>
struct DetectionList_
{
  typedef DetectionList_<ContainerAllocator> Type;

  DetectionList_()
    : header()
    , crc(0)
    , length(0)
    , sqc(0)
    , dataid(0)
    , timestamp_nanoseconds(0)
    , timestamp_seconds(0)
    , timestamp_syncstatus(0)
    , eventdataqualifier(0)
    , extendedqualifier(0)
    , origin_invalidflags(0)
    , origin_xpos(0.0)
    , origin_xstd(0.0)
    , origin_ypos(0.0)
    , origin_ystd(0.0)
    , origin_zpos(0.0)
    , origin_zstd(0.0)
    , origin_roll(0.0)
    , origin_rollstd(0.0)
    , origin_pitch(0.0)
    , origin_pitchstd(0.0)
    , origin_yaw(0.0)
    , origin_yawstd(0.0)
    , list_invalidflags(0)
    , list_detections()
    , list_radveldomain_min(0.0)
    , list_radveldomain_max(0.0)
    , list_numofdetections(0)
    , aln_azimuthcorrection(0.0)
    , aln_elevationcorrection(0.0)
    , aln_status(0)  {
    }
  DetectionList_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , crc(0)
    , length(0)
    , sqc(0)
    , dataid(0)
    , timestamp_nanoseconds(0)
    , timestamp_seconds(0)
    , timestamp_syncstatus(0)
    , eventdataqualifier(0)
    , extendedqualifier(0)
    , origin_invalidflags(0)
    , origin_xpos(0.0)
    , origin_xstd(0.0)
    , origin_ypos(0.0)
    , origin_ystd(0.0)
    , origin_zpos(0.0)
    , origin_zstd(0.0)
    , origin_roll(0.0)
    , origin_rollstd(0.0)
    , origin_pitch(0.0)
    , origin_pitchstd(0.0)
    , origin_yaw(0.0)
    , origin_yawstd(0.0)
    , list_invalidflags(0)
    , list_detections()
    , list_radveldomain_min(0.0)
    , list_radveldomain_max(0.0)
    , list_numofdetections(0)
    , aln_azimuthcorrection(0.0)
    , aln_elevationcorrection(0.0)
    , aln_status(0)  {
  (void)_alloc;
      list_detections.assign( ::ars548_messages::Detection_<ContainerAllocator> (_alloc));
  }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef uint64_t _crc_type;
  _crc_type crc;

   typedef uint32_t _length_type;
  _length_type length;

   typedef uint32_t _sqc_type;
  _sqc_type sqc;

   typedef uint32_t _dataid_type;
  _dataid_type dataid;

   typedef uint32_t _timestamp_nanoseconds_type;
  _timestamp_nanoseconds_type timestamp_nanoseconds;

   typedef uint32_t _timestamp_seconds_type;
  _timestamp_seconds_type timestamp_seconds;

   typedef uint8_t _timestamp_syncstatus_type;
  _timestamp_syncstatus_type timestamp_syncstatus;

   typedef uint32_t _eventdataqualifier_type;
  _eventdataqualifier_type eventdataqualifier;

   typedef uint8_t _extendedqualifier_type;
  _extendedqualifier_type extendedqualifier;

   typedef uint16_t _origin_invalidflags_type;
  _origin_invalidflags_type origin_invalidflags;

   typedef float _origin_xpos_type;
  _origin_xpos_type origin_xpos;

   typedef float _origin_xstd_type;
  _origin_xstd_type origin_xstd;

   typedef float _origin_ypos_type;
  _origin_ypos_type origin_ypos;

   typedef float _origin_ystd_type;
  _origin_ystd_type origin_ystd;

   typedef float _origin_zpos_type;
  _origin_zpos_type origin_zpos;

   typedef float _origin_zstd_type;
  _origin_zstd_type origin_zstd;

   typedef float _origin_roll_type;
  _origin_roll_type origin_roll;

   typedef float _origin_rollstd_type;
  _origin_rollstd_type origin_rollstd;

   typedef float _origin_pitch_type;
  _origin_pitch_type origin_pitch;

   typedef float _origin_pitchstd_type;
  _origin_pitchstd_type origin_pitchstd;

   typedef float _origin_yaw_type;
  _origin_yaw_type origin_yaw;

   typedef float _origin_yawstd_type;
  _origin_yawstd_type origin_yawstd;

   typedef uint8_t _list_invalidflags_type;
  _list_invalidflags_type list_invalidflags;

   typedef boost::array< ::ars548_messages::Detection_<ContainerAllocator> , 800>  _list_detections_type;
  _list_detections_type list_detections;

   typedef float _list_radveldomain_min_type;
  _list_radveldomain_min_type list_radveldomain_min;

   typedef float _list_radveldomain_max_type;
  _list_radveldomain_max_type list_radveldomain_max;

   typedef uint32_t _list_numofdetections_type;
  _list_numofdetections_type list_numofdetections;

   typedef float _aln_azimuthcorrection_type;
  _aln_azimuthcorrection_type aln_azimuthcorrection;

   typedef float _aln_elevationcorrection_type;
  _aln_elevationcorrection_type aln_elevationcorrection;

   typedef uint8_t _aln_status_type;
  _aln_status_type aln_status;





  typedef boost::shared_ptr< ::ars548_messages::DetectionList_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ars548_messages::DetectionList_<ContainerAllocator> const> ConstPtr;

}; // struct DetectionList_

typedef ::ars548_messages::DetectionList_<std::allocator<void> > DetectionList;

typedef boost::shared_ptr< ::ars548_messages::DetectionList > DetectionListPtr;
typedef boost::shared_ptr< ::ars548_messages::DetectionList const> DetectionListConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ars548_messages::DetectionList_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ars548_messages::DetectionList_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ars548_messages::DetectionList_<ContainerAllocator1> & lhs, const ::ars548_messages::DetectionList_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.crc == rhs.crc &&
    lhs.length == rhs.length &&
    lhs.sqc == rhs.sqc &&
    lhs.dataid == rhs.dataid &&
    lhs.timestamp_nanoseconds == rhs.timestamp_nanoseconds &&
    lhs.timestamp_seconds == rhs.timestamp_seconds &&
    lhs.timestamp_syncstatus == rhs.timestamp_syncstatus &&
    lhs.eventdataqualifier == rhs.eventdataqualifier &&
    lhs.extendedqualifier == rhs.extendedqualifier &&
    lhs.origin_invalidflags == rhs.origin_invalidflags &&
    lhs.origin_xpos == rhs.origin_xpos &&
    lhs.origin_xstd == rhs.origin_xstd &&
    lhs.origin_ypos == rhs.origin_ypos &&
    lhs.origin_ystd == rhs.origin_ystd &&
    lhs.origin_zpos == rhs.origin_zpos &&
    lhs.origin_zstd == rhs.origin_zstd &&
    lhs.origin_roll == rhs.origin_roll &&
    lhs.origin_rollstd == rhs.origin_rollstd &&
    lhs.origin_pitch == rhs.origin_pitch &&
    lhs.origin_pitchstd == rhs.origin_pitchstd &&
    lhs.origin_yaw == rhs.origin_yaw &&
    lhs.origin_yawstd == rhs.origin_yawstd &&
    lhs.list_invalidflags == rhs.list_invalidflags &&
    lhs.list_detections == rhs.list_detections &&
    lhs.list_radveldomain_min == rhs.list_radveldomain_min &&
    lhs.list_radveldomain_max == rhs.list_radveldomain_max &&
    lhs.list_numofdetections == rhs.list_numofdetections &&
    lhs.aln_azimuthcorrection == rhs.aln_azimuthcorrection &&
    lhs.aln_elevationcorrection == rhs.aln_elevationcorrection &&
    lhs.aln_status == rhs.aln_status;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ars548_messages::DetectionList_<ContainerAllocator1> & lhs, const ::ars548_messages::DetectionList_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ars548_messages

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ars548_messages::DetectionList_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ars548_messages::DetectionList_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ars548_messages::DetectionList_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ars548_messages::DetectionList_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ars548_messages::DetectionList_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ars548_messages::DetectionList_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ars548_messages::DetectionList_<ContainerAllocator> >
{
  static const char* value()
  {
    return "dfc9cd5cc1729d9eb247feb85b81b126";
  }

  static const char* value(const ::ars548_messages::DetectionList_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xdfc9cd5cc1729d9eULL;
  static const uint64_t static_value2 = 0xb247feb85b81b126ULL;
};

template<class ContainerAllocator>
struct DataType< ::ars548_messages::DetectionList_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ars548_messages/DetectionList";
  }

  static const char* value(const ::ars548_messages::DetectionList_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ars548_messages::DetectionList_<ContainerAllocator> >
{
  static const char* value()
  {
    return "std_msgs/Header header\n"
"uint64 crc #Checksum (E2E Profile 7) (Reserved)\n"
"uint32 length #Len (E2E Profile 7) (Reserved)\n"
"uint32 sqc #SQC (E2E Profile 7) (Reserved)\n"
"uint32 dataid #Data ID (E2E Profile 7) (Reserved)\n"
"uint32 timestamp_nanoseconds #Timestamp Nanoseconds\n"
"uint32 timestamp_seconds #Timestamp Seconds\n"
"uint8 timestamp_syncstatus #Timestamp Sync Status\n"
"uint32 eventdataqualifier #Event Data Qualifier (unused)\n"
"uint8 extendedqualifier #Extended Qualifier (unused)\n"
"uint16 origin_invalidflags #Sensor Position Invalid flags (unused)\n"
"float32 origin_xpos #Sensor X Position with reference to rear axle\n"
"float32 origin_xstd #Sensor X Position STD (unused)\n"
"float32 origin_ypos #Sensor Y Position with reference to rear axle\n"
"float32 origin_ystd #Sensor Y Position STD (unused)\n"
"float32 origin_zpos #Sensor Z Position with reference to rear axle\n"
"float32 origin_zstd #Sensor Z Position STD (unused)\n"
"float32 origin_roll #Sensor Roll Angle (unused)\n"
"float32 origin_rollstd #Sensor Roll Angle STD (unused)\n"
"float32 origin_pitch #Sensor Pitch Angle with alignment correction\n"
"float32 origin_pitchstd #Sensor Pitch Angle STD\n"
"float32 origin_yaw #Sensor Yaw Angle with alignment correction\n"
"float32 origin_yawstd #Sensor Yaw Angle STD\n"
"uint8 list_invalidflags #Invalid flags (unused)\n"
"Detection[800] list_detections #Detection Array\n"
"float32 list_radveldomain_min #Ambiguity free Doppler velocity range Min\n"
"float32 list_radveldomain_max #Ambiguity free Doppler velocity range Max\n"
"uint32 list_numofdetections #Number of Detections\n"
"float32 aln_azimuthcorrection #Azimuth Alignment Correction\n"
"float32 aln_elevationcorrection #Elevation Alignment Correction\n"
"uint8 aln_status #Status of alignment\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: ars548_messages/Detection\n"
"float32 f_azimuthangle #Unaligned Detection Azimuth Angle\n"
"float32 f_azimuthanglestd #Azimuth Angle Std\n"
"uint8 u_invalidflags #Detection Invalid Flags \n"
"float32 f_elevationangle #Unaligned Detection Elevation Angle\n"
"float32 f_elevationanglestd #Elevation Angle Std\n"
"float32 f_range #Detection Radial Distance\n"
"float32 f_rangestd #Radial Distance Std\n"
"float32 f_rangerate #Detection Radial Velocity\n"
"float32 f_rangeratestd #Radial Velocity Std\n"
"int8 s_rcs #Detection RCS\n"
"uint16 u_measurementid #Detection ID\n"
"uint8 u_positivepredictivevalue #Existence Probability\n"
"uint8 u_classification #Detection Classification\n"
"uint8 u_multitargetprobabilitym #Multi-Target Probability\n"
"uint16 u_objectid #Associated Object ID\n"
"uint8 u_ambiguityflag #Probability for resolved velocity ambiguity\n"
"uint16 u_sortindex #tbd\n"
;
  }

  static const char* value(const ::ars548_messages::DetectionList_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ars548_messages::DetectionList_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.crc);
      stream.next(m.length);
      stream.next(m.sqc);
      stream.next(m.dataid);
      stream.next(m.timestamp_nanoseconds);
      stream.next(m.timestamp_seconds);
      stream.next(m.timestamp_syncstatus);
      stream.next(m.eventdataqualifier);
      stream.next(m.extendedqualifier);
      stream.next(m.origin_invalidflags);
      stream.next(m.origin_xpos);
      stream.next(m.origin_xstd);
      stream.next(m.origin_ypos);
      stream.next(m.origin_ystd);
      stream.next(m.origin_zpos);
      stream.next(m.origin_zstd);
      stream.next(m.origin_roll);
      stream.next(m.origin_rollstd);
      stream.next(m.origin_pitch);
      stream.next(m.origin_pitchstd);
      stream.next(m.origin_yaw);
      stream.next(m.origin_yawstd);
      stream.next(m.list_invalidflags);
      stream.next(m.list_detections);
      stream.next(m.list_radveldomain_min);
      stream.next(m.list_radveldomain_max);
      stream.next(m.list_numofdetections);
      stream.next(m.aln_azimuthcorrection);
      stream.next(m.aln_elevationcorrection);
      stream.next(m.aln_status);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct DetectionList_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ars548_messages::DetectionList_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ars548_messages::DetectionList_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "crc: ";
    Printer<uint64_t>::stream(s, indent + "  ", v.crc);
    s << indent << "length: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.length);
    s << indent << "sqc: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.sqc);
    s << indent << "dataid: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.dataid);
    s << indent << "timestamp_nanoseconds: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.timestamp_nanoseconds);
    s << indent << "timestamp_seconds: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.timestamp_seconds);
    s << indent << "timestamp_syncstatus: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.timestamp_syncstatus);
    s << indent << "eventdataqualifier: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.eventdataqualifier);
    s << indent << "extendedqualifier: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.extendedqualifier);
    s << indent << "origin_invalidflags: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.origin_invalidflags);
    s << indent << "origin_xpos: ";
    Printer<float>::stream(s, indent + "  ", v.origin_xpos);
    s << indent << "origin_xstd: ";
    Printer<float>::stream(s, indent + "  ", v.origin_xstd);
    s << indent << "origin_ypos: ";
    Printer<float>::stream(s, indent + "  ", v.origin_ypos);
    s << indent << "origin_ystd: ";
    Printer<float>::stream(s, indent + "  ", v.origin_ystd);
    s << indent << "origin_zpos: ";
    Printer<float>::stream(s, indent + "  ", v.origin_zpos);
    s << indent << "origin_zstd: ";
    Printer<float>::stream(s, indent + "  ", v.origin_zstd);
    s << indent << "origin_roll: ";
    Printer<float>::stream(s, indent + "  ", v.origin_roll);
    s << indent << "origin_rollstd: ";
    Printer<float>::stream(s, indent + "  ", v.origin_rollstd);
    s << indent << "origin_pitch: ";
    Printer<float>::stream(s, indent + "  ", v.origin_pitch);
    s << indent << "origin_pitchstd: ";
    Printer<float>::stream(s, indent + "  ", v.origin_pitchstd);
    s << indent << "origin_yaw: ";
    Printer<float>::stream(s, indent + "  ", v.origin_yaw);
    s << indent << "origin_yawstd: ";
    Printer<float>::stream(s, indent + "  ", v.origin_yawstd);
    s << indent << "list_invalidflags: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.list_invalidflags);
    s << indent << "list_detections[]" << std::endl;
    for (size_t i = 0; i < v.list_detections.size(); ++i)
    {
      s << indent << "  list_detections[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::ars548_messages::Detection_<ContainerAllocator> >::stream(s, indent + "    ", v.list_detections[i]);
    }
    s << indent << "list_radveldomain_min: ";
    Printer<float>::stream(s, indent + "  ", v.list_radveldomain_min);
    s << indent << "list_radveldomain_max: ";
    Printer<float>::stream(s, indent + "  ", v.list_radveldomain_max);
    s << indent << "list_numofdetections: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.list_numofdetections);
    s << indent << "aln_azimuthcorrection: ";
    Printer<float>::stream(s, indent + "  ", v.aln_azimuthcorrection);
    s << indent << "aln_elevationcorrection: ";
    Printer<float>::stream(s, indent + "  ", v.aln_elevationcorrection);
    s << indent << "aln_status: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.aln_status);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ARS548_MESSAGES_MESSAGE_DETECTIONLIST_H
