#!/usr/bin/env zsh

# This script is used to open lf file manager for wm and tmux or from terminal

# variable that distinguishes lf running as browser file picke or as simple file manager
export browser_run=""

working_dir=$(pwd)

# set initial variables
alias lf=lfrun
current_dir_flag=$1

# run lf from wm
if [ "$current_dir_flag" = "2" ] ; then
    # variable used to switch workspace back to previous workspace after killing lfrun
    export LF_RUNNING="true"
    lfrun "$HOME"
    exit
fi


# run lf in terminal outside tmux
if [ -z "$TMUX" ] ; then
    
    # open lf in home dirctory if opened with 0 as $1 arg
    if [ "$current_dir_flag" = "0" ] ; then
        lf "$HOME"
        
    # open lf in current dirctory if opened with $1 not equal to 0
    else
        lf "$(pwd)"
    fi
    
# run lf in terminal inside tmux
else
    
# run lf in terminal inside tmux in directory where tmux was launched using tmux_create script
    # open lf in tmux project dirctory if opened with 0 as $1 arg
    if [ "$current_dir_flag" = "0" ] ; then
        lf "$PROJECT_DIR"
        
    # open lf in current dirctory if opened with $1 not equal to 0
    else
        
        lf "$(pwd)"
    fi
    exit
fi
