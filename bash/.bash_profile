# .bash_profile

# Get the aliases and functions
if [ -r ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export PATH=/bin:/sbin:$PATH:/sbin:/usr/sbin:$HOME/.local/bin:$HOME/bin

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [ "$UID" -eq 0 ] ; then
	PS1=$'\[$(tput bold)\]\[$(tput setaf 6)\]\A \[\E[01;31m\]\u\[\E[0m\]@\[\E[01;36m\]\h\[\E[0m\]:\w\[\E[01;31m\]\$\[\E[0m\] '
else
	PS1=$'\[$(tput bold)\]\[$(tput setaf 6)\]\A \[\E[01;32m\]\u\[\E[0m\]@\[\E[01;36m\]\h\[\E[0m\]:\w\[\E[01;32m\]$(parse_git_branch)\[\033[00m\] \$\[\E[0m\] '
fi

# Add dates in bash_history :
export HISTTIMEFORMAT="%y/%m/%d %T "
# export HISTSIZE=1000000
# export HISTFILESIZE=2000000

if $(which vim > /dev/null 2>&1); then
	alias vi='vim'
	export EDITOR=$(which vim)
fi

if $(which most > /dev/null 2>&1); then
	export PAGER=$(which most)
fi

if $(which delta > /dev/null 2>&1); then
	export DELTA_PAGER=$(which less)
fi

# vim:ts=2:sw=2:ft=bash
