#!/usr/bin/env bash

iv=$(pactl get-sink-volume @DEFAULT_SINK@ | grep "Volume" | cut -d'/' -f2 | tr -d ' ' | tr -d '%')
[[ $1 == '+' ]] && [[ $(( $iv + $2 )) -lt 101 ]] &&
    pactl set-sink-volume @DEFAULT_SINK@ +$2%
[[ $1 == '-' ]] &&
    pactl set-sink-volume @DEFAULT_SINK@ -$2%

echo "$(pactl get-sink-volume @DEFAULT_SINK@ | grep "Volume" | cut -d'/' -f2 | tr -d ' ')" >> /tmp/volume

