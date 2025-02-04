#!/usr/bin/env zsh

# This scripts sets the cpu governor 


# select the cpu governors from the list using fzf or exit if nothing is selected
selected_governor=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors | tr ' ' '\n' | fzf --prompt="select a governor: ") || exit

#  set cpu governor using cpupower
if ! command -v cpufeq-set > /dev/null; then
    sudo cpupower -c all frequency-set --governor $selected_governor &> /dev/null

    # persist the cpu governor at startup
    sudo sed -i "s/^#\?governor.*/governor=$selected_governor/g"  /etc/default/cpupower
else
    # if cpupower is not installed set governors via cpufreq-set
    for i in {0..$(nproc)} ; do sudo cpufreq-set -c $i -g $selected_governor; done
    echo "GOVERNOR=$selected_governor"  | sudo tee /etc/default/cpufrequtils &> /dev/null
fi
