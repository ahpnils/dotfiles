clean:
	rm -f *~ .*~
	rm -f */*~ */.*~

install:
	ln -snvf ${PWD}/bash/.bashrc ~/.bashrc
	ln -snvf ${PWD}/bash/.bash_profile ~/.bash_profile
	ln -snvf ${PWD}/vim/.vimrc ~/.vimrc
	ln -snvf ${PWD}/tmux/.tmux.conf ~/.tmux.conf


rpm-deps:
	sudo dnf -y install ccze vim-enhanced most
