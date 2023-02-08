#!/bin/sh

echo "Setting up your Mac..."

# 取當前路徑 (絕對路徑)
cd "$(dirname "$0")" || (echo "Path Error" && exit)
DOTFILES_ROOT=$(pwd -P)

. "$DOTFILES_ROOT"/dotfileFunction.sh

# submodule安裝
git submodule init
git submodule update

# Check for Homebrew and install if we don't have it
if test ! "$(which brew)"; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# 感觉用不到
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf "$HOME"/.zshrc
ln -s "$DOTFILES_ROOT"/.zshrc "$HOME"/.zshrc

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew install mas
brew bundle --file "$DOTFILES_ROOT"/Brewfile

# Set default MySQL root password and auth type
#mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Install PHP extensions with PECL
#pecl install imagick redis swoole

# Install global Composer packages
#/usr/local/bin/composer global require laravel/installer laravel/valet beyondcode/expose spatie/global-ray spatie/visit

# Install Laravel Valet
#$HOME/.composer/vendor/bin/valet install

# Install Global Ray
#$HOME/.composer/vendor/bin/global-ray install

# Create a Sites directory
#mkdir $HOME/Sites

# Create sites subdirectories
#mkdir $HOME/Sites/blade-ui-kit
#mkdir $HOME/Sites/laravel

# Clone Github repositories
#$DOTFILES/clone.sh

# 建立軟連結
info '  Installing dotfiles'
for src in $(find "$DOTFILES_ROOT/autoLink" -maxdepth 2 -name '*.symlink' -not -path '*.git*')
do
  dst="$HOME/.$(basename "${src%.*}")"
  link_file "$src" "$dst"
done

# 視情況開啟
mackup -n restore
echo "再視情況手動執行 mackup 指令"

# 還未調整設定
# Set macOS preferences - we will run this last because this will reload the shell
#source "$DOTFILES_ROOT"/.macos
