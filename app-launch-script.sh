#!/bin/bash

clear

smqueue=~/OpenBts/public/smqueue/trunk/smqueue
sipauthserve=~/OpenBts/public/subscriberRegistry/trunk
openbts=~/OpenBts/public/openbts/trunk/apps

echo "Launching OpenBTS components"

sudo ufw disable
sudo ifconfig eth0 192.168.10.1 netmask 255.255.255.0 promisc
uhd_find_devices

if uhd_find_devices  #if this command is successful, then continue, if not STOP!
then
        echo "Successfully found the USRP"

else
        echo "Unable to locate USRP"
        exit
fi

echo "Launching Smqueue"
cd $smqueue

gnome-terminal -e "sudo ./smqueue"

echo "Launching SipAuthServe"
cd $sipauthserve
gnome-terminal -e "sudo ./sipauthserve"

sleep 5
echo "Launching OpenBTS"
cd $openbts

gnome-terminal -e "sudo ./OpenBTS"

sleep 15 #give OpenBTS a chance to launch
echo "OpenBTS Running"

gnome-terminal -e "sudo ./OpenBTSCLI"

echo "Everything is Running"

gnome-terminal -e "sudo asterisk -vvvvvvvvr"

echo "The End"
