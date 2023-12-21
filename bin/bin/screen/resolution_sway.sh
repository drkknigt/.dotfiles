#!/usr/bin/env zsh
# source ~/.zshrc
export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'
export PATH=/home/drkknght/.local/bin/:$PATH

first_monitor=$(swaymsg -t get_outputs | jq -r '.[].name' | sed -n 1,1p)
second_monitor=$(swaymsg -t get_outputs | jq -r '.[].name' | sed -n 2,2p)

resolution_selected=$(echo "1920x1080\n1680x1050\n1400x900\n1280x1024\n1024x768\n800x600\n" | fzf)

if [ -z $resolution_selected ]
then
    exit
fi

# resolution_value=$(echo "$resolution_selected" | cut -d" " -f1 | cut -d'"' -f1)
echo $resolution_selected
scale_no=$(swaymsg -t get_outputs | grep -Pi 'scale":' | grep -Pi "\d\.?\d+" -o)
#
# # xrandr --newmode $(echo $resolution_selected ) 2> /dev/null
if [ -z $second_monitor ] 
then
# xrandr --addmode "$first_monitor" "$resolution_value"
# xrandr --output "$first_monitor" --mode "$resolution_value"
swaymsg output "$first_monitor" pos 0 0 res "$resolution_selected" scale "$scale_no"
exit
fi
echo "hi"
# xrandr --addmode "$second_monitor" "$resolution_value"
# xrandr --output "$second_monitor" --right-of "$first_monitor" --mode "$resolution_value" --rate 60
swaymsg output "$second_monitor" pos 0 0 res "$resolution_selected" scale "$scale_no"
# # ~/.fehbg
