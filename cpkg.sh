#!/bin/sh

# It has no concept of versions. it has no concept of removing packages/what ever. but its simple.
# configuration
# export INSTALLDIR="$PWD"
CACHE="etc/containedpkg/cache" # Path to list of avaliable packages.
REPOSITORY="http://localhost:8000"

download() {
	package="$1"
	
	echo "Downloading package."
	wget "$REPOSITORY/packages/$package" -O "/tmp/$package"
}

install() {
	echo "Installing package."
	package="/tmp/$1"
	extract_dir="$package-extracted"
	
	mkdir "$extract_dir"
	tar -xf "$package" -C "$extract_dir"
	cd "$extract_dir"

	$extract_dir/install.sh
}

search() {
	grep "$1" "$CACHE"
}

update() {
	echo "Updating packages."
	wget "$REPOSITORY/packages.lst" -O "$CACHE"
}

option="$1"
package="$2"

case $option in
	"install")
		download "$package";

		[ "$?" = '0' ] && install "$package";
	;;
	"search")
		search "$package";
	;;
	"update")
		update;
	;;
esac
