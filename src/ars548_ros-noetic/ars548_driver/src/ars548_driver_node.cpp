/**
 * @file ars548_driver_node.cpp 
 */
#include "ros/ros.h"
#include "ars548_driver/ars548_driver.hpp"
#include <signal.h>

volatile sig_atomic_t g_request_shutdown = 0;

void signalHandler(int sig) {
    g_request_shutdown = 1;
}

int main(int argc,char* argv[]){
  ros::init(argc,argv, "ars548_driver_node", ros::init_options::NoSigintHandler);
  ros::NodeHandle nh;

  Ars548_Driver driver("224.0.2.2", 42102, "ARS_548");

  signal(SIGINT, signalHandler);

  ros::Rate rate(60);
  while (ros::ok()) {
  	ros::spinOnce();
	rate.sleep();
  }
  ros::shutdown();

  return 0;
}


