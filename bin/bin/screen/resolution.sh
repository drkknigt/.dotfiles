#!/usr/bin/env zsh
# source ~/.zshrc
export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'
export PATH=$HOME/.local/bin/:$PATH

second_monitor=$(xrandr | grep "\bconnected\b" | grep "\bprimary\b" -v | cut -d" " -f1)
first_monitor=$(xrandr | grep "\bconnected\b" | grep "\bprimary\b" | cut -d" " -f1)

resolution_selected=$(echo "1920x1080\n1680x1050\n1400x900\n1280x1024\n1024x768\n800x600\n" | fzf)

if [ -z $resolution_selected ]
then
    exit
fi

resolution_value=$(echo "$resolution_selected" | cut -d" " -f1 | cut -d'"' -f1)

# xrandr --newmode $(echo $resolution_selected ) 2> /dev/null
if [ -z $second_monitor ] 
then
xrandr --addmode "$first_monitor" "$resolution_value"
xrandr --output "$first_monitor" --mode "$resolution_value"
exit
fi
echo "hi"
xrandr --addmode "$second_monitor" "$resolution_value"
xrandr --output "$second_monitor" --right-of "$first_monitor" --mode "$resolution_value" 
# ~/.fehbg
