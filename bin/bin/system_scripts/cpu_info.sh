#!/usr/bin/env zsh

cpu_driver=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver)

amd_pstate_status=$(cat /sys/devices/system/cpu/amd_pstate/status)

cpu_governor=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)


if [ -f /sys/devices/system/cpu/cpu0/cpufreq/energy_performance_preference ]; then
    cpu_energy_performance_preference=$(cat /sys/devices/system/cpu/cpu0/cpufreq/energy_performance_preference)
else
    cpu_energy_performance_preference=$(echo "amd_pstate_epp not running")
fi

echo "Cpu-driver : $cpu_driver" > ~/cpu_info.txt
echo "Amd-pstate-status : $amd_pstate_status" >> ~/cpu_info.txt
echo "Cpu-Governor : $cpu_governor" >> ~/cpu_info.txt
echo "cpu-energy-performance-preference : $cpu_energy_performance_preference" >> ~/cpu_info.txt

/home/drkknght/usr/bin/glow -p ~/cpu_info.txt







