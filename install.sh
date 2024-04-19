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

# HackGen
wget https://github.com/yuru7/HackGen/releases/download/v2.9.0/HackGen_NF_v2.9.0.zip
unzip HackGen_NF_v2.9.0.zip
mv HackGen_NF_v2.9.0 HackGen_NF
sudo cp -r HackGen_NF /usr/local/share/fonts/
fc-cache -vf
rm -rf HackGen_NF HackGen_NF_v2.9.0.zip

# zsh
ln -sv ~/dotfiles/.zshrc ~/

sudo apt -y install zsh
chsh -s /usr/bin/zsh
