#!/bin/bash

set -u

THIS_DIR=$(cd $(dirname $0); pwd)

echo 'Hi, my name is dotfiles.'
echo 'Start to setup new environment...'
echo ''

cd $THIS_DIR

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

echo 'Start to install nodenv...'
anyenv install nodenv
anyenv install phpenv
exec $SHELL -l