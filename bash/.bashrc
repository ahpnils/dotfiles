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


alias startstream='cowsay -f blowfish "le stream va bientôt commencer"'
alias endstream='cowsay -f blowfish "le stream est finiiiiii"'
alias coucou='cowsay -f blowfish "coucou"'
alias nvtop='/home/nils/Projects/nvtop/build/src/nvtop'

complete -C /usr/bin/terraform terraform
