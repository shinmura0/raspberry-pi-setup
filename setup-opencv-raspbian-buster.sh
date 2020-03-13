#!/bin/bash
# Raspbian Buster with desktop 2019-09-26
# Reference:
# https://qiita.com/masaru/items/658b24b0806144cfeb1c

# install apt-get package
apt_get_install(){
	sudo apt-get update
	sudo apt-get install -y libhdf5-dev libhdf5-serial-dev libhdf5-100
	sudo apt-get install -y libqtgui4 libqtwebkit4 libqt4-test python3-pyqt5
	sudo apt-get install -y libatlas-base-dev
	sudo apt-get install -y libjasper-dev
}

# install keras
install_keras(){
	sudo pip3 install -U pip
	sudo pip3 install -U setuptools
	sudo pip3 install wrapt --upgrade --ignore-installed
	sudo pip3 install --default-timeout=1000 tensorflow==1.14.0
	sudo apt-get install -y python3-h5py
	sudo pip3 install keras==2.2.4
}

# install Open CV
install_opencv(){
	sudo pip3 --default-timeout=1000 install opencv-python==3.4.6.27
}

# install others
install_others(){
	sudo apt-get install qt5-default pyqt5-dev pyqt5-dev-tools
	sudo pip3 install pyqtgraph
	sudo pip3 install datetime
	sudo apt-get install python3-matplotlib
	sudo apt-get install python3-pyaudio
	sudo apt-get install python3-pyqt5
	sudo apt-get install python3-scipy
	sudo pip3 install scikit-learn==0.19.2
}

START_TIME=`date +%s`

# change directory here
cd `dirname $0`

apt_get_install
install_keras
install_opencv
install_others

END_TIME=`date +%s`

SS=`expr ${END_TIME} - ${START_TIME}`
HH=`expr ${SS} / 3600`
SS=`expr ${SS} % 3600`
MM=`expr ${SS} / 60`
SS=`expr ${SS} % 60`

echo "Total Time: ${HH}:${MM}:${SS} (h:m:s)"
