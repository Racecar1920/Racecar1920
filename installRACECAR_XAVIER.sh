#!/bin/bash

#nano
sudo apt-get install nano

#ros
cd ~/Downloads/
git clone https://github.com/jetsonhacks/installROSXavier
cd installROSXavier/
./installROS.sh -p ros-melodic-desktop -p ros-melodic-rgbd-launch
./setupCatkinWorkspace.sh racecar_ws
