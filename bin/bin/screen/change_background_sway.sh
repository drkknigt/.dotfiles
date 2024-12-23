#!/usr/bin/env zsh

# Script to set the background of a monitor in the Sway window manager

# Function to get monitor name based on input (1 for primary, 2 for secondary)
get_monitor() {
    local monitor_index=$1
    swaymsg -t get_outputs | jq -r '.[].name' | sed -n "${monitor_index}p"
}

monitor=$(get_monitor $1)

# Exit if the monitor is not found
if [ -z "$monitor" ]; then
    notify-send "Error" "Monitor $1 not found." --icon=dialog-error
    exit 1
fi

# Select a new wallpaper using fzf
selected_wallpaper=$(fdfind '.+\.(jpg|jpeg)$' ~/Pictures | \
    fzf --cycle \
        --prompt="Change Background: " \
        --bind="tab:execute(swaymsg output ${monitor} bg {} fill &> /dev/null),ctrl-o:toggle-preview+execute-silent(kitty +kitten icat --clear --stdin no --silent --transfer-mode file </dev/null >/dev/tty)" \
        --preview="preview_fzf.sh {}")

# Exit if no wallpaper is selected
if [ -z "$selected_wallpaper" ]; then
    notify-send "No Wallpaper Selected" "You did not select any wallpaper." --icon=dialog-information
    exit 0
fi

# Cache the selected wallpaper for use on Sway startup
echo "$selected_wallpaper" > "$HOME/.cache/wallpaper.bg"

# Set the wallpaper for the selected monitor
swaymsg output "$monitor" bg "$selected_wallpaper" fill
