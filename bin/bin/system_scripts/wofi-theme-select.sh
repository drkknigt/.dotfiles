#!/usr/bin/env zsh
selected_theme=$(find /home/drkknght/.config/wofi/src -type d | awk -F "src" '{ print $2 }' | tr "/" "-" | sed 's/^\-//' | sed 's/^mocha$\|^latte$\|^frappe$\|macchiato$//' | awk NF | wofi --show dmenu)
theme_name=$(echo $selected_theme | tr "-" " ")

direc=$(grep -PiRl "$theme_name" /home/drkknght/.config/wofi/src)
cp "$direc" /home/drkknght/.config/wofi/style.css -f
