#!/bin/bash

current_battery_level=$(cat /sys/class/power_supply/BAT0/capacity)

while true
do
    if [ $current_battery_level < 20 ] ; then
        for i in {1..5} 
        do
            notify-send  "Battery low" "please plug in charger battery below 20%" --icon=dialog-information
            aplay ~/Music/alarm.wav
        done
        exit
    fi
    sleep 10
done
    
    

