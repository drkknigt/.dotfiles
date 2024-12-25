#!/usr/bin/env zsh

# This script is used to kill processes by signal passed as $1 or sigkill if $1 is empty

# get the pid of the application from currently running applications
output=$(ps -ef | sed 1d | fzf -m )

# user owning the process
user=$(echo $output | awk '{ print $1 }')

# pid of the process
pid=$(echo $output | awk '{ print $2 }')

# kill the application by the pid choosen
if [ "x$pid" != "x" ]; then
    # kill the pid with sigkill if no signal is specified as $1 arg
    if [ "$user" = "root" ]; then
        # use sudo if root is the owner
        echo $pid | xargs sudo kill -${1:-9}
    else
        echo $pid | xargs kill -${1:-9}
    fi

fi
