clean:
	rm -f *~ .*~
	rm -f */*~ */.*~

check:
	shellcheck -x -s bash bash/.bashrc
	shellcheck -x -s bash bash/.bash_profile

install:
	ln -snvf ${PWD}/bash/.bashrc ~/.bashrc
	ln -snvf ${PWD}/bash/.bash_profile ~/.bash_profile
	ln -snvf ${PWD}/vim/.vimrc ~/.vimrc
	ln -snvf ${PWD}/tmux/.tmux.conf ~/.tmux.conf
	ln -snvf ${PWD}/git/.gitconfig ~/.gitconfig
	ln -snvf ${PWD}/git/.gitignore ~/.gitignore
	mkdir -p ${HOME}/.config/htop/
	ln -snvf ${PWD}/htop/htoprc ~/.config/htop/htoprc
	ln -snvf ${PWD}/config/starship.toml ~/.config/starship.toml

vim-deps: 
	mkdir -p ~/.vim/pack/plugins/start
	git -C ~/.vim/pack/plugins/start/vim-go pull -r || git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
	git -C ~/.vim/pack/plugins/start/vim-terraform pull -r || git clone https://github.com/hashivim/vim-terraform.git ~/.vim/pack/plugins/start/vim-terraform
	git -C ~/.vim/pack/plugins/start/vim-fugitive pull -r || git clone https://github.com/tpope/vim-fugitive.git ~/.vim/pack/plugins/start/vim-fugitive
	git -C ~/.vim/pack/plugins/start/vim-sensible pull -r || git clone https://github.com/tpope/vim-sensible.git ~/.vim/pack/plugins/start/vim-sensible
	git -C ~/.vim/pack/plugins/start/vim-flagship pull -r || git clone https://github.com/tpope/vim-flagship.git ~/.vim/pack/plugins/start/vim-flagship

rpm-deps:
	sudo dnf copr enable atim/starship
	sudo dnf -y install ccze vim-enhanced most htop git-delta bat \
		ShellCheck eza tree fzf starship

deb-deps:
	sudo apt-get -y update && \
		sudo apt-get -y install ccze vim most htop git-delta bat \
		shellcheck eza tree fzf

pkgin-deps:
	# the following softwares are not available at the moment :
	# ccze, shellcheck
	# on macOS, vim and git are available out of the box, 
	# but sometimes in older releases
	sudo pkgin -y install vim most htop git-base git-delta bat \
		eza bash-completion tree xz fzf
