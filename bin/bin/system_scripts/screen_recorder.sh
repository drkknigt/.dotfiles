#!/usr/bin/env zsh


choose_directory=$(find $HOME -maxdepth 4 -type d | fzf --prompt="choose directory to save: ")
if [ -z "$choose_directory" ]; then
    exit
fi
date_now=$(date +"%F-%H-%M-%S")
file_name="file-$date_now"
device=$(pactl list sources | grep Name |  fzf --prompt="choose audio service: " | cut -d ":" -f2)
if [ -z "$device" ]; then
    exit
fi
echo "$choose_directory/$file_name"
echo "$device"

swaymsg move container to workspace 9
wf-recorder --audio="$device" -f "$choose_directory/$file_name.mp4"
