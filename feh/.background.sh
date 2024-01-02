#!/bin/sh
current_wm=$(wmctrl -m | grep -Po "wlroots|i3")
current_picture=$(cat ~/.cache/wallpaper.bg)
if [ "$current_wm" = "i3" ]; then
    feh --no-fehbg --bg-fill ${current_picture} ${current_picture}
elif [ "$current_wm" = "wlroots" ]; then
    monitor=$(swaymsg -t get_outputs | jq -r '.[].name' | sed -n 1,1p)
    swaymsg output "$monitor" bg "$current_picture" fill
    # killall swaybg
    # swaybg -i "$current_picture" -m fill
fi

    
