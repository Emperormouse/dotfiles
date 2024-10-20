xrandr | grep "HDMI-1.* connected" && {
    xrandr  --output HDMI-1 --mode 1920x1080 --rotate normal --same-as eDP-1 
} || {
    xrandr --output HDMI-1 --off
}
