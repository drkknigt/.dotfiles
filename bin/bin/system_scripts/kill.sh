#!/usr/bin/env zsh

# This script is used to kill processes by signal passed as $1 or sigkill if $1 is empty

# get the pid of the application from currently running applications
pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

# kill the application if by the pid choosen
if [ "x$pid" != "x" ]; then
    # kill the pid with sigkill if no signal is specified as $1 arg
    echo $pid | xargs kill -${1:-9}
fi
