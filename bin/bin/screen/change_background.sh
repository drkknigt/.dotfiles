#!/usr/bin/env zsh

# Script to change the background of a specific monitor in i3wm

# Function to fetch the monitor name based on input (1 for primary, 2 for secondary)
get_monitor() {
    local monitor_index=$1
    i3-msg -t get_outputs | jq -r '.[] | select(.active == true).name' | sed -n "${monitor_index}p"
}

# Function to fetch the previous wallpaper paths from ~/.fehbg
get_previous_wallpapers() {
    local index=$1
    grep -Pi '^feh' ~/.fehbg | cut -d " " -f"$index" | tr -d "'"
}

monitor=$(get_monitor $1)

# Exit if monitor is not found
if [ -z "$monitor" ]; then
    notify-send "Error" "Monitor $1 not found." --icon=dialog-error
    exit 1
fi

# Retrieve previous wallpapers
prev_bg1=$(get_previous_wallpapers 4)
prev_bg2=$(get_previous_wallpapers 5)

# Prompt user to select a new wallpaper
selected_wallpaper=$(fdfind '.+\.(jpg|jpeg)$' ~/Pictures | \
    fzf --cycle \
        --prompt="Select new background: " \
        --bind="tab:execute(nitrogen --set-zoom-fill --head=$((monitor1 - 1)) {}),ctrl-o:toggle-preview+execute-silent(kitty +kitten icat --clear --stdin no --silent --transfer-mode file </dev/null >/dev/tty)" \
        --preview="preview_fzf.sh {}")

# Exit if no wallpaper is selected
if [ -z "$selected_wallpaper" ]; then
    echo "No wallpaper selected."
    exit 1
fi

# Save the selected wallpaper to cache (used by startup wm script: .brightness.sh to set wallpaper at login)
echo "$selected_wallpaper" > "$HOME/.cache/wallpaper.bg"

# Apply the wallpaper to the appropriate monitor
if [ "$1" -eq 1 ]; then
    feh --bg-fill "$selected_wallpaper" --bg-fill "$prev_bg2"
else
    feh --bg-fill "$prev_bg1" --bg-fill "$selected_wallpaper"
fi
