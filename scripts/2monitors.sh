
[[ -z $WAYLAND_DISPLAY ]] && {
    case $1 in
        "above")
            par=above;;
        "right")
            par=right-of;;
        "left")
            par=left-of;;
        *)
            par=same-as;;
    esac

    xrandr | grep "HDMI-1.* connected" || {
        xrandr --output HDMI-1 --off
        exit
    }
    xrandr --output HDMI-1 --mode 1920x1080 --rotate normal --"$par" eDP-1 
} || {
    case $1 in
        "above")
            par="0,-1080";;
        "right")
            par="1920,0";;
        "left")
            par="-1920,0";;
        *)
            par="0,0";;
    esac

    wlr-randr --output eDP-1 --pos 0,0
    wlr-randr --output HDMI-A-1 --pos "$par"
}

