#!/usr/bin/env zsh


choose_directory=$(find $HOME -maxdepth 4 -type d | fzf)
if [ -z "$choose_directory" ]; then
    exit
fi
date_now=$(date +"%F-%H-%M-%S")
file_name="file-$date_now"
device=$(pactl list sources | grep Name |  fzf | cut -d ":" -f2)
echo "$choose_directory/$file_name"
echo "$device"

swaymsg move container to workspace 9
wf-recorder --audio="$device" -f "$choose_directory/$file_name.mp4"
