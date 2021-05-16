export DOT_PATH=$HOME/dotfiles

eval "$(starship init zsh)"

autoload -Uz colors && colors
autoload -Uz compinit && compinit
setopt print_eight_bit

if [ -d $HOME/.anyenv ]
then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
fi

if which nodenv >/dev/null; then
   	eval "$(nodenv init -)"
fi

if which phpenv >/dev/null; then
   	eval "$(phpenv init -)"
fi

export PATH="/usr/local/sbin:$PATH"
export LANG=ja_JP.UTF-8