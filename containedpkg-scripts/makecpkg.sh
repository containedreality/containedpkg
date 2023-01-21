#!/bin/sh

# USAGE: [directory] [package-name]
directory="$1"
name="$2"

cd $directory
tar -cf "../$name" "."
