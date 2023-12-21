#!/usr/bin/env zsh
# source /home/drkknght/.zshrc
export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'
export PATH=/home/drkknght/.local/bin/:$PATH

if [ $1 = '0' ]
then
    monitor=$(swaymsg -t get_outputs | jq -r '.[].name' | sed -n 1,1p)
elif [ $1 = '1' ]
then
    monitor=$(swaymsg -t get_outputs | jr -r '.[].name' | sed -n 2,2p)
fi

if [ -z $monitor ] 
then
    notify-send "2nd monitor not found"
    exit
fi
monitor1=$1
# bgo=$(grep -Pi '^feh' ~/.fehbg | cut -d " " -f4 | cut -d  "'" -f2 )
# bgt=$(grep -Pi '^feh' ~/.fehbg | cut -d " " -f5 | cut -d "'" -f2 )
background=$(cat /home/drkknght/.cache/wallpaper.bg)

curret="$(fdfind '.+\.(jpg|jpeg)$' ~/Downloads ~/Pictures ~/Videos | fzf --cycle --prompt='change-background: ' --bind "tab:execute(swaymsg output ${monitor} bg {} fill &> /dev/null )")"

echo "picked" $curret
echo "bg1" $bgo
echo "bg2" $bgt

if [ -z "$curret" ]
then
    echo 'empty'
    exit
fi
echo "$curret" > /home/drkknght/.cache/wallpaper.bg

if [ ${monitor1} = 0 ]
then
    # sed -i -e "s|${wallpaper1}|file=${curret}|g" ~/.config/nitrogen/bg-saved.cfg
    # echo '1st monitor'
    echo "setting wallpaper for 1st monitor"
    echo "bg2 is set as" $bgt
    # feh --bg-fill "$curret" --bg-fill "$bgt"
    swaymsg output "$monitor" bg "$curret" fill
else
    echo "2st monitor"
    echo "bg1" $bgo
    swaymsg output "$monitor" bg "$curret" fill
    # feh --bg-fill "$bgo" --bg-fill "$curret"
fi
