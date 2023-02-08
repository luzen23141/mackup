#!/bin/sh

echo "Backing up your dotfiles..."
cd "$DOTFILES" || (echo "Path Error" && exit)
echo "$(pwd)"
brew bundle dump --describe --force --file="$DOTFILES"/Brewfile
mackup -f backup
