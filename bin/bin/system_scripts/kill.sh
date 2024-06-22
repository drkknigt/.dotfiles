#!/usr/bin/env zsh

# This script is used to kill applications

# get the pid of the application from currently running applications
pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

# kill the application
if [ "x$pid" != "x" ]
then
    echo $pid | xargs kill -${1:-9}
fi
