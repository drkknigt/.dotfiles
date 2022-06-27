if [ -z "$(tmux ls 2> /dev/null)" ] ; then exit 0 ; fi

selected_session=$(tmux ls | cut -d ":" -f 1 | fzf)
if [ -z $selected_session ] ; then exit 0 ; fi
tmux switch-client -t $selected_session 2> /dev/null  || tmux attach -t $selected_session 2> /dev/null




