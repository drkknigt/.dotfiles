#!/bin/sh
current_wm=$(wmctrl -m | grep -Po "wlroots|i3")
current_picture=$(cat ~/.cache/wallpaper.bg)
if [ "$current_wm" = "i3" ]; then
    feh --no-fehbg --bg-fill ${current_picture} ${current_picture}
    echo "hi"
elif [ "$current_wm" = "wlroots" ]; then
    swaymsg output eDP-1 bg "$current_picture" fill
    echo "hello"
fi

    
