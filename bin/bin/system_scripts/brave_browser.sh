#!/bin/bash
if  pgrep -f xdg-desktop-portal-termfilechooser; then
    killall xdg-desktop-portal-termfilechooser
fi
/usr/lib/xdg-desktop-portal-termfilechooser &
if grep -Piq 'arch' /etc/os-release ; then
    brave-browser
else
    brave
fi
