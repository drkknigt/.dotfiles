#!/usr/bin/env zsh

# script is used to switch the basic file picker for browsers

# check if portals is configured for lf as file picker or zenity as file picker
grep -q 'default' $HOME/.dotfiles/xdg-desktop-portal/.config/xdg-desktop-portal/portals.conf

# if check gave exit code of 1 i.e zenity is default switch to lf
if [ "$?" = 1  ]; then
    printf "[preferred]\ndefault=wlr\norg.freedesktop.impl.portal.FileChooser=termfilechooser" > $HOME/.dotfiles/xdg-desktop-portal/.config/xdg-desktop-portal/portals.conf
    notify-send  "default picker for browser switched to lf";
else
# if check gave exit code of 0 i.e lf is default switch to zenity
    printf "" > $HOME/.dotfiles/xdg-desktop-portal/.config/xdg-desktop-portal/portals.conf
    notify-send  "default picker for browser switched to zenity";
fi

#restart xdg-desktop-portal.service
systemctl  --user restart xdg-desktop-portal.service

