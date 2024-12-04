#!/bin/sh
# find current running window manager
current_wm=$(wmctrl -m | grep -Po "wlroots|i3")

# current background 

current_picture=$(cat ~/.cache/wallpaper.bg)

# set background and resolution/scale for i3wm
if [ "$current_wm" = "i3" ]; then

    # monitor one name in i3wm
    monitor_one=$(i3-msg -t get_outputs | jq -r '.[].name' | sed -n 1,1p)

    # monitor two name in i3wm
    monitor_two=$(i3-msg -t get_outputs | jq -r '.[].name' | sed -n 2,2p)

    # set background in i3wm
    feh --no-fehbg --bg-fill ${current_picture} ${current_picture}

    # find the base resolution in i3wm
    base_resolution=$(xrandr | awk '/^\s*[0-9]/ { print $1 }' | head -n 1)

    # set resolutions for monitors
    xrandr --output "$monitor_one"  --mode "$base_resolution"  
    xrandr --output "$monitor_two" --right-of "$monitor_one" --mode "$base_resolution" --rate 60 

# set background and resolution/scale for sway
elif [ "$current_wm" = "wlroots" ]; then

    # monitor one name in sway
    monitor_one=$(swaymsg -t get_outputs | jq -r '.[].name' | sed -n 1,1p)

    # monitor two name in sway
    monitor_two=$(swaymsg -t get_outputs | jq -r '.[].name' | sed -n 2,2p)

    # base height of the screen
    height=$(swaymsg -t get_outputs | jq -r '.[].modes[0].height')

    # base width of the screen
    width=$(swaymsg -t get_outputs | jq -r '.[].modes[0].width')

    # base resolution made by combining height and width
    base_resolution=$(echo "$width"x"$height")

    # set resolution for monitors
    swaymsg output "$monitor_one" pos 0 0 res "$base_resolution" scale 1.8 bg "$current_picture" fill
    # killall swaybg
    # swaybg -i "$current_picture" -m fill
fi

    
