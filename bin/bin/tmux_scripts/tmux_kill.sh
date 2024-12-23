#!/usr/bin/env zsh

# This script is used to kill tmux sessions

# exit if tmux server is not running
tmux ls &> /dev/null

if [[ "$?" = "1" ]]; then
    echo "empty tmux! exiting"
    exit
fi

# set vars for tmux sessions
selected_session=$(tmux ls |  cut -d ":" -f1  | fzf --cycle --prompt="select session to delete: ")
current_sessions=$(tmux ls |  cut -d ":" -f1 )
total_sessions=$(tmux ls | wc -l )
active_session=$(tmux ls | grep attached | cut -d ":" -f1 )

# exit if no session is selected to delete
if [[ -z "$selected_session" ]]; then
    exit
fi

#  kill selected session
if [[ "$selected_session" = "$active_session" ]]; then
    selected_session_no=$(tmux ls | nl -w 1 -s "| " | grep "$selected_session" |  cut -d "|" -f1 )
    echo $selected_session_no
    echo $total_sessions
    if [[ "$selected_session_no" = "$total_sessions" ]]; then
        new_session_name=$(tmux ls | nl -w 1 -s "| " | grep "1|" | cut -d "|" -f2 | cut -d ":" -f1)
        tmux switch-client -t "$new_session_name"
        tmux kill-session -t "$selected_session"
    else
        new_session_no=$((selected_session_no + 1))
        new_session_name=$(tmux ls | nl -w 1 -s "| " | grep "$new_session_no|" | cut -d "|" -f2 | cut -d ":" -f1)
        tmux switch-client -t "$new_session_name"
        tmux kill-session -t "$selected_session"
    fi
else
        tmux kill-session -t "$selected_session"
fi

    
    

