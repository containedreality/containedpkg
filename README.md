# Containedpkg
A attempt at making a easy to use [package manager](https://en.wikipedia.org/wiki/Package_manager) for Unix-like operating systems.

It is ment to be used for portable scripts/source code but it can also be used for something like appimages. the goal is make a easy and lightweight solution to installing packages on Unix-like systems

# Dependencies
You will need some sort of wget (to download packages)

[GNU wget](http://ftp.gnu.org/gnu/wget/)

[Busybox wget](https://busybox.net/downloads/)

Any shell with POSIX compatibility should work

[Bash](http://ftp.gnu.org/gnu/bash/)

[DASH](http://gondor.apana.org.au/~herbert/dash/)

[mksh](http://www.mirbsd.org/mksh.htm)

# Notes
Currently there is no pgp signed packages or support for signed pgp packages.

It does not resolve dependacies.

It does not have upgrading packages or any concept of versions.

## Why?
I needed something to install/remove portable scripts/binaries on my systems.
