#!/usr/bin/env zsh
# source /home/drkknght/.zshrc
export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'
pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

if [ "x$pid" != "x" ]
then
echo $pid | xargs kill -${1:-9}
# kill -9 $pid
fi
