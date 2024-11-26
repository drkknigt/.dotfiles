#!/usr/bin/env zsh

# This script sets the scale value of the monitor in sway window manager

# select first monitor if the tui arg is 0
if [ $1 = '1' ]
then
    echo "first"
    monitor=$(swaymsg -t get_outputs | jq -r '.[].name' | sed -n 1,1p)
    
# select 2nd monitor if the tui arg is 1
elif [ $1 = '2' ]
then
    monitor=$(swaymsg -t get_outputs | jq -r '.[].name' | sed -n 2,2p)
fi

# exit if no monitor is found
if [ -z $monitor ] 
then
    notify-send "monitor $1 not found"
    exit
fi

# select value from -100 to 100 with the step of 10 using fzf
zoom_options=$(seq -100 10 100 |  awk '{print $0"% zoom"}' | fzf --prompt="scale display in percent: " | grep -oP '[+-]*\d+')

# if the zoom_options is not empty set the scale value for the monitors
if [[ -n $zoom_options ]]; then
    
  zoom_percentage=$(( -1 * $zoom_options ))
  scale_factor=$(echo "scale=1; (100+$zoom_percentage) / 100" | bc | grep -Pi "\d\.?\d*")
  echo "$scale_factor"
  echo "$monitor"
  swaymsg output "$monitor"  scale "$scale_factor"
  
fi

