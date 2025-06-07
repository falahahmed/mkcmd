# Basic Makefile

VER ?= `cat VERSION`

default:
	echo "Nothing to do here."

build:
	echo "Installing build dependencies..."
	sudo apt-get install build-essential debhelper devscripts dh-make reprepro
	echo "Build dependencies installed."

	# Copy the main script to package directory
	mkdir -p mkcmd/usr/bin
	mkdir -p mkcmd/DEBIAN
	cp mkcmd.sh mkcmd/usr/bin/mkcmd

	# set version, config for distributions, control
	make dist
	make control

	#  Build the Debian package
	dpkg-deb --build mkcmd

	# Update apt repo
	reprepro -b apt-repo --ignore=wrongdistribution includedeb focal mkcmd.deb

	# Create package
	cd apt-repo && dpkg-scanpackages --arch all pool/ > Packages
	cd apt-repo && gzip -kf Packages

clean:
	echo "Cleaning up..."
	rm -rf apt-repo/conf/distributions mkcmd/DEBIAN/control
	rm -rf apt-repo/db
	echo "Cleanup complete."

dist:
	echo "Origin: mkcmd" > apt-repo/conf/distributions
	echo "Label: mkcmd" >> apt-repo/conf/distributions
	echo "Suite: stable" >> apt-repo/conf/distributions
	echo "Codename: focal" >> apt-repo/conf/distributions
	echo "Version: $(VER)" >> apt-repo/conf/distributions
	echo "Architectures: amd64 focal" >> apt-repo/conf/distributions
	echo "Components: main" >> apt-repo/conf/distributions
	echo "Description: mkcmd package repository" >> apt-repo/conf/distributions

control:
	echo "Package: mkcmd" > mkcmd/DEBIAN/control
	echo "Version: $(VER)" >> mkcmd/DEBIAN/control
	echo "Section: utils" >> mkcmd/DEBIAN/control
	echo "Priority: optional" >> mkcmd/DEBIAN/control
	echo "Architecture: all" >> mkcmd/DEBIAN/control
	echo "Maintainer: Falah Ahmed <kpfalah99@gmail.com>" >> mkcmd/DEBIAN/control
	echo "Description: A script to create a command from executable files." >> mkcmd/DEBIAN/control
	echo "   Currently, it is only available for files like .AppImage" >> mkcmd/DEBIAN/control
	echo "   I want to add more file extensions. A helping hand is always welcome." >> mkcmd/DEBIAN/control
	echo "   You can contact me at telegram: @chruxAdmin" >> mkcmd/DEBIAN/control
	echo "   github: @falahahmed" >> mkcmd/DEBIAN/control
