#!/bin/sh

# Description: a easy to use install script.
[ -z "$INSTALLDIR" ] && export INSTALLDIR="/home/$(whoami)/.local/"
[ -z "$REMOVE_LOCATION" ] && export REMOVE_LOCATION="/home/$(whoami)/.local"

cp -r ./package/* "$INSTALLDIR"

cp ./remove.sh "$REMOVE_LOCATION"/remove-hello.sh
