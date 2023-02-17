#!/usr/bin/env zsh
source /home/drkknght/.zshrc
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

if [ ${monitor1} = 0 ]
then
    # sed -i -e "s|${wallpaper1}|file=${curret}|g" ~/.config/nitrogen/bg-saved.cfg
    # echo '1st monitor'
    echo "1st monitor"
    echo "bg2" $bgt
    feh --bg-fill "$curret" --bg-fill "$bgt"
else
    echo "2st monitor"
    echo "bg1" $bgo
    feh --bg-fill "$bgo" --bg-fill "$curret"
fi
