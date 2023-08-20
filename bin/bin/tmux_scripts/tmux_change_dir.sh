#!/usr/bin/env zsh

source ~/.zshrc

is_active=$(echo $TMUX)

if [ -z "$is_active" ] ; then
    exit
fi

current_session_name=$(tmux display-message -p '#S')

tmux new-window -n Terminal -t $current_session_name
tmux send-keys -t $current_session_name "cdd1" C-m &> /dev/null
