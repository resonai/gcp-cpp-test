#!/bin/bash

set -e
cd $( ls -d */ | head -1 )
cmake -H. -Bbuild -DCMAKE_C_COMPILER=clang
cd build
make -j $(grep -c ^processor /proc/cpuinfo)
make install
ldconfig /usr/local/lib
