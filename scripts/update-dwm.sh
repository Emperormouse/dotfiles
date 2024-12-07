#/usr/bin/sh

cd ~/src/dwm/
make && sudo make clean install
killall dwm
