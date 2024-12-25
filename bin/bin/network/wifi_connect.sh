#!/usr/bin/env zsh  


# this script is used to turn wifi on and off

# exit script if nmcli is not found
if ! command -v nmcli 2>&1 >/dev/null; then
    notify-send  "Nmcli not found " "script will exit" --icon=dialog-information
    exit 1
fi
    
# wifi status enabled/disabled
wifi_status=$(nmcli radio wifi)

# turn wifi off if the wifi_status is enabled
if [ "$wifi_status" = "enabled" ]; then
    notify-send  "Wifi is switched off" "The internet will not work if no other type of connection is used" --icon=dialog-information
    nmcli radio wifi off
    
# turn wifi on if the wifi_status is disabled
else 
    notify-send  "Wifi is switched on" "The default connnection will be used" --icon=dialog-information
    nmcli radio wifi on
fi
