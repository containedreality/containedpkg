#!/bin/sh

# Description: a easy to use install script.
#[ -z "$INSTALLDIR" ] && export INSTALLDIR="/home/$(whoami)/.local/"
[ -z "$REMOVE_LOCATION" ] && export REMOVE_LOCATION="/home/$(whoami)/.local"

# cp -r ./package/* "$INSTALLDIR" 
cp ./package/bin/hello /usr/bin/hello # You may have to change the path depending on the target system

cp ./remove.sh "$REMOVE_LOCATION"/remove-hello.sh
