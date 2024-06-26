#!/usr/bin/env zsh

# This script changes the resolution of the screen 

# second monitor 
second_monitor=$(xrandr | grep "\bconnected\b" | grep "\bprimary\b" -v | cut -d" " -f1)

# fist monitor
first_monitor=$(xrandr | grep "\bconnected\b" | grep "\bprimary\b" | cut -d" " -f1)

# list of resolution to change from 
resolution_selected=$(echo "1920x1080\n1680x1050\n1400x900\n1280x1024\n1024x768\n800x600\n" | fzf)

# if resolution_selected is empty and exit
if [ -z $resolution_selected ]
then
    exit
fi

# remove quotes from resolution
resolution_value=$(echo "$resolution_selected" | cut -d" " -f1 | cut -d'"' -f1)


# set resolution for 1st monitor when 2nd monitor is not setup
if [ -z $second_monitor ] 
then
    xrandr --addmode "$first_monitor" "$resolution_value"
    xrandr --output "$first_monitor" --mode "$resolution_value"
    exit
fi

# set resolution for 2nd monitor
    echo "hi"
    xrandr --addmode "$second_monitor" "$resolution_value"
    xrandr --output "$second_monitor" --right-of "$first_monitor" --mode "$resolution_value" 
# ~/.fehbg
