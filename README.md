# 📄dotfiles

[![CI](https://github.com/Hiratake/dotfiles/actions/workflows/ci.yml/badge.svg)](https://github.com/Hiratake/dotfiles/actions/workflows/ci.yml)
[![Misskey](https://img.shields.io/badge/Misskey-@Hiratake-green?logo=misskey)](https://misskey.io/@Hiratake)
[![coffee](https://img.shields.io/badge/coffee-hiratake-yellow?logo=buymeacoffee)](https://www.buymeacoffee.com/hiratake)

Hiratake dotfiles for [Ubuntu on WSL](https://ubuntu.com/wsl) and [macOS](https://www.apple.com/macos/).  
This dotfiles managed with [chezmoi](https://www.chezmoi.io/) 🏠

## 🚀 Getting started

Run the following command in your terminal:

```sh
sh -c "$(wget -qO- get.chezmoi.io)" -- init --apply Hiratake
```

> 💡 If you use curl, run the following command:
> ```
> sh -c "$(curl -fsSL get.chezmoi.io)" -- init --apply Hiratake
> ```

### VSCode Dev Containers

For use with VSCode Dev Containers:

1. Install [Dev Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) and [Docker](https://www.docker.com/).
2. Open the settings in VSCode.
3. Search for **"dotfiles"**, and write `Hiratake/dotfiles` in the entry named **Dotfiles: Repository**.

  ![VSCode dotfiles setting example](https://user-images.githubusercontent.com/23224932/230699202-23d71271-4504-4f4a-a8a5-170091c16fbb.png)

## 🔡 Fonts

This dotfiles uses the Zsh theme [Powerlevel10k](https://github.com/romkatv/powerlevel10k), so it requires you to install a font on your host machine with support for the [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) glyphs. I recommend the [Meslo Nerd Font](https://github.com/romkatv/powerlevel10k#fonts).

## 💡 Inspirations

- [GitHub does dotfiles](https://dotfiles.github.io/)
- [GitHub: Felipe Santos' dotfiles](https://github.com/felipecrs/dotfiles)
- [GitHub: Cross-platform, cross-shell dotfiles](https://github.com/renemarc/dotfiles)
