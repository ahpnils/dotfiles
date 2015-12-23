clean:
	rm -f *~ .*~
	rm -f common/*/*~
	rm -f common/*/.*~
	rm -f NetBSD/*/*~
	rm -f NetBSD/*/.*~

common-install:
	# cp -fp common/home/.vimrc /etc/skel/
	cp -fp common/home/.cvsrc /etc/skel/ ; chmod 0755 /etc/skel/.cvsrc
	cp -fp common/etc/banner.txt /etc/banner.txt; chmod 0755 /etc/banner.txt

nb-install:
	cp -fp NetBSD/etc/profile /etc/profile ; chmod 0644 /etc/profile
	cp -fp NetBSD/usrpkgetc/bashrc /usr/pkg/etc/bashrc
	cp -fp common/etc/prompt.sh /usr/pkg/etc/profile.d/prompt.sh
	cp -fp common/home/.vimrc /usr/pkg/share/vim/vimrc

rh-install:
	cp -fp common/etc/prompt.sh /etc/profile.d/prompt.sh ; chmod 0755 /etc/profile.d/prompt.sh
	cp -fp common/home/.vimrc /etc/vimrc
