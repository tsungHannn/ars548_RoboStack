/**
 * @file ars548_driver_node.cpp 
 */
#include "ros/ros.h"
#include "ars548_driver/ars548_driver.hpp"
#include <signal.h>
#include <thread>

volatile sig_atomic_t g_request_shutdown = 0;

void signalHandler(int sig) {
    g_request_shutdown = 1;
}



int main(int argc, char* argv[]) {
    ros::init(argc, argv, "ars548_driver_node", ros::init_options::NoSigintHandler);
    ros::NodeHandle nh;
    
    signal(SIGINT, signalHandler);
    
    // // 創建執行緒來運行每個 driver
    // std::thread thread1([&]() {
    //     Ars548_Driver driver1("224.0.2.2", "10.13.1.166", 42102, "ARS_548", "/radar1");
    // });
    
    // std::thread thread2([&]() {
    //     Ars548_Driver driver2("224.0.2.2", "10.13.2.168", 42102, "ARS_548", "/radar2");
    // });
    
    Ars548_Driver driver1("224.0.2.2", "10.13.1.166", 42102, "ARS_548", "/radar1");



    // // 等待執行緒完成
    // thread1.join();
    // thread2.join();
    
    ros::shutdown();
    return 0;
}


