clean:
		rm -f *~ .*~
		rm -f common/*/*~
		rm -f common/*/.*~
		rm -f NetBSD/*/*~
		rm -f NetBSD/*/.*~
common-install:
		cp -fp common/etc/prompt.sh /etc/prompt.sh
		cp -fp common/home/.cvsrc /etc/skel/
		cp -fp common/home/.vimrc /etc/skel/
nb-install:
		cp -fp etc/profile /etc/profile
		cp -fp usrpkgetc/bashrc /usr/pkg/etc/bashrc
rh-install:
		echo "Red Hat distros specific installation"
install:
		echo "this will be a generic installer, soon"
