#!/bin/bash

# ~/setup_node.sh
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

setup_node() {
    printf -- "\n%sSetting up node:%s\n\n" "$BOLD" "$RESET"

    # Install Volta
    if ! command_exists volta; then
        printf -- "%sInstalling Volta...%s\n" "$BLUE" "$RESET"
        curl https://get.volta.sh | bash -s -- --skip-setup
        source "${HOME}/.profile"
    fi

    # Install Node.js
    printf -- "%sInstalling Node.js using Volta...%s\n" "$BLUE" "$RESET"
    volta install node

    # Install Yarn
    printf -- "%sInstalling Yarn using Volta...%s\n" "$BLUE" "$RESET"
    volta install yarn@1

    # Install pnpm
    printf -- "%sInstalling pnpm using Volta...%s\n" "$BLUE" "$RESET"
    volta install pnpm
}

main() {
    printf -- "\n%sNode.js setup script%s\n\n" "$BOLD" "$RESET"

    setup_node

    printf -- "\n%sDone.%s\n\n" "$GREEN" "$RESET"
}

setup_color
main "$@"
