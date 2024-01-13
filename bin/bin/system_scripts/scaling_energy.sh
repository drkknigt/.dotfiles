#!/usr/bin/env zsh

# source ~/.zshrc
which fdfind > /dev/null
if [ "$?" = "1" ]; then
    alias fdfind="fd"
fi
export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'
export PATH=$HOME/.local/bin/:$PATH
a=$(echo $(cat /sys/devices/system/cpu/cpu0/cpufreq/energy_performance_available_preferences | tr " " "\n" | fzf))
if [ -z "$a" ]; then 
    exit
fi
echo "$a" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/energy_performance_preference

