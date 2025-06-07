# Basic Makefile

default:
	echo "Nothing to do here."

build:
	echo "Installing build dependencies..."
	sudo apt-get install build-essential debhelper devscripts dh-make reprepro
	echo "Build dependencies installed."

	# Copy the main script to package directory
	cp mkcmd.sh mkcmd/usr/bin/mkcmd

	#  Build the Debian package
	dpkg-deb --build mkcmd

	# Update apt repo
	reprepro -b apt-repo --ignore=wrongdistribution includedeb focal mkcmd.deb