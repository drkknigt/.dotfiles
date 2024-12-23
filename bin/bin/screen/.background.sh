#!/usr/bin/env zsh

# script is used to set up wallpaper and resolution at the start of startup

# current background 
current_picture=$(cat ~/.cache/wallpaper.bg)

setup_i3() {

    # monitor one name in i3wm
    monitor_one=$(i3-msg -t get_outputs | jq -r '.[] | select(.active == true).name' | sed -n 1p)

    # monitor two name in i3wm
    monitor_two=$(i3-msg -t get_outputs | jq -r '.[] | select(.active == true).name' | sed -n 2p)

    # set background in i3wm
    feh --no-fehbg --bg-fill ${current_picture} ${current_picture}

    # find the base resolution in i3wm
    base_resolution=$(xrandr | awk '/^\s*[0-9]/ { print $1 }' | head -n 1)

    # set resolutions for monitors
    xrandr --output "$monitor_one"  --mode "$base_resolution"  
    xrandr --output "$monitor_two" --right-of "$monitor_one" --mode "$base_resolution" 
}

setup_sway(){
    # monitor one name in sway
    monitor_one=$(swaymsg -t get_outputs | jq -r '.[] | select(.active == true) | .name' | sed -n 1p)

    # monitor two name in sway
    monitor_two=$(swaymsg -t get_outputs | jq -r '.[] | select(.active == true) | .name' | sed -n 2p)


    # base resolution made by combining height and width
    base_resolution=$(swaymsg -t get_outputs | jq --arg display "$monitor_one"  -r '.[] | select(.name == $display) | .current_mode.width, .current_mode.height' | sed 'N;s/\n/x/')

    # set resolution for monitors
    swaymsg output "$monitor_one" pos 0 0 res "$base_resolution" scale 1.5 bg "$current_picture" fill
    swaymsg output "$monitor_two" pos 0 0 res "$base_resolution" scale 1 bg "$current_picture" fill
}

# find current running window manager
current_wm=$(wmctrl -m | grep -Po "wlroots|i3")


# set background and resolution/scale for i3wm
if [ "$current_wm" = "wlroots" ]; then
    setup_sway
# set background and resolution/scale for sway
elif [ "$current_wm" = "i3" ]; then
    setup_i3
fi
exit
    
