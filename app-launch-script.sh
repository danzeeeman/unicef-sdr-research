#!/bin/bash

clear

smqueue=~/OpenBts/public/smqueue/trunk/smqueue
sipauthserve=~/OpenBts/public/subscriberRegistry/trunk
openbts=~/OpenBts/public/openbts/trunk/apps

echo "Launching OpenBTS components"

sudo ufw disable
sudo ifconfig eth0 192.168.10.1 netmask 255.255.255.0 promisc
uhd_find_devices

if [ uhd_find_device -eq "No UHD devices found" ]  #This doesnt really do anything.  Not sure how to test if uhd_find_devices works or not
then
        echo "Successfully found the USRP"

else
        echo "Unable to locate USRP"
        exit
fi

echo "Launching Smqueue"
echo $smqueue
cd $smqueue

gnome-terminal -e "sudo ./smqueue" --window-with-profile=stayopen  #This profile leaves the termial window open after running the command.

echo "Launching SipAuthServe"
cd $sipauthserve

gnome-terminal -e "sudo ./sipauthserve" --window-with-profile=stayopen

echo "intitializing"
sleep 5
echo "Launching OpenBTS"
cd $openbts

gnome-terminal -e "sudo ./OpenBTS" --window-with-profile=stayopen

sleep 15 #give OpenBTS a chance to launch

echo "OpenBTS Running"

gnome-terminal -e "sudo ./OpenBTSCLI" --window-with-profile=stayopen

echo "Everything is Running"
echo "The End"
