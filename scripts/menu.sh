items='''bluetooth
network'''

choice=$(echo "$items" | dmenu -sb "$THEME_COLOR" -sf "#000000" -nb "$THEME_BG")

case $choice in
    "bluetooth")
        blueman-manager;;
    "network")
        networkmanager_dmenu -l 8 -sb "$THEME_COLOR" -sf "#000000" -nb "$THEME_BG";;
esac

