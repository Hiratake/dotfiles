# .zshrc

export LANG=ja_JP.UTF-8
export PATH=$HOME/.bin:$PATH
export PATH="/usr/local/sbin:$PATH"
export PHP_BUILD_CONFIGURE_OPTS="\
  --disable-fpm \
  --disable-phpdbg \
  --enable-debug \
  --with-bz2=$(brew --prefix bzip2) \
  --with-curl=$(brew --prefix curl) \
  --with-gettext=$(brew --prefix gettext) \
  --with-gmp=$(brew --prefix gmp) \
  --with-iconv=$(brew --prefix libiconv) \
  --with-icu-dir=$(brew --prefix icu4c) \
  --with-jpeg-dir=$(brew --prefix jpeg) \
  --with-libedit=$(brew --prefix libedit) \
  --with-libxml-dir=$(brew --prefix libxml2) \
  --with-libzip=$(brew --prefix libzip)
  --with-mcrypt=$(brew --prefix libmcrypt) \
  --with-png-dir=$(brew --prefix libpng) \
  --with-readline=$(brew --prefix readline) \
  --with-tidy=$(brew --prefix tidy-html5) \
  --with-xsl=$(brew --prefix libxslt) \
  --with-zlib=$(brew --prefix zlib) \
  --with-kerberos"

autoload -Uz compinit && compinit
autoload -Uz colors && colors

bindkey -e

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

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ls='ls -FG'
alias la='ls -A'
alias ll='ls -al'
alias vi='vim'
alias atom='code'

if type anyenv > /dev/null; then
  eval "$(anyenv init -)"
fi

if type starship > /dev/null; then
  eval "$(starship init zsh)"
fi