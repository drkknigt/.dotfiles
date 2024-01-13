#!/usr/bin/env zsh
# source ~/.zshrc
which fdfind > /dev/null
if [ "$?" = "1" ]; then
    alias fdfind="fd"
fi
export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'
export PATH=$HOME/.local/bin/:$PATH

if [ $1 = '0' ]
then
    echo "first"
    monitor=$(swaymsg -t get_outputs | jq -r '.[].name' | sed -n 1,1p)
elif [ $1 = '1' ]
then
    monitor=$(swaymsg -t get_outputs | jq -r '.[].name' | sed -n 2,2p)
fi

if [ -z $monitor ] 
then
    notify-send "2nd monitor not found"
    exit
fi

zoom_options=$(seq -100 10 100 |  awk '{print $0"% zoom"}' | fzf --prompt="scale display in percent: " | grep -oP '[+-]*\d+')

if [[ -n $zoom_options ]]; then
    
  zoom_percentage=$(( -1 * $zoom_options ))
  scale_factor=$(echo "scale=1; (100+$zoom_percentage) / 100" | bc | grep -Pi "\d\.?\d*")
  echo "$scale_factor"
  echo "$monitor"
  # xrandr --output eDP --scale "$scale_factorx$scale_factor"
  swaymsg output "$monitor"  scale "$scale_factor"
  
fi

