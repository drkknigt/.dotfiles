#!/usr/bin/env zsh

# This scripts sets the cpu governor 


# select the cpu governors from the list using fzf
selected_governor=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors | tr ' ' '\n' | fzf --prompt="select a governor: ")

# if no governor is selected exit
if [[ -z $selected_governor ]]; then
    exit
fi


#  set cpu governor using cpupower
which cpufreq-set > /dev/null
if [ "$?" = "1" ]; then
    sudo cpupower -c all frequency-set --governor $selected_governor &> /dev/null

    # persist the cpu governor at startup
    sudo sed -i "s/^#\?governor.*/governor=$selected_governor/g"  /etc/default/cpupower
    exit
fi

# if cpupower is not installed set governors via cpufreq-set
for i in {0..7} ; do
    sudo cpufreq-set -c $i -g $selected_governor
    echo "GOVERNOR=$selected_governor"  | sudo tee /etc/default/cpufrequtils &> /dev/null
done
