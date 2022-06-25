#!/usr/bin/env zsh
#
# if [[ $# -eq 1 ]]; then
#     selected=$1
# else
#     selected=$(find ~/bin . /home/ ~/.config/nvim ~/path/PATH_1/programming-1,python/projcts/ ~/path -mindepth 1 -maxdepth 1 -type d | fzf --prompt='make-session: ')
# fi
#
# if [[ -z $selected ]]; then
#     exit 0
# fi
#
# selected_name=$(basename "$selected" | tr . _)
# tmux_running=$(pgrep tmux)
#
# if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
#     tmux new-session -s $selected_name -n main -c $selected -d
#     tmux new-window -n terminal -t $selected_name
#     tmux send-keys -t $selected_name "cd $selected" C-m
#     tmux send-keys -t $selected_name "clear" C-m
#     tmux select-window -t $selected_name:1
#      tmux switch-client -t $selected_name 2> /dev/null || tmux attach -t $selected_name 
#     # tmux new-window -n terminal -t $selected_name
#     exit 0
# fi
#
# if ! tmux has-session -t $selected_name 2> /dev/null; then
#     tmux new-session -ds $selected_name -n main -c $selected -d
#     tmux new-window -n terminal -t $selected_name
#     tmux select-window -t $selected_name:1
#      tmux switch-client -t $selected_name 2> /dev/null || tmux attach -t $selected_name 
# fi
#
# tmux switch-client -t $selected_name 2> /dev/null || tmux attach -t $selected_name

directories='~'
selected_directory=$(find ~ -mindepth 1 -maxdepth 6 -type d | fzf --prompt="make-session: ")

echo $selected_directory
echo $(basename $selected_directory)
session_name=$(basename $selected_directory | cut -d '.' -f 2)
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
