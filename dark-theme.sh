#!/bin/bash

# 日本語系導入とロケールを ja_JP.UTF8 に設定
sudo apt -y install language-pack-ja
sudo update-locale LANG=ja_JP.UTF8
# 何かひとつ GUI アプリ入れて GTK 依存関係を導入
sudo apt install nemo
# テーマやカラースキーム導入
sudo apt install yaru-*
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Yaru'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.wm.preferences theme 'Yaru-dark'

