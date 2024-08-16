#!/usr/bin/sh

sudo mv ./src /usr/local/src/edu
mkdir /etc/edu
if ! [ $(cat ~/.bashrc | grep PATH=/usr/local/src/edu | wc -w) == 1 ]; then
    echo -e "PATH=/usr/local/src/edu:$(echo $)PATH" &>> ~/.bashrc
fi