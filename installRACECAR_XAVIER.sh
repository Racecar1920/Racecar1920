#!/bin/bash

#nano
sudo apt-get install nano

#ros
cd ~/Downloads/
git clone https://github.com/jetsonhacks/installROSXavier
cd installROSXavier/
./installROS.sh -p ros-melodic-desktop -p ros-melodic-rgbd-launch #takes a few minutes
./setupCatkinWorkspace.sh racecar_ws #takes a few minutes
echo "source ~/racecar_ws/devel/setup.bash" >> ~/.bashrc
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/racecar_ws/devel/setup.bash
source /opt/ros/melodic/setup.bash
grep -q -F ' ROS_IP' ~/.bashrc ||  echo "export ROS_IP=$(hostname -I)" | tee -a ~/.bashrc
grep -q -F ' ROS_MASTER_URI' ~/.bashrc ||  echo 'export ROS_MASTER_URI=http://localhost:11311' | tee -a ~/.bashrc
rosdep update #takes a few minutes
sudo apt-get install ros-melodic-tf2-geometry-msgs
sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential


#ZED
cd ~/Downloads/
wget https://download.stereolabs.com/zedsdk/2.8/jetson_jp42
chmod +x jetson_jp42
./jetson_jp42 #takes a few minutes
q #TODO q and Y and Enter key automatically

#RACECAR
cd ~/Downloads/
git clone https://github.com/RacecarJ/installRACECARJ.git
cd installRACECARJ/
./scripts/installRACECARUdev.sh
sudo apt update
sudo apt upgrade -y #takes a few minutes
sudo apt install python3-opencv -y
cd ~/racecar_ws/
wget -q https://raw.githubusercontent.com/racecarj/racecar/VESC6/racecar.rosinstall -O ~/racecar_ws/.rosinstall
wstool update
sudo apt-get install ros-melodic-serial
sudo apt-get install libpcl1 ros-melodic-pcl-ros -y
sudo apt-get install ros-melodic-ros-base
rosdep update
sudo apt-get install ros-melodic-ackermann-msgs
catkin_make

sudo reboot

