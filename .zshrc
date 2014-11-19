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

alias ll='ls -l --color'
alias lld='ls -ld --color */'
alias grepr='grep -R --color'
alias sysupdate='yaourt -Suya --noconfirm'
alias json="python -mjson.tool"

replace() {
    grep -R -I -E $1 2> /dev/null | cut -d ':' -f1 | xargs sed -i -e "/$1/{s;$2;$3;g; w /dev/stdout
    }"
}

export GOPATH=~/dev/go
export CDPATH=.:~:~/dev

export PATH=$PATH:$GOPATH/bin
