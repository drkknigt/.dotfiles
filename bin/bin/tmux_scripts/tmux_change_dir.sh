#!/usr/bin/env zsh

# This script is used to change directory in a new window pane using fzf

is_active=$(echo $TMUX)

# exit if not inside tmux
if [ -z "$is_active" ] ; then
    exit
fi

# select a directory using fzf and fdfind
direc=$(fdfind . ~  --type d -H -d 8 |  fzf --cycle --prompt='change directory: ' --preview="tree -L 1 {} | batcat --theme='Monokai Extended Origin' --color=always" )

# exit if direc is empty
if [ -z "$direc" ]; then
    exit
fi

# change directory
cd $direc

# change directory in a new window in tmux
current_session_name=$(tmux display-message -p '#S')
latest_window=$(tmux list-windows -t $current_session_name | grep 'active' | awk -F":" '{ print $1 }')
tmux new-window -a -n Terminal -t $current_session_name
# tmux send-keys -t $current_session_name "cd $direc" C-m &> /dev/null
tmux select-window -t $current_session_name:$latest_window 
