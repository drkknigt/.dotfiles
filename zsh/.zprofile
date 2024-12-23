# .zprofile sets the env for the login shell and runs only when user logs in 
if [ -z $TMUX ]; then
    source ~/.zsh_paths
    export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
    export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp -m'
fi
