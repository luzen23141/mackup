#!/bin/sh

echo "Backing up your dotfiles..."

cd "$DOTFILES" || (echo "Path Error" && exit)
echo "$(pwd)"
brew bundle dump --describe --force --no-lock --file="$DOTFILES"/Brewfile
mackup -f backup
