#include "ros/ros.h"
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <fcntl.h>
#include <string>
#include <errno.h>

class RadarReceiver {
private:
    // Socket related variables
    int fd;
    struct sockaddr_in addr;
    struct ip_mreq mreq;
    char msgbuf[102400];  // 100KB buffer

    // Configuration
    std::string multicast_ip;
    std::string interface_ip;
    int port;

    // Statistics
    struct {
        int status_count = 0;
        int object_count = 0;
        int detection_count = 0;
        ros::Time last_stats_time;
    } stats;

    int setupSocket() {
        // Create socket
        fd = socket(AF_INET, SOCK_DGRAM, 0);
        if (fd < 0) {
            ROS_ERROR("Failed to create socket: %s", strerror(errno));
            return -1;
        }

        // Set reuse option
        int yes = 1;
        if (setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &yes, sizeof(yes)) < 0) {
            ROS_ERROR("SO_REUSEADDR failed: %s", strerror(errno));
            close(fd);
            return -1;
        }

        // Set receive buffer size (2MB)
        int rcvBufSize = 2 * 1024 * 1024;
        if (setsockopt(fd, SOL_SOCKET, SO_RCVBUF, &rcvBufSize, sizeof(rcvBufSize)) < 0) {
            ROS_WARN("Failed to set receive buffer size: %s", strerror(errno));
        }

        // Disable multicast loopback
        unsigned char loop = 0;
        if (setsockopt(fd, IPPROTO_IP, IP_MULTICAST_LOOP, &loop, sizeof(loop)) < 0) {
            ROS_WARN("Failed to disable multicast loopback: %s", strerror(errno));
        }

        // Set up receiving address
        memset(&addr, 0, sizeof(addr));
        addr.sin_family = AF_INET;
        addr.sin_addr.s_addr = htonl(INADDR_ANY);
        addr.sin_port = htons(port);

        // Bind
        if (bind(fd, (struct sockaddr*)&addr, sizeof(addr)) < 0) {
            ROS_ERROR("Bind failed: %s", strerror(errno));
            close(fd);
            return -1;
        }

        // Join multicast group
        mreq.imr_multiaddr.s_addr = inet_addr(multicast_ip.c_str());
        mreq.imr_interface.s_addr = inet_addr(interface_ip.c_str());
        if (setsockopt(fd, IPPROTO_IP, IP_ADD_MEMBERSHIP, &mreq, sizeof(mreq)) < 0) {
            ROS_ERROR("IP_ADD_MEMBERSHIP failed: %s", strerror(errno));
            close(fd);
            return -1;
        }

        // Set outgoing interface
        if (setsockopt(fd, IPPROTO_IP, IP_MULTICAST_IF, &mreq.imr_interface, sizeof(mreq.imr_interface)) < 0) {
            ROS_ERROR("IP_MULTICAST_IF failed: %s", strerror(errno));
            close(fd);
            return -1;
        }

        return fd;
    }

    void updateStats(int msgSize) {
        ros::Time now = ros::Time::now();
        if ((now - stats.last_stats_time).toSec() >= 5.0) {
            ROS_INFO("Last 5s - Status msgs: %d, Object msgs: %d, Detection msgs: %d",
                    stats.status_count, stats.object_count, stats.detection_count);
            stats.status_count = 0;
            stats.object_count = 0;
            stats.detection_count = 0;
            stats.last_stats_time = now;
        }

        // Update counters based on message size
        if (msgSize == 84) stats.status_count++;        // Status message
        else if (msgSize == 9401) stats.object_count++; // Object message
        else if (msgSize == 35336) stats.detection_count++; // Detection message
    }

public:
    RadarReceiver(const std::string& m_ip, const std::string& i_ip, int p) 
        : multicast_ip(m_ip), interface_ip(i_ip), port(p) {
        stats.last_stats_time = ros::Time::now();
    }

    ~RadarReceiver() {
        if (fd >= 0) {
            setsockopt(fd, IPPROTO_IP, IP_DROP_MEMBERSHIP, &mreq, sizeof(mreq));
            close(fd);
        }
    }

    void run() {
        if (setupSocket() < 0) {
            ROS_ERROR("Failed to setup socket");
            return;
        }

        fd_set readfds;
        struct timeval tv;
        unsigned int addrlen = sizeof(addr);
        ros::Rate rate(100); // 100Hz

        ROS_INFO("Starting to receive radar data...");

        while (ros::ok()) {
            FD_ZERO(&readfds);
            FD_SET(fd, &readfds);

            tv.tv_sec = 0;
            tv.tv_usec = 10000; // 10ms timeout

            int ret = select(fd + 1, &readfds, NULL, NULL, &tv);
            if (ret < 0) {
                ROS_ERROR("Select error: %s", strerror(errno));
                continue;
            }

            if (ret > 0 && FD_ISSET(fd, &readfds)) {
                int nbytes = recvfrom(fd, msgbuf, sizeof(msgbuf), 0, 
                                    (struct sockaddr*)&addr, &addrlen);
                
                if (nbytes < 0) {
                    if (errno != EAGAIN && errno != EWOULDBLOCK) {
                        ROS_ERROR("Receive error: %s", strerror(errno));
                    }
                    continue;
                }

                updateStats(nbytes);
            }

            ros::spinOnce();
            rate.sleep();
        }
    }
};

int main(int argc, char** argv) {
    ros::init(argc, argv, "radar_receiver");
    ros::NodeHandle nh("~");

    // Get parameters
    std::string multicast_ip, interface_ip;
    int port;

    nh.param<std::string>("multicast_ip", multicast_ip, "224.0.2.2");
    nh.param<std::string>("interface_ip", interface_ip, "10.13.1.166");
    nh.param<int>("port", port, 42102);

    RadarReceiver receiver(multicast_ip, interface_ip, port);
    receiver.run();

    return 0;
}
