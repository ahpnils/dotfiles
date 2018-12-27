#!/usr/bin/env bash
#set -x

if [ "$UID" -eq 0 ] ; then
	PS1=$'\[$(tput bold)\]\[$(tput setaf 6)\]\A \[\E[01;31m\]\u\[\E[0m\]@\[\E[01;36m\]\h\[\E[0m\]:\w\[\E[01;31m\]\$\[\E[0m\] '
else
	PS1=$'\[$(tput bold)\]\[$(tput setaf 6)\]\A \[\E[01;32m\]\u\[\E[0m\]@\[\E[01;36m\]\h\[\E[0m\]:\w\[\E[01;32m\]\$\[\E[0m\] '
fi

# Add dates in bash_history :
export HISTTIMEFORMAT="%d/%m/%y %T "

# custom aliases :
alias c='clear'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# ls aliases are already available
# in Red Hat clones and colorized
if [ "$(uname -s)" == "NetBSD" ] || [ -f "/etc/alpine-release" ]; then
	alias ls='ls -hlF'
	alias ll='ls -hlF'
	alias l='ls'
fi

if command -v vim > /dev/null 2>&1 ; then
	alias vi='vim'
	EDITOR=$(command -v vim)
	export EDITOR
fi

if command -v most > /dev/null 2>&1 ; then
	PAGER=$(command -v most)
	export PAGER
fi

# Set umask so users don't see each other's data
# Except on NetBSD, because it messes with pkgsrc
if [ "$(uname -s)" != "NetBSD" ]; then
	umask 0077
fi

# vim:ts=4:sw=4
