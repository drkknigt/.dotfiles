#!/usr/bin/env zsh

source ~/.zshrc

selected_governor=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors | tr ' ' '\n' | fzf --prompt="select a governor: ")
if [[ -z $selected_governor ]]; then
    exit
fi
for i in {0..7} ; do
    sudo cpufreq-set -c $i -g $selected_governor
done
