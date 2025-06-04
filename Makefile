clean:
	rm -f *~ .*~
	rm -f */*~ */.*~

check:
	shellcheck -x -s bash config/.bashrc
	shellcheck -x -s bash config/.bash_profile

vim-deps: 
	mkdir -p ~/.vim/pack/plugins/start
	git -C ~/.vim/pack/plugins/start/vim-go pull -r || git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
	git -C ~/.vim/pack/plugins/start/vim-terraform pull -r || git clone https://github.com/hashivim/vim-terraform.git ~/.vim/pack/plugins/start/vim-terraform
	git -C ~/.vim/pack/plugins/start/vim-fugitive pull -r || git clone https://github.com/tpope/vim-fugitive.git ~/.vim/pack/plugins/start/vim-fugitive
	git -C ~/.vim/pack/plugins/start/vim-sensible pull -r || git clone https://github.com/tpope/vim-sensible.git ~/.vim/pack/plugins/start/vim-sensible
	git -C ~/.vim/pack/plugins/start/vim-flagship pull -r || git clone https://github.com/tpope/vim-flagship.git ~/.vim/pack/plugins/start/vim-flagship
	git -C ~/.vim/pack/plugins/start/vim-airline pull -r || git clone https://github.com/vim-airline/vim-airline.git ~/.vim/pack/plugins/start/vim-airline
	git -C ~/.vim/pack/plugins/start/vim-airline-themes pull -r || git clone https://github.com/vim-airline/vim-airline-themes.git ~/.vim/pack/plugins/start/vim-airline-themes

rpm-deps:
	sudo dnf -y install dnf-plugins-core
	sudo dnf -y copr enable atim/starship
	sudo dnf -y install ccze vim-enhanced most htop git-core git-delta bat \
		ShellCheck eza tree fzf starship stow

deb-deps:
	curl -sS https://starship.rs/install.sh | sh -s -- "-f"
	sudo apt-get -y update && \
		sudo apt-get -y install ccze vim most htop git-delta bat \
		shellcheck eza tree fzf stow

pkgin-deps:
	# the following softwares are not available at the moment :
	# ccze, shellcheck
	# on macOS, vim and git are available out of the box, 
	# but sometimes in older releases
	sudo pkgin -y install vim most htop git-base git-delta bat \
		eza bash-completion tree xz fzf stow

starship-stow:
	stow -v -t ${HOME} --dotfiles starship

stow:
	# clean-up before first install
	if [ -f ${HOME}/.bashrc ]; then rm -vf ${HOME}/.bashrc; fi
	if [ -f ${HOME}/.bash_profile ]; then rm -vf ${HOME}/.bash_profile; fi
	stow -v -t ${HOME} --dotfiles config

test-stow:
	set -e
	for stowdir in config starship; do \
		chkstow --aliens -t ${HOME} ${stowdir} ; \
		chkstow --badlinks -t ${HOME} ${stowdir} ; \
		chkstow --list -t ${HOME} ${stowdir} ; \
	done
