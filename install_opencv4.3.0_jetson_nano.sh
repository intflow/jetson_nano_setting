#!/bin/bash

#Reference
#https://pysource.com/2019/08/26/install-opencv-4-1-on-nvidia-jetson-nano/

#1. Updating the packages:
##sudo apt update
##sudo apt install -y build-essential cmake git libgtk2.0-dev pkg-config  libswscale-dev libtbb2 libtbb-dev
##sudo apt install -y python-dev python3-dev python-numpy python3-numpy
##sudo apt install -y curl

#2. Install video & image formats:
##sudo apt install -y  libjpeg-dev libpng-dev libtiff-dev libjasper-dev 
##sudo apt install -y libavcodec-dev libavformat-dev
##sudo apt install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
##sudo apt install -y libv4l-dev v4l-utils qv4l2 v4l2ucp libdc1394-22-dev

#3. Download OpenCV & Contribs Modules:
##curl -L https://github.com/opencv/opencv/archive/4.3.0.zip -o opencv-4.3.0.zip
##curl -L https://github.com/opencv/opencv_contrib/archive/4.3.0.zip -o opencv_contrib-4.3.0.zip

#4. Unzipping packages:
##unzip opencv-4.3.0.zip 
##unzip opencv_contrib-4.3.0.zip 
cd opencv-4.3.0/

#5. Create directory:
mkdir release
cd release
rm ../CMakeCache.txt

#6. Build Opencv using Cmake:
cmake  -D WITH_CUDA=ON \
	-D CUDA_ARCH_BIN="5.3" \
	-D CUDA_ARCH_PTX=""  \
	-D CUDA_FAST_MATH=1 \
        -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.3.0/modules \
        -D WITH_GSTREAMER=ON \
        -D WITH_LIBV4L=ON \
        -D BUILD_opencv_python3=ON \
        -D BUILD_TESTS=OFF \
        -D BUILD_PERF_TESTS=OFF \
        -D BUILD_EXAMPLES=ON \
        -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=/usr/local ..

#7. Compile the OpenCV with Contribs Modules:
make -j2
sudo make install
