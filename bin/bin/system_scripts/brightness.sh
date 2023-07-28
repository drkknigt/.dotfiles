#!/usr/bin/env zsh
source ~/.zshrc
amount_to_add=$1
graphics_card=$(ls /sys/class/backlight/)
current_brightness=$(sed -n 1p /sys/class/backlight/$graphics_card/brightness)
echo $((current_brightness + amount_to_add)) > /sys/class/backlight/$graphics_card/brightness
