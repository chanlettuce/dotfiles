#!/bin/bash
#for Ubuntu

touch ~/dotfiles/zsh/machine.zsh

sudo apt update

# bpytop
if [ -z "$(command -v bpytop)" ]; then
  echo "--- Install peco is Start! ---"
  sudo apt -y install bpytop
fi

# exa -> eza
if [ -z "$(command -v eza)" ]; then
  echo "--- Install eza is Start! ---"
  sudo apt -y install eza
fi

# jq
if [ -z "$(command -v jq)" ]; then
  echo "--- Install jq is Start! ---"
  sudo apt -y install jq
fi

# peco
if [ -z "$(command -v peco)" ]; then
  echo "--- Install peco is Start! ---"
  # CPUアーキテクチャの判定
  ARCH=$(uname -m)
  if [ "$ARCH" = "x86_64" ]; then
    FILENAME=peco_linux_amd64
  elif [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
    FILENAME=peco_linux_arm64
  else
    echo "未対応のアーキテクチャです: $ARCH"
    exit 1
  fi
  wget https://github.com/peco/peco/releases/download/v0.5.11/$FILENAME.tar.gz
  tar -xzf $FILENAME.tar.gz
  sudo mv $FILENAME/peco /usr/local/bin/
  rm -rf $FILENAME
  rm $FILENAME.tar.gz
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
