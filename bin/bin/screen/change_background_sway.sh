#!/usr/bin/env zsh

# This script is used to set the background of the monitor in sway window manager

# code to set wallpaper for monitor 1 or main monitor
if [ $1 = '0' ]
then
    monitor=$(swaymsg -t get_outputs | jq -r '.[].name' | sed -n 1,1p)
# code to set wallpaper for monitor 2 or secondary monitor
elif [ $1 = '1' ]
then
    monitor=$(swaymsg -t get_outputs | jr -r '.[].name' | sed -n 2,2p)
fi

# exit if the monitor is not found
if [ -z $monitor ] 
then
    notify-send "2nd monitor not found"
    exit
fi
monitor1=$1

# selected wallpaper
# curret="$(fdfind '.+\.(jpg|jpeg)$' ~/Downloads ~/Pictures ~/Videos | fzf --cycle --prompt='change-background: ' --bind "tab:execute(swaymsg output ${monitor} bg {} fill &> /dev/null )")"
curret="$(fdfind '.+\.(jpg|jpeg)$' ~/Downloads ~/Pictures ~/Videos | fzf --cycle --prompt='change-background: ' --bind "tab:execute(swaymsg output ${monitor} bg {} fill &> /dev/null ),ctrl-o:toggle-preview" --prompt="jump to position: " --preview="~/.dotfiles/lf/.config/lf/preview_fzf.sh {}")"


# if no wallpaper is choosen exit
if [ -z "$curret" ]
then
    echo 'empty'
    exit
fi

# write current choosen wallpaper to cache
echo "$curret" > $HOME/.cache/wallpaper.bg

# set wallpaper for monitor 1 or main monitor
if [ ${monitor1} = 0 ]
then
    # sed -i -e "s|${wallpaper1}|file=${curret}|g" ~/.config/nitrogen/bg-saved.cfg
    # echo '1st monitor'
    echo "setting wallpaper for 1st monitor"
    echo "bg2 is set as" $bgt
    swaymsg output "$monitor" bg "$curret" fill
    
# set wallpaper for monitor 2 or secondary monitor
else
    echo "2st monitor"
    echo "bg1" $bgo
    swaymsg output "$monitor" bg "$curret" fill
fi
