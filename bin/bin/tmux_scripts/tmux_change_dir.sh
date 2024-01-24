#!/usr/bin/env zsh

# source ~/.zshrc
# source test.sh


is_active=$(echo $TMUX)

if [ -z "$is_active" ] ; then
    exit
fi

direc=$(find ~ -maxdepth 6 -type d |  fzf --cycle --prompt='change directory: ' --preview="tree -L 1 {} | batcat --theme='Monokai Extended Origin' --color=always" )
if [ -z "$direc" ]; then
    exit
fi
cd $direc

current_session_name=$(tmux display-message -p '#S')
latest_window=$(tmux list-windows -t $current_session_name | tail -n1 | awk -F":" '{ print $1 }')
tmux new-window -a -n Terminal -t $current_session_name
# tmux send-keys -t $current_session_name "cd $direc" C-m &> /dev/null
tmux select-window -t $current_session_name:$latest_window 
