#!/usr/bin/env zsh

# This script changes the resolution of the screen  in i3wm


# Function to get connected outputs
get_outputs() {
    xrandr | grep " connected" | awk '{print $1}'
}


# find total connected monitors
monitor_count=$(get_outputs | wc -l)


# select monitor to change resolution
if [ "$monitor_count" -gt "1" ]; then
    output=$(get_outputs | fzf --prompt="Select monitor: " --cycle)

    if [[ -z "$output" ]]; then
        echo "No output selected. Exiting."
        exit 1
    fi
else
    output=$(get_outputs)
fi


# choose resolution value from fzf
resolution_selected=$(xrandr | awk '/^\s*[0-9]/ { print $1 }' | fzf --prompt="change resolution: " --cycle)

# exit if resolution_selected is exit
if [ -z $resolution_selected ]; then
    exit
fi

#
xrandr --output "$output" --mode "$resolution_selected" 
