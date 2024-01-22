#!/usr/bin/env zsh

# source ~/.zshrc
which fdfind > /dev/null
if [ "$?" = "1" ]; then
    alias fdfind="fd"
fi
export FZF_DEFAULT_COMMAND='fdfind . --absolute-path --hidden'
export FZF_DEFAULT_OPTS='--layout=reverse --border=sharp'
export PATH=$HOME/.local/bin/:$PATH

selected_governor=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors | tr ' ' '\n' | fzf --prompt="select a governor: ")
if [[ -z $selected_governor ]]; then
    exit
fi
which cpufreq-set > /dev/null
if [ "$?" = "1" ]; then
    sudo cpupower -c all frequency-set --governor $selected_governor &> /dev/null
    sudo sed -i "s/^#\?governor.*/governor=$selected_governor/g"  /etc/default/cpupower
    exit
fi

for i in {0..7} ; do
    sudo cpufreq-set -c $i -g $selected_governor
done
