#!/usr/bin/env zsh

selected_directory=$(find ~ -mindepth 1 -maxdepth 6 -type d | fzf --prompt="make-session: ")

echo $selected_directory
echo $(basename $selected_directory)
session_name=$(basename $selected_directory | cut -d '.' -f 2)
if [ -z "$selected_directory" ]; then exit 0;fi
if [ "$session_name" = "$(tmux ls 2> /dev/null | grep 'attached' | cut -d ':' -f 1)" ];
then
    exit 0
fi


if [ -z "$TMUX" ]; then
    tmux new -s $session_name -c $selected_directory -n Main -d
    tmux new-window -n Terminal -t $session_name -c $selected_directory
    tmux select-window -t $session_name:1
    tmux send-keys -t $session_name:Main "nvim" C-m
    tmux attach -t $session_name
else
    tmux new -s $session_name -c $selected_directory -n Main -d
    tmux new-window -n Terminal -t $session_name -c $selected_directory
    tmux select-window -t $session_name:1
    tmux send-keys -t $session_name:Main "nvim" C-m
    tmux switch-client -t $session_name
fi
