#!/usr/bin/env zsh

# This script is used to change the background of the desired monitor for i3wm

# select the monitor one or the main monitor
if [ $1 = '1' ]
then
    monitor=$(xrandr | grep -Pi '\bconnected\b' | sed -n 1,1p | cut -d " " -f1)
    
# select the monitor two or the secondary monitor
elif [ $1 = '2' ]
then
    monitor=$(xrandr | grep -Pi '\bconnected\b' | sed -n 2,2p | cut -d " " -f1)
fi

# exit if monitors are not found
if [ -z $monitor ] 
then
    notify-send "monitor $1 not found"
    exit
fi

# store the previous wallpaper paths in the bgo(backgroud-one) bgt(backgroud-two) variables
monitor1=$1
bgo=$(grep -Pi '^feh' ~/.fehbg | cut -d " " -f4 | cut -d  "'" -f2 )
bgt=$(grep -Pi '^feh' ~/.fehbg | cut -d " " -f5 | cut -d "'" -f2 )

# choose the current wallpaper
curret="$(fdfind '.+\.(jpg|jpeg)$' ~/Downloads ~/Pictures ~/Videos | fzf --cycle --prompt='change-background: ' --bind "tab:execute(nitrogen  --set-zoom-fill --head=${monitor1} {}),ctrl-o:toggle-preview+execute-silent(kitty +kitten icat --clear --stdin no --silent --transfer-mode file </dev/null >/dev/tty)" --preview="preview_fzf.sh {}")"

# exit if no wallpaper is selected
if [ -z "$curret" ]
then
    echo 'empty'
    exit
fi


# write choosesn wallpaper to cache  to be used by sway or i3wm at the startup
echo "$curret" > $HOME/.cache/wallpaper.bg

# set wallpaper for the 1st monitor
if [ ${monitor1} = 1 ]
then
    # sed -i -e "s|${wallpaper1}|file=${curret}|g" ~/.config/nitrogen/bg-saved.cfg
    # echo '1st monitor'
    echo "setting wallpaper for 1st monitor"
    echo "bg2 is set as" $bgt
    feh --bg-fill "$curret" --bg-fill "$bgt"
    
# set wallpaper for the 2nd monitor
else
    echo "2st monitor"
    echo "bg1" $bgo
    feh --bg-fill "$bgo" --bg-fill "$curret"
fi
