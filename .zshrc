# /etc/zsh/zshrc ou ~/.zshrc
# Fichier de configuration principal de zsh
# Formation Debian GNU/Linux par Alexis de Lattre
# http://www.via.ecp.fr/~alexis/formation-linux/

#
# 1. Les alias
#

# alias apt
alias acs='apt-cache search'
alias acsh='apt-cache show'

#  Gestion du ls : couleur + touche pas aux accents
alias ls='ls --classify --tabsize=0 --literal --color=auto --show-control-chars --human-readable'

# Demande confirmation avant d'�craser un fichier
alias cp='cp --interactive'
alias mv='mv --interactive'
alias rm='rm --interactive'

# Raccourcis pour 'ls'
alias l='ls -l'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

# Quelques alias pratiques
alias c='clear'
alias less='less --quiet'
alias s='cd ..'
alias df='df --human-readable'
alias du='du --human-readable'

alias dedibox="ssh chouquette@l0cal.com"
alias fpi="ssh fairplay@test.zoond.tv"
alias make="make -j 5"
alias grep="grep --color"

alias xen='ssh -A root@88.190.12.24'
alias xen1='ssh -A fairplay@88.190.221.161'
alias xen2='ssh -A fairplay@88.190.221.163'
alias xen3='ssh -A fairplay@88.190.221.186'

review() {
    vim $1;
    echo "Apply this patch?"
    select yn in "Yes" "No"; do
        case $yn in
            [Yy]* ) git am -s "$1" && rm -f "$1";;
            * ) break;;
        esac
    done
}

#
# 2. Prompt et D�finition des touches
#

# exemple : ma touche HOME, cf man termcap, est codifiee K1 (upper left
# key on keyboard) dans le /etc/termcap. En me referant a l'entree
# correspondant a mon terminal (par exemple 'linux') dans ce fichier, je
# lis : K1=\E[1~, c'est la sequence de caracteres qui sera envoyee au
# shell. La commande bindkey dit simplement au shell : a chaque fois que
# tu rencontres telle sequence de caractere, tu dois faire telle action.
# La liste des actions est disponible dans "man zshzle".

# Un charset fran�ais
#export LESSCHARSET="latin1" suxxxx -- dionoea

# Correspondance touches-fonction
bindkey '^A'    beginning-of-line       # Home
bindkey '^E'    end-of-line             # End
bindkey '^D'    delete-char             # Del
bindkey '^R'    history-incremental-search-backward
bindkey '[3~' delete-char             # Del
bindkey '[2~' overwrite-mode          # Insert
bindkey '[5~' history-search-backward # PgUp
bindkey '[6~' history-search-forward  # PgDn

# Prompt couleur 
export PS1="%{[33;31;1m%}%n%{[0m[33;33;1m%}@%{[33;37;1m%}%m %{[0m%}"
export RPROMPT="%~"

# Console linux, dans un screen ou un rxvt
if [ "$TERM" = "linux" -o "$TERM" = "screen" -o "$TERM" = "rxvt" ]
then
  # Correspondance touches-fonction sp�cifique
  bindkey '[1~' beginning-of-line       # Home
  bindkey '[4~' end-of-line             # End
fi

# xterm
if [ "$TERM" = "xterm" ]
then
  # Correspondance touches-fonction sp�cifique
  bindkey '[H'  beginning-of-line       # Home
  bindkey '[F'  end-of-line             # End
fi

# Gestion de la couleur pour 'ls' (exportation de LS_COLORS)
if [ -x /usr/bin/dircolors ]
then
  if [ -r ~/.dir_colors ]
  then
    eval "`dircolors ~/.dir_colors`"
  elif [ -r /etc/dir_colors ]
  then
    eval "`dircolors /etc/dir_colors`"
  fi
fi

#
# 3. Options de zsh (cf 'man zshoptions')
#

# Je ne veux JAMAIS de beeps
unsetopt beep
unsetopt hist_beep
unsetopt list_beep
# >| doit �tre utilis�s pour pouvoir �craser un fichier d�j� existant ;
# le fichier ne sera pas �cras� avec '>'
unsetopt clobber
# Ctrl+D est �quivalent � 'logout'
unsetopt ignore_eof
# Affiche le code de sortie si diff�rent de '0'
setopt print_exit_value
# Demande confirmation pour 'rm *'
unsetopt rm_star_silent
# Correction orthographique des commandes
# D�sactiv� car, contrairement � ce que dit le "man", il essaye de
# corriger les commandes avant de les hasher
#setopt correct

# Sch�mas de compl�tion

# - Sch�ma A :
# 1�re tabulation : compl�te jusqu'au bout de la partie commune
# 2�me tabulation : propose une liste de choix
# 3�me tabulation : compl�te avec le 1er item de la liste
# 4�me tabulation : compl�te avec le 2�me item de la liste, etc...
# -> c'est le sch�ma de compl�tion par d�faut de zsh.

# Sch�ma B :
# 1�re tabulation : propose une liste de choix et compl�te avec le 1er item
#                   de la liste
# 2�me tabulation : compl�te avec le 2�me item de la liste, etc...
# Si vous voulez ce sch�ma, d�commentez la ligne suivante :
#setopt menu_complete

# Sch�ma C :
# 1�re tabulation : compl�te jusqu'au bout de la partie commune et
#                   propose une liste de choix
# 2�me tabulation : compl�te avec le 1er item de la liste
# 3�me tabulation : compl�te avec le 2�me item de la liste, etc...
# Ce sch�ma est le meilleur � mon go�t !
# Si vous voulez ce sch�ma, d�commentez la ligne suivante :
unsetopt list_ambiguous
# (Merci � Youri van Rietschoten de m'avoir donn� l'info !)

# Options de compl�tion
# Quand le dernier caract�re d'une compl�tion est '/' et que l'on
# tape 'espace' apr�s, le '/' est effa��
setopt auto_remove_slash
# Fait la compl�tion sur les fichiers et r�pertoires cach�s
setopt glob_dots

# Traite les liens symboliques comme il faut
setopt chase_links

# Quand l'utilisateur commence sa commande par '!' pour faire de la
# compl�tion historique, il n'ex�cute pas la commande imm�diatement
# mais il �crit la commande dans le prompt
setopt hist_verify
# Si la commande est invalide mais correspond au nom d'un sous-r�pertoire
# ex�cuter 'cd sous-r�pertoire'
setopt auto_cd
# L'ex�cution de "cd" met le r�pertoire d'o� l'on vient sur la pile
setopt auto_pushd
# Ignore les doublons dans la pile
setopt pushd_ignore_dups
# N'affiche pas la pile apr�s un "pushd" ou "popd"
setopt pushd_silent
# "pushd" sans argument = "pushd $HOME"
setopt pushd_to_home

# Les jobs qui tournent en t�che de fond sont nic� � '0'
unsetopt bg_nice
# N'envoie pas de "HUP" aux jobs qui tourent quand le shell se ferme
unsetopt hup

#
# 4. Param�tres de l'historique des commandes
#

# Nombre d'entr�es dans l'historique
export HISTORY=100
export SAVEHIST=100
# Fichier o� est stock� l'historique
export HISTFILE=$HOME/.history

#
# 5. Compl�tion des options des commandes
#

zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'
zstyle ':completion:*' max-errors 3 numeric
zstyle ':completion:*' use-compctl false

autoload -U compinit
compinit
export EDITOR=`which vim`

export GOROOT=/usr/lib/go
export GOPATH=~/go/:~/dev/scrobble/backend/go
export PATH="${GOROOT}/site/bin/:${GOPATH//://bin:}/bin:$PATH"

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
