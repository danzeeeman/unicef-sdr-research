#!/bin/bash

clear

smqueue=~/OpenBts/public/smqueue/trunk/smqueue
sipauthserve=~/OpenBts/public/subscriberRegistry/trunk
openbts=~/OpenBts/public/openbts/trunk/apps
telesource=~/www/telesource

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

echo "OpenBTS is now running"
gnome-terminal -e "sudo ./OpenBTSCLI"

echo "Launching Asterisk"
gnome-terminal -e "sudo asterisk -vvvvvvvvr"

echo "Launching Telesource server"
cd $telesource
gnome-terminal -e "foreman run nodemon app.coffee" # Run the telesource server
sleep 8

echo "Open browser"
gnome-terminal -e "chromium-browser localhost:5000"

echo "The End"
