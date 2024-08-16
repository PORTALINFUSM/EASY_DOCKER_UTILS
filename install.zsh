#!/usr/bin/sh

if [ -d /usr/local/src/edu ]; then
    sudo rm -rf /usr/local/src/edu
fi
sudo mkdir /usr/local/src/edu
sudo cp -rf ./src/* /usr/local/src/edu

if ! [ -d /tmp/edu ]; then
    sudo mkdir /tmp/edu
fi

if ! [ $(cat ~/.bashrc | grep "alias edu='bash /usr/local/src/edu/edu.zsh'" | wc -w) == 1 ]; then
    echo -e "alias edu='bash /usr/local/src/edu/edu.zsh'" &>> ~/.bashrc
fi