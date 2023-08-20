#!/usr/bin/env zsh
source ~/.zshrc

# check if there is any active tmux sessions
active_sessions=$(tmux ls)
if [ -z $active_sessions ] ; then
    echo "no active session"
    exit
fi

selected_session=$(echo $active_sessions | awk -F":" '{ print $1 }' | fzf --prompt="kill session: " --preview="tmux list-windows -t {}")

# if [ -z $selected_session ]; then
    # exit
# fi

# for i in $(echo $tmux_active | awk -F":" '{ print $1 }' | tr '\n' ' '); do echo $i ; done
echo $tmux_active | awk -F":" '{ print $1 }' | tr '\n' ' '

# if [ -z "$TMUX" ] ; then tmux kill-session -t $selected_session; fi
# current_sessions=$(tmux ls | cut -d ":" -f 1 | tr "\n" " ")
# selected_session=$(tmux ls | grep 'attached' | cut -d ':' -f 1)
# some_func(){
#     total_sessions=$#
#     current_session=0
#     while [ $current_session -lt $total_sessions ] 
#     do
#         echo $((current_session))
#         current_session=$((current_session+1))
#     done
# }
#
# some_func $current_sessions
