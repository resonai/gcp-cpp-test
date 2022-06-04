#!/bin/bash
# This is a generic "configure / make / make install" installer
# It assumes `make install` installs to `/usr/local/lib`,
# so it also runs ldconfig to make the library available container wide
# It is also assumed that there's only one package to install, and it is
# in a single directory found under the current directory.

# //TODO (Modi) use the make-installer.sh
set -e
cd $( ls -d */ | head -1 )
./configure CC=clang CXX=clang++ CXXFLAGS='-stdlib=libc++ -std=c++14 -DGFLAGS_NAMESPACE=google -fPIC'
make -j $(grep -c ^processor /proc/cpuinfo)
make install
ldconfig /usr/local/lib
