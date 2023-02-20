# containedpkg
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

You will need some sort of tar

[GNU tar](https://ftpmirror.gnu.org/tar/)

[Busybox tar](https://www.busybox.net/downloads/)

[libarchive](https://www.libarchive.org/)

# Notes
Currently there is no pgp signed packages or support for signed pgp packages.

It does not resolve dependacies.

It does not have upgrading packages or any concept of versions.

It barely works. and as its in early development probably will have A LOT of issues.

# Configuration
Configuration is done in the shellscript itself. through variables.

CPKG_ROOT       -- Directory where everything is gonna be installed

INSTALLDIR      -- Deprecated for the most part. I guess some scripts will use it, but I'm going for more hardcoded paths.

CACHE           -- the list of available packages. downloadable from the repository

REMOVE_LOCATION -- Deprecated for the most part. The install script should just have a hardcoded path for its remove script.

REPOSITORY      -- Typical repository.

## Why?
I needed something to install/remove portable scripts/binaries on my systems.
