#!/usr/bin/env zsh


# This script is used to set the scale value for the screen in i3wm


# Select the first monitor
get_monitor() {
  local monitor_index=$1
  i3-msg -t get_outputs | jq -r '.[] | select(.active == true).name' | sed -n "${monitor_index}p"
}
monitor=$(get_monitor $1)

# exit if no monitor is found
if [ -z $monitor ] 
then
    notify-send "monitor $1 not found"
    exit
fi

# choose value from -100 to 100 with gap of 10 
zoom_options=$(seq 100 -10 -100 |  awk '{print $0"% zoom"}' | fzf --prompt="scale display in percent: " | grep -oP '[+-]*\d+')

# if zoom_options variable is not empty then set teh zoom for the  monitor
if [[ -n $zoom_options ]]; then
    
  zoom_percentage=$(( -1 * $zoom_options ))
  scale_factor=$(echo "scale=1; (100+$zoom_percentage) / 100" | bc)
  xrandr --output "$monitor" --scale "$scale_factor"
  
fi

