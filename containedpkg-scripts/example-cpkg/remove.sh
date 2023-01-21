#!/bin/sh

[ -z "$INSTALLDIR" ] && export INSTALLDIR="/home/$(whoami)/.local/"

rm "$INSTALLDIR"/bin/hello
