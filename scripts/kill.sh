#!/usr/bin/env bash
processes=$(ps -aux | awk '{print $11}' | grep -v '\[\|\]\|COMMAND\|sd-pam\|sort\|rev\|awk\|uniq' | sort | uniq | rev | cut -d'/' -f1 | rev)

echo "$processes" | dmenu "$@" | xargs -I% killall %

