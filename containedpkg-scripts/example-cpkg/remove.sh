#!/bin/sh

#[ -z "$INSTALLDIR" ] && export INSTALLDIR="/home/$(whoami)/.local/"

# rm "$INSTALLDIR"/bin/hello
rm /usr/bin/hello # You may have to change this depending on the target system
