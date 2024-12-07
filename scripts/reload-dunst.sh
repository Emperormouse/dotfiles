killall dunst; dunst &  
dunstify "$2"
{
sleep 5
killall dunst; dunst -conf ~/.config/dunst/volume-dunst &  
} &


