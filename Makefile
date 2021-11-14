clean:
	rm -f *~ .*~
	rm -f */*~ */.*~

install:
	ln -snvf ${PWD}/bash/.bashrc ~/.bashrc
	ln -snvf ${PWD}/bash/.bash_profile ~/.bash_profile
