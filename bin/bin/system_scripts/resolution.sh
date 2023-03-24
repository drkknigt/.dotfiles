#!/usr/bin/env zsh
source ~/.zshrc

second_monitor=$(xrandr | grep "\bconnected\b" | grep "\bprimary\b" -v | cut -d" " -f1)
first_monitor=$(xrandr | grep "\bconnected\b" | grep "\bprimary\b" | cut -d" " -f1)
resolution_selected=$(gtf $(echo "1366 768 60\n1280 720 60\n1024 768 60\n800 600 60" | fzf) | awk -F"Modeline" '{ print $2 }' | tr "\n" " " | xargs)
resolution_value=$(echo "$resolution_selected" | cut -d" " -f1 | cut -d'"' -f1)
xrandr --newmode $(echo $resolution_selected ) 2> /dev/null
xrandr --addmode "$second_monitor" "$resolution_value"
xrandr --output "$second_monitor" --right-of "$first_monitor" --mode "$resolution_value" --rate 60
~/.fehbg
