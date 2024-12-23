#!/usr/bin/env zsh


# This script is used to set the scaling energy_performance_preference for amd_pstate active

# select the energey preference 
scaling_energy=$(echo $(cat /sys/devices/system/cpu/cpu0/cpufreq/energy_performance_available_preferences | tr " " "\n" | fzf --prompt="scaling energy type: "))

# exit if no energy prefernce is selected
if [ -z "$scaling_energy" ]; then 
    exit
fi

# set the energy preference
echo "$scaling_energy" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/energy_performance_preference
