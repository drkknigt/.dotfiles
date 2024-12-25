#!/usr/bin/env zsh

# This script is used to open lf file manager for wm and tmux or from terminal

# variable that distinguishes lf running as browser file picker or as simple file manager
export browser_run=""

# set initial variables
current_dir_flag=$1

# open lf in window manager as file manager
run_lf_in_wm() {
    alias lf=lfrun
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
