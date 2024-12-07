#!/usr/bin/bash

sed -i '/^$/d' ~/data/site_history
site=$(tail ~/data/site_history | dmenu -sb "#8ABEB7" -sf "#000000") ||
    exit
grep "$site" ~/data/site_history &&
    sed -i "/$site/d" ~/data/site_history
tmp=$(cat ~/data/site_history)
echo "$site" > ~/data/site_history
echo "$tmp" >> ~/data/site_history
librewolf $site
