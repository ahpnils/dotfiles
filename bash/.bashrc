# .bashrc

# Source global definitions
if [ -r /etc/bashrc ]; then
	# shellcheck source=/dev/null
  . /etc/bashrc
fi

# Source custom local aliases and functions
if [ -r ~/.bashrc.local ]; then
	# shellcheck source=/dev/null
  source ~/.bashrc.local
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# . /usr/share/powerline/bash/powerline.sh
if [ "${TILIX_ID}" ] || [ "${VTE_VERSION}" ]; then
	# shellcheck source=/dev/null
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
# thanks iMil !
alias nocom='grep -E -v '\''^[[:space:]]*(#|$)'\'''

# Bat aliases
if which bat > /dev/null 2>&1; then
  alias cat='bat -pp'
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

if which terraform > /dev/null 2>&1; then
	complete -C /usr/bin/terraform terraform
fi

if which git > /dev/null 2>&1; then
	git_completions="/usr/share/bash-completion/completions/git \
		/usr/pkg/share/bash-completion/completions/git \
		/opt/pkg/share/bash-completion/completions/git \
		/Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash"
	for git_completion in ${git_completions}; do
		if [ -r "${git_completion}" ]; then
			# shellcheck source=/dev/null
			. "${git_completion}" && __git_complete g git
		fi
	done
fi

# Custom functions
#function which () { (alias; eval ${which_declare}) | /usr/bin/which --tty-only --read-alias --read-functions --show-tilde --show-dot $@; }
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


# vim:ts=2:sw=2:ft=bash
