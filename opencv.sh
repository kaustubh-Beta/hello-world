#!/bin/bash
set -e

sudo apt-get update
sudo apt-get upgrade

#Install Dependencies
sudo apt-get install -y build-essential 
sudo apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
#The following command is needed to process images:
sudo apt-get install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
#To process videos:
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get install -y libxvidcore-dev libx264-dev
#For GUI:
sudo apt-get install -y libgtk-3-dev
#For optimization:
sudo apt-get install -y libatlas-base-dev gfortran pylint
#To build OpenCV binding for both python 2 and 3.
#sudo apt-get install -y python2.7-dev python3.5-dev
sudo apt-get install -y python3.5-dev


wget https://github.com/opencv/opencv/archive/3.4.0.zip -O opencv-3.4.0.zip

wget https://github.com/opencv/opencv_contrib/archive/3.4.0.zip -O opencv_contrib-3.4.0.zip

sudo apt-get install unzip
unzip opencv-3.4.0.zip
unzip opencv_contrib-3.4.0.zip

cd  opencv-3.4.0
mkdir build
cd build

cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-3.4.0/modules -DOPENCV_ENABLE_NONFREE=True ..

make -j4
sudo make install

sudo apt-get install -y curl 
