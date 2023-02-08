#!/bin/sh

echo "Backing up your dotfiles..."

. "$DOTFILES"/dotfileFunction.sh

create_mackup_private_setting
echo 123
exit



cd "$DOTFILES" || (echo "Path Error" && exit)
echo "$(pwd)"
brew bundle dump --describe --force --no-lock --file="$DOTFILES"/Brewfile
mackup -f backup
