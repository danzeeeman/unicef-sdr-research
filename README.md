unicef-sdr-research
===================

This is a REPO for our UNICEF SDR Research 




#### Ettus Reseach B100 Bring Up Guide

Ubuntu UHD Drivers Install

    sudo bash -c 'echo "deb http://files.ettus.com/binaries/uhd_stable/repo/uhd/ubuntu/`lsb_release -cs` `lsb_release -cs` main" > /etc/apt/sources.list.d/ettus.list'
    sudo apt-get update
    sudo apt-get install -t `lsb_release -cs` uhd
