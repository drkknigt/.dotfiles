#!/bin/bash
# script runs brave browser and enables lf as file picker for brave

# kill all instances of termfilechooser
if  pgrep -f xdg-desktop-portal-termfilechooser; then
    killall xdg-desktop-portal-termfilechooser
fi

# start termfilechooser
/usr/lib/xdg-desktop-portal-termfilechooser &

# run brave
if grep -Piq 'arch' /etc/os-release ; then
    brave-browser
else
    brave
fi
