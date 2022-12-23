#!/usr/bin/env zsh  

wifi_status=$(nmcli radio wifi)
echo "$wifi_status"

if [ "$wifi_status" = "enabled" ]; then
    notify-send  "Wifi is switched off" "The internet will not work if no other type of connection is used" --icon=dialog-information
    nmcli radio wifi off
else 
    notify-send  "Wifi is switched on" "The default connnection will be used" --icon=dialog-information
    nmcli radio wifi on
fi
