#!/bin/sh

# Description: a easy to use install script.
[ -z "$INSTALLDIR" ] && export INSTALLDIR="/home/$(whoami)/.local/"

cp -r ./package/* "$INSTALLDIR"
