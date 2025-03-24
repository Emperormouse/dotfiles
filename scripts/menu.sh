#!/usr/bin/env bash

items='''bluetooth
network'''

choice=$(echo "$items" | dmenu "$@")

case $choice in
    "bluetooth")
        blueberry;;
    "network")
        networkmanager_dmenu -l 16 "$@";;
esac

