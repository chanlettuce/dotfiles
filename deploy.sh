#!/bin/bash
#for Ubuntu

# peco
if [ -z "$(command -v peco)" ]; then
    echo "--- Install peco is Start! ---"
    sudo apt -y install peco
fi

# zsh
ln -sv ~/dotfiles/.zshrc ~/

sudo apt -y install zsh
chsh -s /usr/bin/zsh
