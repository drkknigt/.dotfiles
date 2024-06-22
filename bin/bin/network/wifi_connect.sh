#!/usr/bin/env zsh  


# this script is used to turn wifi on and off

wifi_status=$(nmcli radio wifi)
echo "$wifi_status"

# turn wifi off if the wifi_status is enabled
if [ "$wifi_status" = "enabled" ]; then
    notify-send  "Wifi is switched off" "The internet will not work if no other type of connection is used" --icon=dialog-information
    nmcli radio wifi off
    
# turn wifi on if the wifi_status is disabled
else 
    notify-send  "Wifi is switched on" "The default connnection will be used" --icon=dialog-information
    nmcli radio wifi on
fi
