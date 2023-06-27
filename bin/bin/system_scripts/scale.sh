#!/usr/bin/env zsh
source ~/.zshrc

if [ $1 = '0' ]
then
    monitor=$(xrandr | grep -Pi '\bconnected\b' | sed -n 1,1p | cut -d " " -f1)
elif [ $1 = '1' ]
then
    $monitor=$(xrandr | grep -Pi '\bconnected\b' | sed -n 2,2p | cut -d " " -f1)
fi

zoom_options=$(seq -100 10 100 |  awk '{print $0"% zoom"}' | fzf --prompt="scale display in percent: " | grep -oP '[+-]*\d+')

if [[ -n $zoom_options ]]; then
    
  zoom_percentage=$(( -1 * $zoom_options ))
  scale_factor=$(echo "scale=1; (100+$zoom_percentage) / 100" | bc)
  xrandr --output eDP --scale "$scale_factorx$scale_factor"
  
fi

