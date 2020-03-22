# Ubuntu 18.04 (Bionic Beaver)
#
# Author: Nishant Sharma <'nishants1994' at gmail>
#

.PHONY:
#	all
#	preparations
#	libs
#	update
#	upgrade
#	graphics
#	tools
#	teamviewer
	setup_bash
	setup_vim
	setup_tmux
	powerline
	powerline_vim
	powerline_tmux
	setup_ripgrep
	setup_hunspell
	setup_peek

all:
	@echo "Installation of ALL targets"
	make preparations libs
	make upgrade
	make graphics
	make media
	make tools
	make teamviewer
	make setup_bash

update:
	sudo apt update

upgrade:
	sudo apt -y upgrade

preparations:
	make update
	sudo apt -y install software-properties-common build-essential \
	checkinstall wget curl git libssl-dev apt-transport-https ca-certificates \
	openssh-client openssh-server python3-pip libevent-dev autotools-dev automake \
	cmake valac libgtk-3-dev libkeybinder-3.0-dev libxml2-utils gettext txt2man \
	ninja-build libtool libtool-bin autoconf automake cmake g++ pkg-config unzip

libs:
	@echo "No Libraries to install: skipping libs option"
	#sudo apt -y install

graphics:
	sudo apt -y install gimp graphviz inkscape

media:
	sudo apt -y install vlc libavcodec-extra blender kdenlive

tools:
	sudo apt -y install htop meld tmux vim geany elinks

#teamviewer:
#	sudo apt -y install qml-module-qtquick-dialogs qml-module-qtquick-privatewidgets
#	rm -f teamviewer_amd64.deb
#	wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
#	sudo dpkg -i teamviewer_amd64.deb
#	rm -f teamviewer_amd64.deb

setup_bash:
	echo "# Customizations to bash" >> ~/.bashrc
	echo "source ~/vcs/dot_files/bash/customs" >> ~/.bashrc
	echo "source ~/vcs/dot_files/bash/aliases" >> ~/.bashrc
	echo "source ~/vcs/dot_files/bash/functions" >> ~/.bashrc
	@echo "Setting up links to vimrc and tmux.conf"
	ln -s ~/vcs/dot_files/vim/.vimrc ~/.vimrc
	ln -s ~/vcs/dot_files/tmux/.tmux.conf ~/.tmux.conf

.ONESHELL:
setup_vim:
	# Removing existing vim
	sudo apt -y remove --purge vim vim-runtime vim-gnome vim-tiny vim-gui-common
	# Installing dependencies
	sudo apt -y install liblua5.1-dev luajit libluajit-5.1 python-dev \
	python3-dev ruby-dev libperl-dev libncurses5-dev libatk1.0-dev libx11-dev \
	libxpm-dev libxt-dev
	mkdir -p ~/.software
	git clone https://github.com/vim/vim ~/.software/vim
	cd ~/.software/vim
	# configuring vim
	./configure \
	--enable-multibyte \
	--enable-perlinterp=dynamic \
	--enable-rubyinterp=dynamic \
	--with-ruby-command=/usr/bin/ruby \
	--enable-pythoninterp=dynamic \
	--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
	--enable-python3interp \
	--with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
	--enable-luainterp \
	--with-luajit \
	--enable-cscope \
	--enable-gui=auto \
	--with-features=huge \
	--with-x \
	--enable-fontset \
	--enable-largefile \
	--disable-netbeans \
	--with-compiledby="Nishant Sharma" \
	--enable-fail-if-missing
	# compile and install
	make && sudo make install

.ONESHELL:
setup_neovim:
	git clone https://github.com/neovim/neovim ~/.software/neovim
	cd ~/.software/neovim
	make CMAKE_BUILD_TYPE=Release
	sudo make install

.ONESHELL:
setup_tmux:
	mkdir -p ~/.software
	git clone https://github.com/tmux/tmux.git ~/.software/tmux
	cd ~/.software/tmux
	sh autogen.sh
	./configure
	make
	sudo make install

powerline:
	sudo pip install git+https://git@github.com/powerline/powerline
	# update fonts
	git clone https://github.com/powerline/fonts.git --depth=1 /tmp/fonts
	/tmp/fonts/install.sh
	# clean-up a bit
	rm -rf /tmp/fonts
	@echo "Please update terminal fonts"

powerline_vim:
	echo "\" Powerline related settings" >> ~/.vimrc
	echo "python from powerline.vim import setup as powerline_setup" >> ~/.vimrc
	echo "python powerline_setup()" >> ~/.vimrc
	echo "python del powerline_setup" >> ~/.vimrc
	echo "" >> ~/.vimrc
	echo "set laststatus=2 \" Always display the statusline in all windows" >> ~/.vimrc
	echo "set noshowmode \" Hide the default mode text (e.g. -- INSERT -- below the statusline)" >> ~/.vimrc

powerline_tmux:
	echo "# Powerline-status" >> ~/.tmux.conf
	echo "run-shell \"powerline-daemon -q\"" >> ~/.tmux.conf
	echo "run \"powerline-config tmux setup\"" >> ~/.tmux.conf

.ONESHELL:
setup_ripgrep:
	# installing rust
	curl https://sh.rustup.rs -sSf | sh
	echo "source ${HOME}/.cargo/env" >> ~/.bashrc
	source ~/.bashrc
	mkdir -p ~/.software/
	git clone https://github.com/BurntSushi/ripgrep ~/.software/ripgrep
	cd ~/.software/ripgrep
	cargo build --release
	cargo install

.ONESHELL:
setup_hunspell:
	sudo apt install g++ make autoconf \
		automake autopoint libtool autoconf \
		automake autopoint libtool libboost-locale-dev \
		libboost-system-dev
	autoreconf -vfi
	./configure --with-ui --with-readline --with-warnings
	make
	sudo make install
	sudo ldconfig

.ONESHELL:
setup_peek:
	git clone https://github.com/phw/peek.git ~/vcs/peek
	mkdir ~/vcs/peek/build
	cd ~/vcs/peek/build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DGSETTINGS_COMPILE=OFF ..
	cd ~/vcs/peek
	make package
	sudo apt install ./peek-*-Linux.deb

# notes to self
# While install synergy from source, had to unzip files in the ext directory
#
# Gnome-boxes
# sudo usermod -a -G kvm $USER
#


