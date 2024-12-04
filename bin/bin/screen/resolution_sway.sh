#!/usr/bin/env zsh

# This script is used to set the resolution for the sway 

# set 1st monitor
first_monitor=$(swaymsg -t get_outputs | jq -r '.[].name' | sed -n 1,1p)


# set 2nd monitor
second_monitor=$(swaymsg -t get_outputs | jq -r '.[].name' | sed -n 2,2p)

# choose resolution value from fzf
resolution_selected=$(wlr-randr | awk '/^\s*[0-9]/ { print $1 }' | fzf --prompt="change resolution")

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
    swaymsg -- output "$first_monitor" mode --custom "$resolution_selected"
    swaymsg output "$first_monitor" pos 0 0 res "$resolution_selected" scale "$scale_no"
    exit
fi

# set resolution for 2nd monitor
swaymsg output "$second_monitor" pos 0 0 res "$resolution_selected" scale "$scale_no"
swaymsg -- output "$second_monitor" mode --custom "$resolution_selected"
