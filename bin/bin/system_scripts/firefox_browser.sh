#!/bin/bash

# script runs firefox and enables lf as file picker for brave


# kill all instances of termfilechooser
if  pgrep -f xdg-desktop-portal-termfilechooser; then
    killall xdg-desktop-portal-termfilechooser
fi

# start termfilechooser
/usr/lib/xdg-desktop-portal-termfilechooser &

# start firefox
firefox
