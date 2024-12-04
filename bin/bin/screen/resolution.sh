#!/usr/bin/env zsh

# This script changes the resolution of the screen 

# second monitor 
second_monitor=$(i3-msg -t get_outputs | jq -r '.[].name' | sed -n 2,2p)

# fist monitor
first_monitor=$(i3-msg -t get_outputs | jq -r '.[].name' | sed -n 1,1p)

# list of resolution to change from 
resolution_selected=$(xrandr | awk '/^\s*[0-9]/ { print $1 }' | fzf --prompt="change resolution")

# if resolution_selected is empty and exit
if [ -z $resolution_selected ]
then
    exit
fi

# remove quotes from resolution
resolution_value=$(echo "$resolution_selected" | cut -d" " -f1 | cut -d'"' -f1)


# set resolution for 1st monitor when 2nd monitor is not setup
xrandr --addmode "$first_monitor" "$resolution_value"
xrandr --output "$first_monitor" --mode "$resolution_value"
xrandr --addmode "$second_monitor" "$resolution_value"
xrandr --output "$second_monitor" --right-of "$first_monitor" --mode "$resolution_value" 
