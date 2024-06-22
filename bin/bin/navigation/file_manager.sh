#!/usr/bin/env zsh

# This script is used to open lf file manager for wm and tmux or from terminal

working_dir=$(pwd)

# set initial variables
alias lf=lfrun
current_dir_flag=$1

# run lf from wm
if [ "$current_dir_flag" = "2" ] ; then
    export LF_RUNNING="true"
    lfrun "$HOME"
    exit
fi


# run lf in terminal outside tmux
if [ -z "$TMUX" ] ; then
    
    # run lf in terminal outside tmux in home directory
    if [ "$current_dir_flag" = "0" ] ; then
        lf "$HOME"
        
    # run lf in terminal outside tmux in current directory
    else
        lf "$(pwd)"
    fi
    
# run lf in terminal inside tmux
else
    
    # run lf in terminal inside tmux in directory where tmux was launched using tmux_create script
    if [ "$current_dir_flag" = "0" ] ; then
        lf "$PROJECT_DIR"
        
    # run lf in terminal inside tmux in home directory
    else
        
        lf "$HOME"
    fi
    exit
fi
