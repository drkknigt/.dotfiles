#!/usr/bin/env zsh
selected_theme=$(find $HOME/.config/wofi/src -type d | awk -F "src" '{ print $2 }' | tr "/" "-" | sed 's/^\-//' | sed 's/^mocha$\|^latte$\|^frappe$\|macchiato$//' | awk NF | wofi --show dmenu)
theme_name=$(echo $selected_theme | tr "-" " ")

direc=$(grep -PiRl "$theme_name" $HOME/.config/wofi/src)
cp "$direc" $HOME/.config/wofi/style.css -f
