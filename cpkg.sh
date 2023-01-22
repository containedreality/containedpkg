#!/bin/sh

# It has no concept of versions. it has no concept of removing packages/what ever. but its simple.
# configuration
# export INSTALLDIR="$PWD"
ROOT="$PWD" # Mainly used for testing
CACHE="etc/containedpkg/cache" # Path to list of avaliable packages.
REMOVE_LOCATION="var/containedpkg/" # Where remove.sh for packages go.
REPOSITORY="http://localhost:8000"

help() {
	echo "Usage: cpkg <mode> <package>"
	echo ""
	echo "Modes"
	echo "	help     -- This page"
	echo "	search   -- Searches for packages"
	echo "	install  -- Install local package/Network package"
	echo "	update   -- Update local packages list"
	echo "	download -- Download packge"

	exit 1
}

download() {
	package="$1"
	from_cmd="$2"
	
	echo "Downloading package."
	if [ "$from_cmd" == 'yes' ]; then
		wget "$REPOSITORY/packages/$package"
	else
		wget "$REPOSITORY/packages/$package" -O "/tmp/$package"
	fi
}

install_pkg() {
	echo "Installing package."
	package="/tmp/$1"
	extract_dir="$package-extracted"
	
	mkdir "$extract_dir"
	tar -xf "$package" -C "$extract_dir"
	cd "$extract_dir"

	$extract_dir/install.sh
	echo $extract_dir/remove.sh
	cd $ROOT
	cp "$extract_dir"/remove.sh "$REMOVE_LOCATION""remove-hello.sh"
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
		# detect local package
		if [ -f "$package" ]; then
			install_pkg "$package"
		else
			download "$package";

			[ "$?" = '0' ] && install_pkg "$package";
		fi
	;;
	"download")
		download "$package" "yes";
	;;
	"search")
		search "$package";
	;;
	"update")
		update;
	;;
	"help")
		help;
	;;
	"remove")
		
esac
