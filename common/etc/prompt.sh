#!/usr/bin/env bash
#set -x

if [ "$UID" -eq 0 ] ; then
	PS1=$'\[$(tput bold)\]\[$(tput setaf 6)\]\A \[\E[01;31m\]\u\[\E[0m\]@\[\E[01;36m\]\h\[\E[0m\]:\w\[\E[01;31m\]\$\[\E[0m\] '
else
	PS1=$'\[$(tput bold)\]\[$(tput setaf 6)\]\A \[\E[01;32m\]\u\[\E[0m\]@\[\E[01;36m\]\h\[\E[0m\]:\w\[\E[01;32m\]\$\[\E[0m\] '
fi

# Add dates in bash_history :
export HISTTIMEFORMAT="%d/%m/%y %T "
# Remove duplicate commands in history
#export HISTCONTROL=ignoredups:erasedups
# Unlimited bash history :
#export HISTFILESIZE=
#export HISTSIZE=
# Change history file location because certain bash sessions truncate
# .bash_history file upon close
#export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command
# PROMPT_COMMAND="history -a; ${PROMPT_COMMAND}"
# After each command, append to history file and reread
#export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# custom aliases :
alias c='clear'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias df='df -h'
alias du='du -sh'
alias lsd='ls -d */'

# ls aliases are already available
# in Red Hat clones and colorized
# in Alpine colors are available
# but not enabled
if [ -f "/etc/alpine-release" ]; then
	alias ls='ls -hlF --color=auto'
	alias ll='ls -hlF --color=auto'
	alias l='ls --color=auto'
	alias l.='ls -d .* --color=auto'
fi
# no colored ls in NetBSD
if [ "$(uname -s)" == "NetBSD" ]; then
	alias ls='ls -hlF'
	alias ll='ls -hlF'
	alias l='ls'
	alias l.='ls -d .*'
fi
# Every OS can grep with colors
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'

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
