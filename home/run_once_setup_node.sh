#!/bin/sh

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

    # Install pnpm
    if ! command_exists pnpm; then
        printf -- "%sInstalling pnpm...%s\n" "$BLUE" "$RESET"
        wget -qO- https://get.pnpm.io/install.sh | sh -
        source "${HOME}/.bashrc"
    fi

    # Install Node.js
    printf -- "%sInstalling Node.js using pnpm...%s\n" "$BLUE" "$RESET"
    pnpm env use --global lts
}

main() {
    printf -- "\n%sNode.js setup script%s\n\n" "$BOLD" "$RESET"

    setup_node

    printf -- "\n%sDone.%s\n\n" "$GREEN" "$RESET"
}

setup_color
main "$@"
