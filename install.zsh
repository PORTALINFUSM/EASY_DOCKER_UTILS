#!/usr/bin/sh

if [ -d /usr/local/src/edu ]; then
    sudo rm -rf /usr/local/src/edu
fi
sudo mkdir /usr/local/src/edu
sudo cp -rf ./src/* /usr/local/src/edu

if ! [ -d /home/$USER/.edu ]; then
    sudo mkdir /home/$USER/.edu
fi

if [ -f ~/.bashrc ] && ! [ $(cat ~/.bashrc | grep "alias edu='bash /usr/local/src/edu/edu.zsh'" | wc -l) == 1 ]; then
    echo -e "alias edu='bash /usr/local/src/edu/edu.zsh'" &>> ~/.bashrc
fi

if [ -f ~/.zshrc ] && ! [ $(cat ~/.zshrc | grep "alias edu='bash /usr/local/src/edu/edu.zsh'" | wc -l) == 1 ]; then
    echo -e "alias edu='bash /usr/local/src/edu/edu.zsh'" &>> ~/.zshrc
fi