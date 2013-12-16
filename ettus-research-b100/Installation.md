unicef-sdr-research
===================

This is a REPO for our UNICEF SDR Research 




#### Ettus Reseach B100 Bring Up Guide

#####Saucy Salamander (13.10)

Saucy Salamander has a particular problem with PyQT and PyQWT. First, apt-get the following packages to get start. We will then manually build and install PyQT and PyQWT to get around the issue.

	sudo apt-get -y install git-core cmake g++ python-dev swig \
	pkg-config libfftw3-dev libboost1.53-all-dev libcppunit-dev libgsl0-dev \
	libusb-dev libsdl1.2-dev python-wxgtk2.8 python-numpy \
	python-cheetah python-lxml doxygen libxi-dev python-sip \
	libqt4-opengl-dev libqwt-dev libfontconfig1-dev libxrender-dev \
	libgruel3.6.1

If you have PyQWT installed already, remove it:
	$ sudo apt-get remove python-qwt5-qt4

Make sure SIP is installed:
	$ sudo apt-get install python-sip python-sip-dev

We'll set up a separate directory to install into to make it keep it nicely separated from anything else (in case Ubuntu fixes this problem).
	$ sudo mkdir /opt/qt

First, set up your environment

Edit ./bashrc by adding or amending the following variables:

	export PATH=/opt/qt/bin:$PATH
	export LD_LIBRARY_PATH=/opt/qt/lib:/usr/local/lib:$LD_LIBRARY_PATH
	export PYTHONPATH=/opt/qt/lib/python2.7/dist-packages:$PYTHONPATH
	export PKG_CONFIG_PATH=/opt/qt/lib/pkgconfig:$PKG_CONFIG_PATH

Either restart the terminal or reset your environment:
	$ source ~/.bashrc

Download and install PyQt version 4.10.3
http://www.riverbankcomputing.com/software/pyqt/download

	$ tar xzf PyQt-x11-gpl-4.10.3.tar.gz
	$ cd PyQt-x11-gpl-4.10.3
	$ python configure.py -b /opt/qt/bin -d /opt/qt/lib/python2.7/dist-packages -v /opt/qt/share/sip
	$ make
	$ sudo make install

Download and install PyQWT version 5.2.0
http://pyqwt.sourceforge.net/download.html

	$ tar xzf PyQwt-5.2.0.tar.gz
	$ cd PyQwt-5.2.0/configure
	$ ./configure.py -Q ../qwt-5.2 --module-install-path=/opt/qt/lib/python2.7/dist-packages/PyQt4/Qwt5
	$ make
	$ sudo make install

If you've already built GNU Radio, first delete CMakeCache.txt in the top build directory. You should then only have to 'make clean' in gr-qtgui.

Run cmake and make like you would normally. With the environmental variables pointing to the new PyQT and PyQWT versions we've installed all gr-qtui displays and widgets should work properly now.

#### GNU Radio Install on Mac OSX 10.9 Mavericks

Download and install Xcode Version 5.0.2+ from the Apple App Store.  You will need to install the Xcode Command Line Tools which can be also be downloaded from the Apple App Store or run the command:

	$ sudo xcode-select --install
	$ sudo xcodebuild -license

Install Macports 2.2.1 - http://www.macports.org/install.php

Download and install XQuartz - http://xquartz.macosforge.org/landing/

	$ port install gr-osmsdr
	$ port info gnuradio
	$ port install gnuradio +full
	
After this is complete, you should be able to run GNU Companion by using the command:

	$ gnuradio-companion
	
This is based on the tutorial found [here.](http://penturalabs.wordpress.com/2013/09/14/gnuradio-osx-installation-guide/)
