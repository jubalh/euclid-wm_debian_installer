#!/usr/bin/env bash
# This scripts downloads and install euclid-wm window manager
# on a Debian based system
# by Michael "jubalh" Vetter

if [ "$UID" -ne 0 ]
then
	echo "No root privileges."
	exit $E_NOTROOT
fi

#need packages
aptitude install build-essential gcc make subversion libx11-dev libxinerama-dev

#get it
svn checkout http://euclid-wm.googlecode.com/svn/trunk/ euclid-wm

#build it
./euclid-wm/make
./euclid-wm/make install

#copy config files
cp euclid-wm/euclidrc ~/.config/euclid-wm/euclidrc
chmod u+x ~/.config/euclid-wm/euclidrc
cp euclid-wm/euclid-wm.conf.sample ~/.config/euclid-wm/euclid-wm.conf

#optionally write it in xinitrc so euclid is started when typing startx
#not needed when you are using a login manager
echo "exec euclid-wm" >> ~/.xinitrc
