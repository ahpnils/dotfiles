# .bashrc

# Source global definitions
if [ -r /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source custom local aliases and functions
if [ -r ~/.bashrc.local ]; then
	source ~/.bashrc.local
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# . /usr/share/powerline/bash/powerline.sh
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# Custom aliases
alias c='clear'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias zgrep='zgrep --color=auto'
alias zfgrep='zfgrep --color=auto'
alias zegrep='zegrep --color=auto'
# on NetBSD and macOS, you need xz to get the grep variants.
alias xzgrep='xzgrep --color=auto'
alias xzegrep='xzegrep --color=auto'
alias xzfgrep='xzfgrep --color=auto'

if $(which exa > /dev/null 2>&1); then
	alias ll='exa -G -l --color=always'
	alias ls='exa -G -l --color=always'
	alias l='exa --color=always'
	alias l.='exa -d .* --color=always'
else
	alias ll='ls -hlF --color=auto'
	alias ls='ls -hlF --color=auto'
	alias l='ls --color=auto'
	alias l.='ls -d .* --color=auto'
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
#function which () { (alias; eval ${which_declare}) | /usr/bin/which --tty-only --read-alias --read-functions --show-tilde --show-dot $@; }
# thanks eseyman !
function mkcd() { mkdir "${1}" && cd "${1}"; }
function mani() { info $1 --subnodes --output - | less; }
lesslog() { ccze -A < $1 | less -R; }

complete -C /usr/bin/terraform terraform

# vim:ts=8:sw=2:expandtab
