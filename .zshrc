export LANG=ja_JP.UTF-8
export PATH=$HOME/.bin:$PATH

alias ...='cd ../..'
alias vi='vim'

autoload -Uz compinit && compinit
autoload -Uz colors && colors

zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' menu select=2

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=1000000
HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
PROMPT='%c %# '

setopt AUTO_PUSHD
setopt EXTENDED_GLOB
setopt GLOBDOTS
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt MARK_DIRS
setopt NO_BEEP
setopt NO_FLOW_CONTROL
setopt NOLISTBEEP
setopt PRINT_EIGHT_BIT
setopt PROMPT_SUBST
setopt PUSHD_IGNORE_DUPS
setopt SHARE_HISTORY

unsetopt PRINT_EXIT_VALUE

if type anyenv > /dev/null; then
  eval "$(anyenv init -)"
fi