# Ubuntu 18.04 (Bionic Beaver)
#
# Author: Nishant Sharma <'nishants1994' at gmail>
#

.PHONY:
	prepare
	setup_xsession_desktop
	setup_xsession
	clone_dwm
	fix_config_mk
	fix_config_h

prepare:
	apt install xorg-dev suckless-tools

# this is gdm specific
setup_xsession_desktop:
	ln -s ~/vcs/dot_files/dwm/dwm.desktop /usr/share/xsessions/dwm.desktop

setup_xsession:
	ln -s ~/vcs/dot_files/dwm/xsession ~/.xsession

clone_dwm:
	git clone git://git.suckless.org/dwm ~/vcs/dwm

fix_config_mk:
	# fix the correct location of X11 libraries
	sed -i 's/\/usr\/X11R6\/include/\/usr\/include\/X11/g' ~/vcs/dwm/config.mk
	sed -i 's/\/usr\/X11R6\/lib/\/usr\/lib\/X11/g' ~/vcs/dwm/config.mk

fix_config_h:
	ln -s ~/vcs/dot_files/dwm/config.h ~/vcs/dwm/config.h

.ONESHELL:
build_and_install:
	cd ~/vcs/dwm
	make clean install

