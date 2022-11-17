clean:
	rm -f *~ .*~
	rm -f */*~ */.*~

install:
	ln -snvf ${PWD}/bash/.bashrc ~/.bashrc
	ln -snvf ${PWD}/bash/.bash_profile ~/.bash_profile
	ln -snvf ${PWD}/vim/.vimrc ~/.vimrc
	ln -snvf ${PWD}/tmux/.tmux.conf ~/.tmux.conf
	ln -snvf ${PWD}/git/.gitconfig ~/.gitconfig
	mkdir -vp ${HOME}/.config/htop/
	ln -snvf ${PWD}/htop/htoprc ~/.config/htop/htoprc


rpm-deps:
	sudo dnf -y install ccze vim-enhanced most htop git-delta bat \
		ShellCheck exa tree

pkgin-deps:
	# the following softwares are not available at the moment :
	# ccze, shellcheck
	# on macOS, vim and git are available out of the box, 
	# but sometimes in older releases
	sudo pkgin -y install vim most htop git-base git-delta bat \
		exa bash-completion tree
