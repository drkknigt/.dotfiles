#!/usr/bin/env zsh

# This script creates a new tmux session  in any direcotry or load from earlier created session

# make cache file 
recent_flag=$1
mkdir ~/.cache/tmux -p
touch ~/.cache/tmux/recent_dirs

# create session in any dir in $HOME
if [ "$recent_flag" = "0" ] ; then
    
selected_directory=$(find ~ -mindepth 1 -maxdepth 6 -type d | fzf --cycle --prompt="make-session: "  --bind "ctrl-f:preview-down,ctrl-u:preview-up" --bind "ctrl-o:toggle-preview" --preview="tree -L 1 {} | batcat --theme='Monokai Extended Origin' --color=always" --preview-window hidden)

# create recently created sessions
elif [ "$recent_flag" = "1" ] ; then
    
selected_directory=$(cat ~/.cache/tmux/recent_dirs | fzf --cycle --prompt="make-session: "  --bind "ctrl-f:preview-down,ctrl-u:preview-up" --bind "ctrl-o:toggle-preview" --preview="tree -L 1 {} | batcat --theme='Monokai Extended Origin' --color=always" --preview-window hidden)

elif [ "$recent_flag" = "3" ] ; then
    selected_directory=$(pwd)
else
    exit
fi
    

# exit if session directory is empty
if [ -z "$selected_directory" ]; then clear;exit 0;fi

# create a session name for session

name_first_part=$(basename $(dirname "$selected_directory"))
name_second_part=$(basename "$selected_directory" | tr "." "_")
session_name="${name_first_part}/${name_second_part}"

# check if session is already running
if [ "$session_name" = "$(tmux ls 2> /dev/null | grep 'attached' | cut -d ':' -f 1)" ];
then
    echo "you are already in this session"
    exit 0
fi

# check if tmux already as session you are about to create
tmux has -t "$session_name" > /dev/null
if [ "0" = "$?" ]; then echo "session with this directory already running"; exit 0 ; fi

echo $selected_directory
# check if selected directory is valid
if [ ! -d  "$selected_directory" ]; then echo "not a dir"; exit 0 ; fi

grep -x $selected_directory  ~/.cache/tmux/recent_dirs &> /dev/null

if [ "$?" = "1" ]; then
    echo $selected_directory >> ~/.cache/tmux/recent_dirs
fi



if [ -z "$TMUX" ]; then
    tmux new -s $session_name -c $selected_directory -n Main -d
    tmux setenv PROJECT_ROOT $selected_directory
    tmux new-window -n Terminal -t $session_name -c $selected_directory
    tmux select-window -t $session_name:1
    tmux send-keys -t $session_name "export PROJECT_ROOT=$selected_directory" C-m &> /dev/null
    tmux send-keys -t $session_name "clear" C-m &> /dev/null
    tmux send-keys -t $session_name:Main "nvim" C-m
    tmux attach -t $session_name
else
    tmux new -s $session_name -c $selected_directory -n Main -d
    tmux setenv PROJECT_ROOT $selected_directory
    tmux new-window -n Terminal -t $session_name -c $selected_directory
    tmux select-window -t $session_name:1
    tmux send-keys -t $session_name "export PROJECT_ROOT=$selected_directory" C-m &> /dev/null
    tmux send-keys -t $session_name "clear" C-m &> /dev/null
    tmux send-keys -t $session_name:Main "nvim" C-m
    tmux switch-client -t $session_name
fi
