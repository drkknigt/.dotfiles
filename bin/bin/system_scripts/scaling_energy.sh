#!/usr/bin/env zsh

# source ~/.zshrc
export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'
export PATH=$HOME/.local/bin/:$PATH
a=$(echo $(cat /sys/devices/system/cpu/cpu0/cpufreq/energy_performance_available_preferences | tr " " "\n" | fzf --prompt="scaling energy type: "))
if [ -z "$a" ]; then 
    exit
fi
echo "$a" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/energy_performance_preference

