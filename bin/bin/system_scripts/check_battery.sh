#!/bin/bash
while true
do
    current_battery_level=$(cat /sys/class/power_supply/BAT0/capacity)
    if [[ (( "$current_battery_level" < "20" )) ]] &&  ! on_ac_power  ; then
        for i in {1..5} 
        do
            notify-send  "Battery low" "please plug in charger battery below 20%" --icon=dialog-information
            aplay ~/Music/alarm.wav
        done
    fi
    sleep 10
done
    
    

