#!/usr/bin/env bash

upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep 'percentage' | cut -d':' -f2 | tr -d ' '
