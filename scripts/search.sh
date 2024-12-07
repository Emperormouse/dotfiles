#!/usr/bin/bash

sed -i '/^$/d' ~/data/search_history
query="$(tail ~/data/search_history | dmenu -sb "#8ABEB7" -sf "#000000")" ||
    exit
grep "$query" ~/data/search_history &&
    sed -i "/$query/d" ~/data/search_history
tmp=$(cat ~/data/search_history)
echo "$query" > ~/data/search_history
echo "$tmp" >> ~/data/search_history
librewolf "https://duckduckgo.com/?t=ffab&q=$(echo $query | tr ' ' '+')&ia=web"
