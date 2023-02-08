#!/bin/bash

# 如果沒有git 代表應該是沒有安裝X xcode
if test ! "$(which git)"; then
  xcode-select --install
fi

git clone https://gitlab.com/luzen23141/dotfiles.git "$HOME"/dotfiles
sh "$HOME"/dotfiles/fresh.sh