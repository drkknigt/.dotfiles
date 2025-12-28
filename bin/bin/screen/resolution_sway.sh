#!/usr/bin/env zsh

# This script is used to set the resolution for the sway 

# Function to get connected outputs
get_outputs() {
    swaymsg -t get_outputs | jq -r '.[] | select(.active == true).name'
}

# find total connected monitors
select_monitor() {
    monitor_count=$(get_outputs | wc -l)

    if [ "$monitor_count" -gt "1" ]; then
        output=$(get_outputs | fzf --prompt="Select monitor: " --cycle)

        if [[ -z "$output" ]]; then
            echo "No output selected. Exiting."
            exit 1
        fi
    else
        output=$(get_outputs)
    fi
}

# select custom resolution for sway
custom_res() {
    resolutions=( "3840x2160" "3440x1440" "2560x1600" "2560x1400" "2048x1536" "2048x1152" "1920x1200" "1920x1080" "1680x1050" "1600x1200" "1600x900" "1536x864" "1440x900" "1366x768" "1360x768" "1280x1020" "1280x800" "1280x720" "1024x768" "800x600" "640x480" "640x360")
# Resolution selection using fzf
    resolution_selected=$(printf "%s\n" "${resolutions[@]}" | fzf --prompt="Select custom resolution: " --cycle)
# exit if no resolution selected
    if [ -z $resolution_selected ]; then
        exit
    fi
# set custom resolution for 2nd monitor
    swaymsg -- output "$output" mode --custom "$resolution_selected" 
    exit
}

# select monitor to change resolution
select_monitor

# main 
if [ "$1" = "custom" ] ; then
    custom_res
else
    # choose resolution value from fzf
    resolution_selected=$(wlr-randr | awk '/^\s*[0-9]/ { print $1 }' | fzf --prompt="change resolution: " --cycle)   
    # exit if resolution_selected is exit
if [ -z $resolution_selected ]; then
    exit
fi
    swaymsg output "$output" pos 0 0 res "$resolution_selected"  transform normal
fi
