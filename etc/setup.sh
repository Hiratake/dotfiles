#!/bin/bash

set -u
cd $DOT_PATH

echo 'Start to install Homebrew...'
which brew >/dev/null 2>&1 || \
/usr/bin/ruby -e \
  "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
which brew >/dev/null 2>&1 && brew doctor
which brew >/dev/null 2>&1 && brew update --verbose

echo 'Start to upgrade Homebrew...'
brew upgrade

echo 'Start to install brew formulas...'
brew bundle --verbose
brew cleanup
exec $SHELL -l