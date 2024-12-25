#!/usr/bin/env zsh

# Screen recording script

# Prompt to choose the save directory
save_dir=$(find $HOME -maxdepth 4 -type d | fzf --prompt="Choose save directory: ") || exit

# Generate filename with timestamp
file_name="recording-$(date +"%F-%H-%M-%S").mp4"

# Prompt to select audio device
audio_device=$(pactl list sources | grep Name | fzf --prompt="Choose audio device: " | cut -d ":" -f2) || exit

# Move terminal to workspace 9
swaymsg move container to workspace 9

# Record screen: full screen or selected area
if [[ "$1" == "s" ]]; then
    wf-recorder --audio="$audio_device" -f "$save_dir/$file_name"
else
    wf-recorder --audio="$audio_device" -g "$(slurp)" -f "$save_dir/$file_name" || echo "No geometry selected."
fi
