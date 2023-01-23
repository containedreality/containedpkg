#!/bin/sh

# It has no concept of versions. it has no concept of removing packages/what ever. but its simple.
# configuration
export CPKG_ROOT="$PWD/fakerootdir" # Mainly used for testing
export INSTALLDIR="$CPKG_ROOT"
export CACHE="$CPKG_ROOT/etc/containedpkg/cache" # Path to list of avaliable packages.
export REMOVE_LOCATION="$CPKG_ROOT/var/containedpkg/" # Where remove.sh for packages go.
export REPOSITORY="http://localhost:8000"

help() {
	echo "Usage: cpkg <mode> <package>"
	echo ""
	echo "Modes"
	echo "	help       -- This page"
	echo "	search     -- Searches for packages"
	echo "	install    -- Install local package/Network package"
	echo "	update     -- Update local packages list"
	echo "	download   -- Download packge"
	echo "	remove	  -- Run remove script (Argument requires path to script.)"
	echo "	setup_cpkg -- Create folders required in \$CPKG_ROOT ($CPKG_ROOT)"

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
	# echo $extract_dir/remove.sh
	# cd $CPKG_ROOT
	# cp "$extract_dir"/remove.sh "$REMOVE_LOCATION""remove-hello.sh"
	
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
	"setup_cpkg")
		mkdir "$CPKG_ROOT"/etc
		mkdir "$CPKG_ROOT"/etc/containedpkg
		mkdir "$CPKG_ROOT"/var
		mkdir "$CPKG_ROOT"/var/containedpkg
	;;
	"remove")
		./$2 # Just run remove script.
	;;
esac
