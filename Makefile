clean:
	rm -f *~ .*~
	rm -f */*~ */.*~

install:
	ln -snvf ./bash/.bashrc ~/.bashrc
	ln -snvf ./bash/.bash_profile ~/.bash_profile
	ln -snvf ./vim/.vimrc ~/.vimrc
	ln -snvf ./tmux/.tmux.conf ~/.tmux.conf
	ln -snvf ./git/.gitconfig ~/.gitconfig
	ln -snvf ./git/.gitignore ~/.gitignore
	mkdir -p ${HOME}/.config/htop/
	ln -snvf ./htop/htoprc ~/.config/htop/htoprc

vim-deps: 
	mkdir -p ~/.vim/bundle ~/git/github/others
	git clone https://github.com/VundleVim/Vundle.vim.git \
		~/git/github/others/Vundle.vim
	ln -snvf ~/git/github/others/Vundle.vim ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

rpm-deps:
	sudo dnf -y install ccze vim-enhanced most htop git-delta bat \
		ShellCheck exa tree

pkgin-deps:
	# the following softwares are not available at the moment :
	# ccze, shellcheck
	# on macOS, vim and git are available out of the box, 
	# but sometimes in older releases
	sudo pkgin -y install vim most htop git-base git-delta bat \
		exa bash-completion tree xz

# vim:ts=4:sw=4
