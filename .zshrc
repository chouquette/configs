# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename '/home/exxo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt inc_append_history
setopt share_history
bindkey -v
# End of lines configured by zsh-newuser-install

alias ll='ls -lA --color'
alias lld='ls -ld --color */'
alias grepr='grep -R --color'
alias sysupdate='yaourt -Suya --noconfirm'

export GOPATH=/home/exxo/work/godev
