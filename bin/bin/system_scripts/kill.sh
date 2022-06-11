#!/usr/bin/env zsh
source /home/drkknght/.zshrc
pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

if [ "x$pid" != "x" ]
then
echo $pid | xargs kill -${1:-9}
# kill -9 $pid
fi
