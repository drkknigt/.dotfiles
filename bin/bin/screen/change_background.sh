#!/usr/bin/env zsh

# This script is used to change the background of the desired monitor for i3wm

# select the monitor one or the main monitor
if [ $1 = '0' ]
then
    monitor=$(xrandr | grep -Pi '\bconnected\b' | sed -n 1,1p | cut -d " " -f1)
    
# select the monitor two or the secondary monitor
elif [ $1 = '1' ]
then
    monitor=$(xrandr | grep -Pi '\bconnected\b' | sed -n 2,2p | cut -d " " -f1)
fi

# exit if monitors are not found
if [ -z $monitor ] 
then
    notify-send "2nd monitor not found"
    exit
fi

# store the previous wallpaper paths in the bgo(backgroud-one) bgt(backgroud-two) variables
monitor1=$1
bgo=$(grep -Pi '^feh' ~/.fehbg | cut -d " " -f4 | cut -d  "'" -f2 )
bgt=$(grep -Pi '^feh' ~/.fehbg | cut -d " " -f5 | cut -d "'" -f2 )

# choose the current wallpaper
curret="$(fdfind '.+\.(jpg|jpeg)$' ~/Downloads ~/Pictures ~/Videos | fzf --cycle --prompt='change-background: ' --bind "tab:execute(nitrogen  --set-zoom-fill --head=${monitor1} {}),ctrl-o:toggle-preview" --prompt="jump to position: " --preview="~/.dotfiles/lf/.config/lf/preview_fzf.sh {}")"

# exit if no wallpaper is selected
if [ -z "$curret" ]
then
    echo 'empty'
    exit
fi


# write choosesn wallpaper to cache  to be used by sway if sway is used
echo "$curret" > $HOME/.cache/wallpaper.bg

# set wallpaper for the 1st monitor
if [ ${monitor1} = 0 ]
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
