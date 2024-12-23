#!/usr/bin/env zsh

# This script gives man pages and then displays them

# select man page list of man pages
choosen_page=$(man -k . | fzf --prompt="man pages: " | awk -F" " '{ print $1 }')

# exit if no page is selected
if [ -z "$choosen_page" ]; then
    exit
fi
man "$choosen_page"
