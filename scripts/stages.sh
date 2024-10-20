#!/bin/bash
mode=0

nmap $1 > /tmp/1
while read line; do
    (( $mode == 1 )) &&
        ports+=$(printf $line 2> /dev/null | cut -d'/' -f1 | tr 'a-zA-Z' 'A' | grep -v 'A')' '
    grep -q "PORT" <(echo "$line") &&
        mode=1
done </tmp/1

ports=$(for port in $ports; do
    printf $port','
done)

nmap -A -p$ports $1
