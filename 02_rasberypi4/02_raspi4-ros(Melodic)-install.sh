#!/bin/bash 

## Reffer
## ROS Melodicのインストール                                   http://joe.ash.jp/program/ros/setup/install_ros_melodic.htm
## Getting Started with ROS Melodic on Raspberry Pi 4 Model B  https://www.hackster.io/shahizat005/getting-started-with-ros-melodic-on-raspberry-pi-4-model-b-cbdec8

## general
sudo apt-get update
sudo apt-get upgrade
sudo apt-get autoremove

## Setup your sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

## Setup your keys
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

## To be sure that your Ubuntu package index is up to date, type the following command
sudo apt-get update

## If you will see the following error in the terminal:
## E: Could not get lock /var/lib/apt/lists/lock - open (11: Resource temporarily unavailable)
## It can be solved by running following command:
# sudo rm /var/lib/apt/lists/lock

## Install necessary dependencies
sudo apt-get install -y python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential  cmake

## Install ros-Melodic-desktop-full
sudo apt-get install ros-melodic-desktop-full

## Initialize rosdep
sudo rosdep init
rosdep update

## Setting up the ROS environment variables
echo “source /opt/ros/melodic/setup.bash” >> ~/.bashrc
source /opt/ros/melodic/setup.bash

## Create and initialize the catkin workspace
mkdir -p ~/catkin_workspace/src
cd ~/catkin_workspace/src
catkin_init_workspace
cd ~/catkin_workspace/
catkin_make

## Add the catkin_workspace to your ROS environment
echo “source ~/catkin_workspace/devel/setup.bash” >> ~/.bashrc

## Step 11: Check the ROS environment variables
export | grep ROS
