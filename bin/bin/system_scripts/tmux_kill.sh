#!/bin/bash
if [ -z "$TMUX" ] ; then exit 0;fi
current_sessions=$(tmux ls | cut -d ":" -f 1 | tr "\n" " ")
selected_session=$(tmux ls | grep 'attached' | cut -d ':' -f 1)
some_func(){
    total_sessions=$#
    current_session=0
    while [ $current_session -lt $total_sessions ] 
    do
        echo $((current_session))
        current_session=$((current_session+1))
    done
}

some_func $current_sessions
