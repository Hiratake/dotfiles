# Dotfiles

Hiratake Dotfiles 📄✨

## OS

- macOS

## Installation

If on macOS, you will need to install the `Command Line Tools for Xcode` before continuing. To do so, open a terminal and type

```bash
$ xcode-select --install
```

Then, start to install dotfiles on your machine.

```bash
$ bash -c "$(curl -fsSL dot.hiratake.xyz)"
```

## Usage

After installation, exec `dotfiles` command.

```bash
# Setup Homebrew and install packages
$ dotfiles init

# Install dotfiles to home directory
$ dotfiles install

# Update dotfiles and this repo
$ dotfiles update
```
