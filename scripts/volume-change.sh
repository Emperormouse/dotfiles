#!/usr/bin/env bash

iv=$(pactl get-sink-volume @DEFAULT_SINK@ | grep "Volume" | cut -d'/' -f2 | tr -d ' ' | tr -d '%')
if [[ $1 == "+" ]] && [[ $(( $iv + $2 )) -lt 101 ]]; then
    pactl set-sink-volume @DEFAULT_SINK@ +$2%
    echo "$(pactl get-sink-volume @DEFAULT_SINK@ | grep "Volume" | cut -d'/' -f2 | tr -d ' ')" >> /tmp/volume
elif [[ $1 == "-" ]]; then
    pactl set-sink-volume @DEFAULT_SINK@ -$2%
    echo "$(pactl get-sink-volume @DEFAULT_SINK@ | grep "Volume" | cut -d'/' -f2 | tr -d ' ')" >> /tmp/volume
elif [[ $1 == "MUT" ]]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    if pactl get-sink-mute @DEFAULT_SINK@ | grep yes; then
        echo $1 >> /tmp/volume
    else
        echo "$(pactl get-sink-volume @DEFAULT_SINK@ | grep "Volume" | cut -d'/' -f2 | tr -d ' ')" >> /tmp/volume

    fi
fi

v="$(tail -1 /tmp/volume | tr -d '%')"
dunstify -h int:value:$v "Volume $v" --urgency=low -t 800 -r 1 

