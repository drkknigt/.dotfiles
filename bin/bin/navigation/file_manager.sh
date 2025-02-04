#!/usr/bin/env zsh

# This script is used to open lf file manager in wm or in tmux or in terminal

# This env variable distinguishes if lf is running as browser file picker or as simple file manager , and is used later for functionality in lf
# Script that starts lf as browser file picker sets the value for browser_run as "running"
export browser_run=""

# set initial variables
current_dir_flag=$1

# open lf in window manager as file manager
run_lf_in_wm() {

    alias lf=lfrun

    # this env variable is true only if lf runs from window manager keybind
    export LF_RUNNING="true"
    lfrun "$HOME"
    exit
}

# open lf in terminal 
run_lf_in_term() {
    local base_dir=${PROJECT_ROOT:-"$HOME"}

    if [ "$1" = "0" ] ; then
    # open lf in PROJECT_ROOT of tmux if tmux is active else open in $HOME
        lf "$base_dir"
    # open lf in current dirctory if opened with $1 not equal to 0
    else
        lf "$(pwd)"
    fi
}

case "$current_dir_flag" in 
    2) run_lf_in_wm;;
    *) run_lf_in_term $current_dir_flag
esac
