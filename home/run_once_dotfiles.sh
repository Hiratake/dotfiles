#!/bin/bash

# ~/dotfiles.sh
# ============================================================

set -e

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

command_exists() {
    command -v "$@" >/dev/null 2>&1
}

error() {
    printf -- "%sError: $*%s\n" >&2 "$RED" "$RESET"
}

setup_prompts() {
    printf -- "\n%sSetting up shell frameworks:%s\n\n" "$BOLD" "$RESET"

    # Install Zsh
    if ! command_exists zsh; then
        printf -- "%sInstalling Zsh...%s\n" "$BLUE" "$RESET"
        sudo apt install -y zsh
        command -v zsh | sudo tee -a /etc/shells
        sudo chsh -s "$(command -v zsh)" "${USER}"
    fi

    # Install Sheldon
    printf -- "%sInstalling Sheldon...%s\n" "$BLUE" "$RESET"
    wget -qO- https://rossmacarthur.github.io/install/crate.sh \
        | bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin
}

main() {
    printf -- "\n%sdotfiles setup script%s\n\n" "$BOLD" "$RESET"

    setup_prompts

    printf -- "\n%sDone.%s\n\n" "$GREEN" "$RESET"
}

setup_color
main "$@"
