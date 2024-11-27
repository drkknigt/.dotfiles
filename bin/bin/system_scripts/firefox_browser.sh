#!/bin/bash
if  pgrep -f xdg-desktop-portal-termfilechooser; then
    killall xdg-desktop-portal-termfilechooser
fi
/usr/lib/xdg-desktop-portal-termfilechooser &
firefox
