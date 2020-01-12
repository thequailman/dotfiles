case $- in
    *i*) ;;
      *) return;;
esac
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi


# shellcheck source=bash_aliases
if [ -f "${HOME}/.bash_aliases" ]; then
    source "${HOME}/.bash_aliases"
fi

if [ -f "${HOME}/.bash_custom" ]; then
    source "${HOME}/.bash_custom"
fi

if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
    complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make
fi

# Fix reverse search lookup:
[[ $- == *i* ]] && stty -ixon

export CLICOLOR=1
export EDITOR="code -w"
export GOPATH=${HOME}/.go
export PATH=${HOME}/.bin:${HOME}/.go/bin:${HOME}/.node_modules/bin:${PATH}
export VISUAL="code -w"

# shellcheck source=bash_powerline
source "${HOME}/.bash_powerline"

set -o vi
bind '"jk":vi-movement-mode'
