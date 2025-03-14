// Generated by gencpp from file ars548_messages/SensorConfiguration.msg
// DO NOT EDIT!


#ifndef ARS548_MESSAGES_MESSAGE_SENSORCONFIGURATION_H
#define ARS548_MESSAGES_MESSAGE_SENSORCONFIGURATION_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace ars548_messages
{
template <class ContainerAllocator>
struct SensorConfiguration_
{
  typedef SensorConfiguration_<ContainerAllocator> Type;

  SensorConfiguration_()
    : longitudinal(0.0)
    , lateral(0.0)
    , vertical(0.0)
    , yaw(0.0)
    , pitch(0.0)
    , plugorientation(0)
    , length(0.0)
    , width(0.0)
    , height(0.0)
    , wheelbase(0.0)
    , maximumdistance(0)
    , frequencslot(0)
    , cycletime(0)
    , timeslot(0)
    , hcc(0)
    , powersave_standstill(0)
    , sensoripaddress_0(0)
    , sensoripaddress_1(0)
    , newsensormounting(0)
    , newvehicleparameters(0)
    , newradarparameters(0)
    , newnetworkconfiguration(0)  {
    }
  SensorConfiguration_(const ContainerAllocator& _alloc)
    : longitudinal(0.0)
    , lateral(0.0)
    , vertical(0.0)
    , yaw(0.0)
    , pitch(0.0)
    , plugorientation(0)
    , length(0.0)
    , width(0.0)
    , height(0.0)
    , wheelbase(0.0)
    , maximumdistance(0)
    , frequencslot(0)
    , cycletime(0)
    , timeslot(0)
    , hcc(0)
    , powersave_standstill(0)
    , sensoripaddress_0(0)
    , sensoripaddress_1(0)
    , newsensormounting(0)
    , newvehicleparameters(0)
    , newradarparameters(0)
    , newnetworkconfiguration(0)  {
  (void)_alloc;
    }



   typedef float _longitudinal_type;
  _longitudinal_type longitudinal;

   typedef float _lateral_type;
  _lateral_type lateral;

   typedef float _vertical_type;
  _vertical_type vertical;

   typedef float _yaw_type;
  _yaw_type yaw;

   typedef float _pitch_type;
  _pitch_type pitch;

   typedef uint8_t _plugorientation_type;
  _plugorientation_type plugorientation;

   typedef float _length_type;
  _length_type length;

   typedef float _width_type;
  _width_type width;

   typedef float _height_type;
  _height_type height;

   typedef float _wheelbase_type;
  _wheelbase_type wheelbase;

   typedef uint16_t _maximumdistance_type;
  _maximumdistance_type maximumdistance;

   typedef uint8_t _frequencslot_type;
  _frequencslot_type frequencslot;

   typedef uint8_t _cycletime_type;
  _cycletime_type cycletime;

   typedef uint8_t _timeslot_type;
  _timeslot_type timeslot;

   typedef uint8_t _hcc_type;
  _hcc_type hcc;

   typedef uint8_t _powersave_standstill_type;
  _powersave_standstill_type powersave_standstill;

   typedef uint32_t _sensoripaddress_0_type;
  _sensoripaddress_0_type sensoripaddress_0;

   typedef uint32_t _sensoripaddress_1_type;
  _sensoripaddress_1_type sensoripaddress_1;

   typedef uint8_t _newsensormounting_type;
  _newsensormounting_type newsensormounting;

   typedef uint8_t _newvehicleparameters_type;
  _newvehicleparameters_type newvehicleparameters;

   typedef uint8_t _newradarparameters_type;
  _newradarparameters_type newradarparameters;

   typedef uint8_t _newnetworkconfiguration_type;
  _newnetworkconfiguration_type newnetworkconfiguration;





  typedef boost::shared_ptr< ::ars548_messages::SensorConfiguration_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ars548_messages::SensorConfiguration_<ContainerAllocator> const> ConstPtr;

}; // struct SensorConfiguration_

typedef ::ars548_messages::SensorConfiguration_<std::allocator<void> > SensorConfiguration;

typedef boost::shared_ptr< ::ars548_messages::SensorConfiguration > SensorConfigurationPtr;
typedef boost::shared_ptr< ::ars548_messages::SensorConfiguration const> SensorConfigurationConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ars548_messages::SensorConfiguration_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ars548_messages::SensorConfiguration_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ars548_messages::SensorConfiguration_<ContainerAllocator1> & lhs, const ::ars548_messages::SensorConfiguration_<ContainerAllocator2> & rhs)
{
  return lhs.longitudinal == rhs.longitudinal &&
    lhs.lateral == rhs.lateral &&
    lhs.vertical == rhs.vertical &&
    lhs.yaw == rhs.yaw &&
    lhs.pitch == rhs.pitch &&
    lhs.plugorientation == rhs.plugorientation &&
    lhs.length == rhs.length &&
    lhs.width == rhs.width &&
    lhs.height == rhs.height &&
    lhs.wheelbase == rhs.wheelbase &&
    lhs.maximumdistance == rhs.maximumdistance &&
    lhs.frequencslot == rhs.frequencslot &&
    lhs.cycletime == rhs.cycletime &&
    lhs.timeslot == rhs.timeslot &&
    lhs.hcc == rhs.hcc &&
    lhs.powersave_standstill == rhs.powersave_standstill &&
    lhs.sensoripaddress_0 == rhs.sensoripaddress_0 &&
    lhs.sensoripaddress_1 == rhs.sensoripaddress_1 &&
    lhs.newsensormounting == rhs.newsensormounting &&
    lhs.newvehicleparameters == rhs.newvehicleparameters &&
    lhs.newradarparameters == rhs.newradarparameters &&
    lhs.newnetworkconfiguration == rhs.newnetworkconfiguration;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ars548_messages::SensorConfiguration_<ContainerAllocator1> & lhs, const ::ars548_messages::SensorConfiguration_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ars548_messages

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ars548_messages::SensorConfiguration_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ars548_messages::SensorConfiguration_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ars548_messages::SensorConfiguration_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ars548_messages::SensorConfiguration_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ars548_messages::SensorConfiguration_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ars548_messages::SensorConfiguration_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ars548_messages::SensorConfiguration_<ContainerAllocator> >
{
  static const char* value()
  {
    return "431839fe505be3082a74c763bbc714ec";
  }

  static const char* value(const ::ars548_messages::SensorConfiguration_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x431839fe505be308ULL;
  static const uint64_t static_value2 = 0x2a74c763bbc714ecULL;
};

template<class ContainerAllocator>
struct DataType< ::ars548_messages::SensorConfiguration_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ars548_messages/SensorConfiguration";
  }

  static const char* value(const ::ars548_messages::SensorConfiguration_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ars548_messages::SensorConfiguration_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 longitudinal #Longitudinal sensor position (AUTOSAR)\n"
"float32 lateral #Lateral sensor position (AUTOSAR)\n"
"float32 vertical #Vertical sensor position (AUTOSAR)\n"
"float32 yaw #Sensor yaw angle (AUTOSAR)\n"
"float32 pitch #Sensor pitch angle (AUTOSAR)\n"
"uint8 plugorientation #Orientation of plug\n"
"float32 length #Vehicle length\n"
"float32 width #Vehicle width\n"
"float32 height #Vehicle height\n"
"float32 wheelbase #Vehicle wheelbase\n"
"uint16 maximumdistance #Maximum detection distance\n"
"uint8 frequencslot #Center frequency (if MaximumDistance < 190 m only Mid can be selected)\n"
"uint8 cycletime #Cycle time\n"
"uint8 timeslot #Cycle offset\n"
"uint8 hcc #Country code\n"
"uint8 powersave_standstill #Power saving in standstill\n"
"uint32 sensoripaddress_0 #Sensor IP address\n"
"uint32 sensoripaddress_1 #Reserved (Configure as 2852025457 or 169.254.116.113)\n"
"uint8 newsensormounting #Flag if new sensor mounting position shall be configured\n"
"uint8 newvehicleparameters #Flag if new vehicle parameters position shall be configured\n"
"uint8 newradarparameters #Flag if new radar parameter shall be configured\n"
"uint8 newnetworkconfiguration # Flag if new IP address shall be configured\n"
;
  }

  static const char* value(const ::ars548_messages::SensorConfiguration_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ars548_messages::SensorConfiguration_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.longitudinal);
      stream.next(m.lateral);
      stream.next(m.vertical);
      stream.next(m.yaw);
      stream.next(m.pitch);
      stream.next(m.plugorientation);
      stream.next(m.length);
      stream.next(m.width);
      stream.next(m.height);
      stream.next(m.wheelbase);
      stream.next(m.maximumdistance);
      stream.next(m.frequencslot);
      stream.next(m.cycletime);
      stream.next(m.timeslot);
      stream.next(m.hcc);
      stream.next(m.powersave_standstill);
      stream.next(m.sensoripaddress_0);
      stream.next(m.sensoripaddress_1);
      stream.next(m.newsensormounting);
      stream.next(m.newvehicleparameters);
      stream.next(m.newradarparameters);
      stream.next(m.newnetworkconfiguration);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SensorConfiguration_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ars548_messages::SensorConfiguration_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ars548_messages::SensorConfiguration_<ContainerAllocator>& v)
  {
    s << indent << "longitudinal: ";
    Printer<float>::stream(s, indent + "  ", v.longitudinal);
    s << indent << "lateral: ";
    Printer<float>::stream(s, indent + "  ", v.lateral);
    s << indent << "vertical: ";
    Printer<float>::stream(s, indent + "  ", v.vertical);
    s << indent << "yaw: ";
    Printer<float>::stream(s, indent + "  ", v.yaw);
    s << indent << "pitch: ";
    Printer<float>::stream(s, indent + "  ", v.pitch);
    s << indent << "plugorientation: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.plugorientation);
    s << indent << "length: ";
    Printer<float>::stream(s, indent + "  ", v.length);
    s << indent << "width: ";
    Printer<float>::stream(s, indent + "  ", v.width);
    s << indent << "height: ";
    Printer<float>::stream(s, indent + "  ", v.height);
    s << indent << "wheelbase: ";
    Printer<float>::stream(s, indent + "  ", v.wheelbase);
    s << indent << "maximumdistance: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.maximumdistance);
    s << indent << "frequencslot: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.frequencslot);
    s << indent << "cycletime: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.cycletime);
    s << indent << "timeslot: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.timeslot);
    s << indent << "hcc: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.hcc);
    s << indent << "powersave_standstill: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.powersave_standstill);
    s << indent << "sensoripaddress_0: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.sensoripaddress_0);
    s << indent << "sensoripaddress_1: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.sensoripaddress_1);
    s << indent << "newsensormounting: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.newsensormounting);
    s << indent << "newvehicleparameters: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.newvehicleparameters);
    s << indent << "newradarparameters: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.newradarparameters);
    s << indent << "newnetworkconfiguration: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.newnetworkconfiguration);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ARS548_MESSAGES_MESSAGE_SENSORCONFIGURATION_H
