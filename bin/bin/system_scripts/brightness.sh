#!/usr/bin/env zsh
source ~/.zshrc
amount_to_add=$1
current_brightness=$(sed -n 1p /sys/class/backlight/radeon_bl0/brightness)
echo $((current_brightness + amount_to_add)) > /sys/class/backlight/radeon_bl0/brightness
