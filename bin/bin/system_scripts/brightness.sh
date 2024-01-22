#!/bin/sh

brightnessctl set $(grep -Pi '\d+%' $HOME/.cache/bright.sav -o)

