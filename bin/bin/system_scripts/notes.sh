#!/usr/bin/env zsh

# open notes in nvim

file_chosen=$(find ~/Notes -type f | fzf --delimiter / --with-nth -1)
if [ -z $file_chosen ] ; then
    i3-msg workspace back_and_forth
    exit
fi
nvim $file_chosen
