#! /bin/bash

#This function is used to ask the user if they want to configure all of the
#connections or default data of the code automatically
configurer(){
    configureConnection
    echo "All configured!!"
}
#This function calls the nm-connection-editor so the user can create a virtual connection to the radar.
configureConnection(){
    echo "Write your parent interface name"
    read parent
    sudo ip link add link $parent name radar1 type vlan id 19
    sudo ip addr add 10.13.1.166/24 dev radar1
    sudo ip link set radar1 up
    sudo ip route replace default via 10.13.1.1 dev radar1

    echo "Connection Created"
}


#This first lines of the main code ask the user if they want to 
#install all of the necesary elements to execute the project.
#If they say no, it just exites the program 
echo "this File will configure all of the necesary data to execute the Project."
configurer 
exit
