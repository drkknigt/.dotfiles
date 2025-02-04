#!/usr/bin/env zsh

# This script is used to select and set the theme for wofi

# directories to search for themes
dirs=(/$HOME/.config/wofi/src/frappe/ /$HOME/.config/wofi/src/latte/ /$HOME/.config/wofi/src/macchiato/ /$HOME/.config/wofi/src/mocha/)

# select theme for wofi
selected_theme=$(fd . ${dirs[@]} -H  -t d  | awk -F'/' '{ print $(NF-2) "-" $(NF-1) }' | wofi --show dmenu)

# replace '-' with space
theme_name=$(echo $selected_theme | tr "-" " ")

# find the file with the theme name 
direc=$(grep -PiRl "$theme_name" $HOME/.config/wofi/src)

# set theme for wofi
cp "$direc" $HOME/.config/wofi/style.css -f
