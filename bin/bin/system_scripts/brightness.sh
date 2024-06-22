#!/bin/sh

# set brightness 
brightnessctl set $(grep -Pi '\d+%' $HOME/.cache/bright.sav -o)

