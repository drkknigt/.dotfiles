#!/usr/bin/env zsh
#
source ~/.zshrc
selected_directory=$(find ~ -mindepth 1 -maxdepth 6 -type d | fzf --prompt="make-session: ")

if [ -z "$selected_directory" ]; then exit 0;fi
session_name=$(basename $selected_directory | cut -d '.' -f 2)
if [ "$session_name" = "$(tmux ls 2> /dev/null | grep 'attached' | cut -d ':' -f 1)" ];
then
    echo "you are already in this session"
    exit 0
fi
tmux ls | grep -i "$session_name" &> /dev/null
if [ "0" = "$?" ]; then echo "session with this directory already running"; exit 0 ; fi


if [ -z "$TMUX" ]; then
    tmux new -s $session_name -c $selected_directory -n Main -d
    tmux setenv PROJECT_ROOT $selected_directory
    tmux new-window -n Terminal -t $session_name -c $selected_directory
    tmux select-window -t $session_name:1
    tmux send-keys -t $session_name "export PROJECT_ROOT=$selected_directory" C-m &> /dev/null
    tmux send-keys -t $session_name "cl" C-m &> /dev/null
    tmux send-keys -t $session_name:Main "nvim" C-m
    tmux attach -t $session_name
else
    tmux new -s $session_name -c $selected_directory -n Main -d
    tmux setenv PROJECT_ROOT $selected_directory
    tmux new-window -n Terminal -t $session_name -c $selected_directory
    tmux select-window -t $session_name:1
    tmux send-keys -t $session_name "export PROJECT_ROOT=$selected_directory" C-m &> /dev/null
    tmux send-keys -t $session_name "cl" C-m &> /dev/null
    tmux send-keys -t $session_name:Main "nvim" C-m
    tmux switch-client -t $session_name
fi
