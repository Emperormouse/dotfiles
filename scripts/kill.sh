#!/usr/bin/env bash
dmenu_cmd=$([[ $WAYLAND_DISPLAY == "" ]] && printf "dmenu" || printf "dmenu-wl")

processes=$(ps -aux | awk '{print $11}' | grep -v '\[\|\]\|COMMAND\|sd-pam\|sort\|rev\|awk\|uniq' | sort | uniq | rev | cut -d'/' -f1 | rev)

echo "$processes" | $dmenu_cmd "$@" | xargs -I% killall %

