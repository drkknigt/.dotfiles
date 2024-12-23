#!/usr/bin/env zsh

# Show the Governor, kernel, path info  

# cpu driver info
cpu_driver=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver)

# amd pstate status
amd_pstate_status=$(cat /sys/devices/system/cpu/amd_pstate/status)

# current cpu governor 
cpu_governor=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)


# Cpu energy_performance_preference status if currently active
if [ -f /sys/devices/system/cpu/cpu0/cpufreq/energy_performance_preference ]; then
    cpu_energy_performance_preference=$(cat /sys/devices/system/cpu/cpu0/cpufreq/energy_performance_preference)
else
    cpu_energy_performance_preference=$(echo "amd_pstate_epp not running")
fi


# Collect system information
kernel_info=$(uname -s -r -v)

# write all the variables to ~/cpu_info.txt file and also add $PATHS to it
echo "Cpu-driver :                            $cpu_driver" > ~/cpu_info.txt    
echo "Amd-pstate-status :                     $amd_pstate_status" >> ~/cpu_info.txt
echo "Cpu-Governor :                          $cpu_governor" >> ~/cpu_info.txt
echo "cpu-energy-performance-preference :     $cpu_energy_performance_preference" >> ~/cpu_info.txt
echo "Kernel in use :                         $kernel_info" >> ~/cpu_info.txt
echo "\nPATHS ARE AS FOLLOWS: \n" >> ~/cpu_info.txt
echo $PATH | tr ":" "\n" | nl -w 2 -s ": " >> ~/cpu_info.txt

#display file in glow in pager mode
glow -p ~/cpu_info.txt







