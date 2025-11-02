# .bashrc

# Source global definitions
if [ -r /etc/bashrc ]; then
	# shellcheck source=/dev/null
  source /etc/bashrc
fi

# Source custom local aliases and functions
if [ -r ~/.bashrc.local ]; then
	# shellcheck source=/dev/null
  source ~/.bashrc.local
fi

# User specific aliases and functions
if [ "${TILIX_ID}" ] || [ "${VTE_VERSION}" ]; then
	# shellcheck source=/dev/null
  source /etc/profile.d/vte.sh
fi

# Custom aliases and associated configurations.
alias c='clear'
alias u='uptime'
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
if which xz > /dev/null 2>&1; then
  alias xzgrep='xzgrep --color=auto'
  alias xzegrep='xzegrep --color=auto'
  alias xzfgrep='xzfgrep --color=auto'
fi

# thanks iMil !
alias nocom='grep -E -v '\''^[[:space:]]*(#|$)'\'''

# Filter out tmp and dev filesystems, names differ from an OS to another.
# On NetBSD, df does not support -x, so resorting to gdf from the coreutils package.
if which gdf > /dev/null 2>&1; then
  alias df='gdf -h -x tmpfs -x devtmpfs -x efivarfs -x devfs -x ptyfs'
else
  alias df='df -h -x tmpfs -x devtmpfs -x efivarfs -x devfs -x ptyfs'
fi

# Vim aliases
if which vim > /dev/null 2>&1; then
	alias v='vim -p'
	alias vi='vim -p'
	EDITOR=$(which vim); export EDITOR
fi

# Most is a somewhat better pager
if which most > /dev/null 2>&1; then
	PAGER=$(which most); export PAGER
fi

# Delta is an awesome pager for git
if which delta > /dev/null 2>&1; then
	DELTA_PAGER=$(which less) ; export DELTA_PAGER
fi

# Bat aliases and configuration
if which bat > /dev/null 2>&1; then
  alias cat='bat -pp --tabs 2'
  export BAT_THEME="ansi"
  export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
fi

# Git aliases
if which git > /dev/null 2>&1; then
	alias g='git'
	alias gps="git push"
	alias gpl="git pull -r"
	alias gpf="git push -f"
	alias gpc="git commit"
fi

# Github aliases
if which gh > /dev/null 2>&1; then
	alias prv="gh pr view --web"
	alias prc="gh pr create --fill"
	alias prd="gh pr create --fill --draft"
	alias prm="gh pr merge --merge --delete-branch"
fi

# Eza aliases
if which eza > /dev/null 2>&1; then
  alias ll='eza -G -l --color=always'
  alias ls='eza -G -l --color=always'
  alias l='eza --color=always'
  alias l.='eza -d .* --color=always'
else
  alias ll='ls -hlF --color=auto'
  alias ls='ls -hlF --color=auto'
  alias l='ls --color=auto'
  alias l.='ls -d .* --color=auto'
fi

# RPM aliases
if which rpm > /dev/null 2>&1; then
  alias rpmqd='rpm -qd'
fi

# Shellcheck aliases
if which shellcheck > /dev/null 2>&1; then
  alias shellcheck='shellcheck -x'
fi

# Tree aliases
if which tree > /dev/null 2>&1; then
  alias tree='tree -a -C -I .git'
fi

# Autocomplete settings

# if which tofu > /dev/null 2>&1; then
# 	complete -C /usr/bin/tofu tofu
# fi

if which git > /dev/null 2>&1; then
	git_completions="/usr/share/bash-completion/completions/git \
		/usr/pkg/share/bash-completion/completions/git \
		/opt/pkg/share/bash-completion/completions/git \
		/Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash"
	for git_completion in ${git_completions}; do
		if [ -r "${git_completion}" ]; then
			# shellcheck source=/dev/null
			source "${git_completion}" && __git_complete g git
		fi
	done
fi

# User specific environment and startup programs

# Add dates in bash_history :
export HISTTIMEFORMAT="%y/%m/%d %T "
# Unlimited Bash history :
export HISTSIZE=-1
export HISTFILESIZE=-1
# avoid comments in Bash history
# XXX: try ignoreboth:erasedups, check if it
# causes issues with fzf
export HISTCONTROL=ignoreboth

# More places to exec programs
home_paths="${HOME}/.local/bin ${HOME}/bin ${HOME}/.bin"
for home_path in ${home_paths}; do
	if [[ ":${PATH}:" != *":${home_path}:"* ]]; then
		export PATH="${home_path}:${PATH}"
	fi
done

# In case Starship is not installed or does not work properly
if [ "$UID" -eq 0 ] ; then
	PS1=$'\[$(tput bold)\]\[$(tput setaf 6)\]\A \[\E[01;31m\]\u\[\E[0m\]@\[\E[01;36m\]\h\[\E[0m\]:\w\[\E[01;31m\]\$\[\E[0m\] '
else
	PS1=$'\[$(tput bold)\]\[$(tput setaf 6)\]\A \[\E[01;32m\]\u\[\E[0m\]@\[\E[01;36m\]\h\[\E[0m\]:\w\[\E[01;32m\]$(parse_git_branch)\[\033[00m\] \$\[\E[0m\] '
fi

if [ -L "${HOME}"/.starship.toml ]; then
	export STARSHIP_CONFIG=${HOME}/.starship.toml
	eval "$(starship init bash)"
fi

if which fzf > /dev/null 2>&1; then
	eval "$(fzf --bash)"
fi

# Custom functions
# thanks eseyman !
# shellcheck disable=SC2164
mkcd() { mkdir -p "${1}" && cd "${1}"; }
mani() { info "${1}" --subnodes --output - | less; }
lesslog() { ccze -A < "${1}" | less -R; }
flatup() { flatpak -y update; }
dnfup() { sudo dnf -y clean all && sudo dnf -y upgrade; }
fullup() { flatup && dnfup; }
fullupandreboot() { fullup && sudo reboot; }
fullupandhalt() { fullup && sudo poweroff; }
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# vim:ts=2:sw=2:ft=bash

complete -C /usr/bin/tofu tofu
