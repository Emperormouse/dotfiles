#!/usr/bin/env bash

while true; do
    bat=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep percentage: | cut -d':' -f2 | sed 's/ //' | sed 's/%//')
    echo $bat, $last_bat
    if [[ "$last_bat" -gt "10" ]]; then
        if [[ "$bat" -lt "11" ]]; then
            notify-send -w "Low Power"
            touch /tmp/ran
        fi
    fi
    last_bat=$bat
    sleep 20
done
