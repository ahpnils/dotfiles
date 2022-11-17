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
alias nvtop='/home/nils/Documents/Projects/git/github/others/nvtop/build/src/nvtop'
alias c='clear'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
if $(which exa > /dev/null 2>&1); then
	alias ll='exa -G -l --color=always'
	alias ls='exa -G -l --color=always'
	alias l='exa --color=always'
else
	alias ll='ls -hlF --color=auto'
	alias ls='ls -hlF --color=auto'
	alias l='ls --color=auto'
fi
if $(which rpm > /dev/null 2>&1); then
	alias rpmqd='rpm -qd'
fi
if $(which tree > /dev/null 2>&1); then
	alias tree='tree -a -I .git'
fi
if $(which bat > /dev/null 2>&1); then
	alias cat='bat -pp'
fi

if $(which shellcheck > /dev/null 2>&1); then
	alias shellcheck='shellcheck -x'
fi

# Custom functions
# thanks eseyman !
function mkcd() { mkdir "${1}" && cd "${1}"; }
function mani() { info $1 --subnodes --output - | less; }
lesslog() { ccze -A < $1 | less -R; }

complete -C /usr/bin/terraform terraform

# Source custom local aliases and functions
if [ -f ~/.bashrc.local ]; then
	source ~/.bashrc.local
fi
# vim:ts=4:sw=4
