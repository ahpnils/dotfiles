clean:
	rm -f *~ .*~

install:
	ln -snvf ./bash/.bashrc ~/.bashrc
	ln -snvf ./bash/.bash_profile ~/.bash_profile
