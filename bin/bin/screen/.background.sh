#!/bin/sh
# find current running window manager
current_wm=$(wmctrl -m | grep -Po "wlroots|i3")

# current background 

current_picture=$(cat ~/.cache/wallpaper.bg)

# set background and resolution/scale for i3wm
if [ "$current_wm" = "i3" ]; then
    monitor_one=$(i3-msg -t get_outputs | jq -r '.[].name' | sed -n 1,1p)
    monitor_two=$(i3-msg -t get_outputs | jq -r '.[].name' | sed -n 2,2p)
    feh --no-fehbg --bg-fill ${current_picture} ${current_picture}
    xrandr --output "$monitor_one"  --mode 1920x1080  
    xrandr --output "$monitor_two" --right-of "$monitor_one" --mode 1920x1080 --rate 60 

# set background and resolution/scale for sway
elif [ "$current_wm" = "wlroots" ]; then
    monitor=$(swaymsg -t get_outputs | jq -r '.[].name' | sed -n 1,1p)
    swaymsg output "$monitor" pos 0 0 res 1920x1080 scale 1.8 bg "$current_picture" fill
    # killall swaybg
    # swaybg -i "$current_picture" -m fill
fi

    
