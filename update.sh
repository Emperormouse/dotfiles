#!/usr/bin/env bash

dir=$(dirname "$BASH_SOURCE")
cd $dir
for config in $(ls | grep -v "^update.sh$" | grep -v "^nixos$" | grep -v "^scripts$"); do
    echo $config updated
    cp -r ~/.config/$config .
done

cp -r ~/scripts .

git add .
git commit . -m "Updated"
git push


