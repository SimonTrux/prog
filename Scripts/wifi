#!/bin/sh
AIRPORT="en0"; #may be en0, use networksetup -listallhardwareports to check
WIFI_NETWORK_NAME="Freebox-A47 5Ghz"
WIFI_PASSWORD="backbeat69andabanana"
 
networksetup -setairportpower $AIRPORT off
networksetup -setairportpower $AIRPORT on
sleep 2
 
if networksetup -getairportnetwork $AIRPORT | grep -i -a "$WIFI_NETWORK_NAME" ;
then
    echo 'Connection WIFI reussie !';
    exit 0
fi
 
if networksetup -setairportnetwork $AIRPORT "$WIFI_NETWORK_NAME" $WIFI_PASSWORD | grep -i -a "Failed" ;
then
    echo 'Erreur de connection, nouvelle tentative.';
    networksetup -setairportpower $AIRPORT off
    networksetup -setairportpower $AIRPORT on
    sleep 1
fi
 
networksetup -getairportnetwork $AIRPORT
 
exit 0;

exit
