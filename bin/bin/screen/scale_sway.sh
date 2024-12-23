#!/usr/bin/env zsh

# This script sets the scale value of the monitor in the Sway window manager.

# Function to get the monitor name based on the input argument (0 for the first monitor, 1 for the second monitor)
get_monitor_name() {
    local monitor_index=$1
    monitor_name=$(swaymsg -t get_outputs | jq -r '.[].name' | sed -n "${monitor_index}"p)
}

# Function to calculate the scale factor based on zoom percentage
calculate_scale_factor() {
    local zoom_percentage=$1
    scale_factor=$(echo "scale=1; (100+$zoom_percentage) / 100" | bc | grep -Pi "\d\.?\d*")
}

# Function to select zoom percentage using fzf
select_zoom_percentage() {
    zoom_percentage=$(seq 100 -10 -100 | awk '{print $0"% zoom"}' | fzf --prompt="Scale display in percent: " | grep -oP '[+-]*\d+')
    zoom_percent=$(( 1 * $zoom_percentage ))
}

# Main script execution starts here
get_monitor_name $1

# Exit if no monitor is found
if [ -z "$monitor_name" ]; then
    notify-send "Error" "monitor $1 not found" --icon=dialog-error
    exit 1
fi

# Select zoom percentage from -100 to 100 using fzf
select_zoom_percentage

# If a zoom value is selected, calculate and apply the scale factor
if [ -n "$zoom_percent" ]; then
    calculate_scale_factor "$zoom_percent"
    swaymsg output "$monitor_name" scale "$scale_factor"
fi

