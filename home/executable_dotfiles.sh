# ~/dotfiles.sh
# ============================================================

set -e

command_exists() {
    command -v "$@" >/dev/null 2>&1
}

error() {
    printf -- "%sError: $*%s\n" >&2 "$RED" "$RESET"
}

setup_dependencies() {
    printf -- "\n%sSetting up dependencies:%s\n\n" "$BOLD" "$RESET"

    # Install Homebrew packages
    if ! command_exists brew; then
      printf -- "%sInstalling Homebrew...%s\n" "$BLUE" "$RESET"
      /bin/bash -c "$(wget -qO- https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      brew doctor
      brew update
      brew upgrade
    fi
    printf -- "%sInstalling/updating apps using Homebrew...%s\n" "$BLUE" "$RESET"
    brew bundle --global
    brew cleanup
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

main() {
    printf -- "\n%sdotfiles setup script%s\n" "$BOLD" "$RESET"
    command_exists chezmoi || {
        error "chezmoi is not installed"
        exit 1
    }
    setup_dependencies
    setup_color
    printf -- "\n%sDone.%s\n\n" "$GREEN" "$RESET"
}

main "$@"
