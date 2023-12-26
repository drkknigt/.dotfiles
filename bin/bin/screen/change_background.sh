#!/usr/bin/env zsh
export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'
export PATH=$HOME/.local/bin/:$PATH

if [ $1 = '0' ]
then
    monitor=$(xrandr | grep -Pi '\bconnected\b' | sed -n 1,1p | cut -d " " -f1)
elif [ $1 = '1' ]
then
    monitor=$(xrandr | grep -Pi '\bconnected\b' | sed -n 2,2p | cut -d " " -f1)
fi

if [ -z $monitor ] 
then
    notify-send "2nd monitor not found"
    exit
fi
monitor1=$1
bgo=$(grep -Pi '^feh' ~/.fehbg | cut -d " " -f4 | cut -d  "'" -f2 )
bgt=$(grep -Pi '^feh' ~/.fehbg | cut -d " " -f5 | cut -d "'" -f2 )

curret="$(fdfind '.+\.(jpg|jpeg)$' ~/Downloads ~/Pictures ~/Videos | fzf --cycle --prompt='change-background: ' --bind "tab:execute(nitrogen  --set-zoom-fill --head=${monitor1} {})")"

echo "picked" $curret
echo "bg1" $bgo
echo "bg2" $bgt

if [ -z "$curret" ]
then
    echo 'empty'
    exit
fi
echo "$curret" > $HOME/.cache/wallpaper.bg

if [ ${monitor1} = 0 ]
then
    # sed -i -e "s|${wallpaper1}|file=${curret}|g" ~/.config/nitrogen/bg-saved.cfg
    # echo '1st monitor'
    echo "setting wallpaper for 1st monitor"
    echo "bg2 is set as" $bgt
    feh --bg-fill "$curret" --bg-fill "$bgt"
else
    echo "2st monitor"
    echo "bg1" $bgo
    feh --bg-fill "$bgo" --bg-fill "$curret"
fi
