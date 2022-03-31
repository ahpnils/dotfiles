# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# . /usr/share/powerline/bash/powerline.sh
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# Custom aliases
alias startstream='cowsay -f blowfish "le stream va bientôt commencer"'
alias endstream='cowsay -f blowfish "le stream est finiiiiii"'
alias coucou='cowsay -f blowfish "coucou"'
alias nvtop='/home/nils/Projects/nvtop/build/src/nvtop'
alias c='clear'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls -hlF --color=auto'
alias ll='ls -hlF --color=auto'
alias l='ls --color=auto'
alias rpmqd='rpm -qd'
alias tree='tree -a -I .git'
if $(which bat > /dev/null 2>&1); then
	alias cat='bat -pp'
fi

# Custom functions
# thanks eseyman !
function mkcd() { mkdir "${1}" && cd "${1}"; }
function mani() { info $1 --subnodes --output - | less; }
lesslog() { ccze -A < $1 | less -R; }

