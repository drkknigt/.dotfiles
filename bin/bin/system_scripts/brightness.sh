#!/bin/sh

# this scripts sets the brightness value at the startup of sway/i3wm , it reads from ~/.cache/bright.sav file
# bight.sav file is  generated everytime brightness bindings are used in sway/i3wm

# set brightness 
brightnessctl set $(grep -Pi '\d+%' $HOME/.cache/bright.sav -o)

