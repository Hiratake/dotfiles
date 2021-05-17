#!/bin/bash

set -u

DOTPATH="$HOME/.dotfiles"
BACKUPPATH="$HOME/.dotfiles-backup"
COLOR_GRAY="\033[1;38;5;243m"
COLOR_BLUE="\033[1;34m"
COLOR_GREEN="\033[1;32m"
COLOR_RED="\033[1;31m"
COLOR_PURPLE="\033[1;35m"
COLOR_YELLOW="\033[1;33m"
COLOR_NONE="\033[0m"

greeting() {
  echo -e "\nHello, ${COLOR_BLUE}dotfiles${COLOR_NONE}.\n"
}

has() {
  type "$1" > /dev/null 2>&1
}

error() {
  echo -e "${COLOR_RED}Error: ${COLOR_NONE}$1"
  exit 1
}

greeting

if [ ! -d ${DOTPATH} ]; then
  if has "git"; then
    git clone https://github.com/Hiratake/dotfiles.git ${DOTPATH}
  elif has "curl" || has "wget"; then
    TARBALL="https://github.com/Hiratake/dotfiles/archive/refs/heads/main.tar.gz"
    if has "curl"; then
      curl -L ${TARBALL} -o main.tar.gz
    else
      wget ${TARBALL}
    fi
    tar -zxvf main.tar.gz
    rm -f main.tar.gz
    mv -f dotfiles-main "${DOTPATH}"
  else
    error "git or curl or wget required."
  fi

  cd ${DOTPATH}

  if [ ! -d ${BACKUPPATH} ]; then
    mkdir -p "$BACKUPPATH"
  fi

  for f in $DOTPATH/.??* $DOTPATH/bin; do
    [[ `basename $f` == ".DS_Store" ]] && continue
    [[ `basename $f` == ".git" ]] && continue
    [[ `basename $f` == ".gitmodules" ]] && continue
    [[ `basename $f` == ".github" ]] && continue
    if [[ -L "$HOME/`basename $f`" ]]; then
      rm -f "$HOME/`basename $f`"
    fi
    if [[ -e "$HOME/`basename $f`" ]]; then
      mv "$HOME/`basename $f`" "$BACKUPPATH"
    fi
    ln -sfnv $f $HOME
  done
else
  error "dotfiles already exists in your home directory."
fi