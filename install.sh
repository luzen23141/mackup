#!/bin/bash

# dotFiles档案预计放的位子
DOTFILES_TMP="$HOME"/dotfiles

#ICLOUD_PATH="$HOME"/Library/Mobile\ Documents/com~apple~CloudDocs

# 如果沒有git 代表應該是沒有安裝X xcode
if test ! "$(which git)"; then
  xcode-select --install
fi

git clone https://gitlab.com/luzen23141/dotfiles.git "$DOTFILES_TMP"
zsh "$DOTFILES_TMP"/fresh.sh
