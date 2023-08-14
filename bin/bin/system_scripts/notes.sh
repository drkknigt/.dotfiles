#!/usr/bin/env zsh

source ~/.zshrc
file_chosen=$(find ~/CS-course -type f -iname "*.norg" | fzf --delimiter / --with-nth -1)
if [ -z $file_chosen ] ; then
    exit
fi
nvim $file_chosen
