if [ -z "$(tmux ls 2> /dev/null)" ] ; then exit 0 ; fi

selected_session=$(tmux ls | cut -d ":" -f 1 | fzf --prompt="switch session: " --preview="tmux list-windows -t {} | batcat --theme='Monokai Extended Origin' --color=always")
if [ -z $selected_session ] ; then exit 0 ; fi
if [ -z $TMUX ]; then
    tmux attach -t $selected_session
else
    tmux switch-client -t $selected_session 
fi




