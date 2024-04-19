#!/bin/bash
#for Ubuntu

sudo apt update

# bpytop
if [ -z "$(command -v bpytop)" ]; then
  echo "--- Install peco is Start! ---"
  sudo apt -y install bpytop
fi

# exa
if [ -z "$(command -v exa)" ]; then
  echo "--- Install exa is Start! ---"
  sudo apt -y install exa
fi

# jq
if [ -z "$(command -v jq)" ]; then
  echo "--- Install jq is Start! ---"
  sudo apt -y install jq
fi

# peco
if [ -z "$(command -v peco)" ]; then
  echo "--- Install peco is Start! ---"
  sudo apt -y install peco
fi

# zsh
ln -sv ~/dotfiles/.zshrc ~/

sudo apt -y install zsh
chsh -s /usr/bin/zsh
