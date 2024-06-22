#!/usr/bin/env zsh

# This script is used to set the resolution for the sway 

# set 1st monitor
first_monitor=$(swaymsg -t get_outputs | jq -r '.[].name' | sed -n 1,1p)


# set 2nd monitor
second_monitor=$(swaymsg -t get_outputs | jq -r '.[].name' | sed -n 2,2p)

# choose resolution value from fzf
resolution_selected=$(echo "1920x1080\n1680x1050\n1400x900\n1280x1024\n1024x768\n800x600\n" | fzf)

# exit if resolution_selected is exit
if [ -z $resolution_selected ]
then
    exit
fi

echo $resolution_selected
# find the scale number
scale_no=$(swaymsg -t get_outputs | grep -Pi 'scale":' | grep -Pi "\d\.?\d+" -o)
echo "$first_monitor"
# set resolution for 1st monitor
if [ -z $second_monitor ] 
then
    swaymsg output "$first_monitor" pos 0 0 res "$resolution_selected" scale "$scale_no"
    exit
fi

# set resolution for 2nd monitor
swaymsg output "$second_monitor" pos 0 0 res "$resolution_selected" scale "$scale_no"
