#!/bin/bash

# ~/dotfiles.sh
# ============================================================

set -e

command_exists() {
    command -v "$@" >/dev/null 2>&1
}

error() {
    printf -- "%sError: $*%s\n" >&2 "$RED" "$RESET"
}

setup_color() {
    if [ -t 1 ]; then
        RED=$(printf '\033[31m')
        GREEN=$(printf '\033[32m')
        YELLOW=$(printf '\033[33m')
        BLUE=$(printf '\033[34m')
        BOLD=$(printf '\033[1m')
        RESET=$(printf '\033[m')
    else
        RED=""
        GREEN=""
        YELLOW=""
        BLUE=""
        BOLD=""
        RESET=""
    fi
}

setup_dependencies() {
    printf -- "\n%sSetting up dependencies:%s\n\n" "$BOLD" "$RESET"

    # Install Homebrew
    if ! command_exists brew; then
        printf -- "%sInstalling Homebrew...%s\n" "$BLUE" "$RESET"
        /bin/bash -c \
            "$(wget -qO- https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        source "${HOME}/.bash_profile"
        brew doctor
        brew upgrade
    fi
    printf -- "%sInstalling/updating apps using Homebrew...%s\n" "$BLUE" "$RESET"
    brew bundle --global
    brew cleanup
}

setup_shell() {
    printf -- "\n%sSetting up shell frameworks:%s\n\n" "$BOLD" "$RESET"

    # zsh
    command -v zsh | sudo tee -a /etc/shells
    sudo chsh -s "$(command -v zsh)" "${USER}"
}

main() {
    setup_color
    printf -- "\n%sdotfiles setup script%s\n" "$BOLD" "$RESET"

    sudo apt update && sudo apt install -y build-essential procps curl file git
    source "${HOME}/.bash_profile"

    setup_dependencies
    setup_shell

    printf -- "\n%sDone.%s\n\n" "$GREEN" "$RESET"
}

main "$@"
