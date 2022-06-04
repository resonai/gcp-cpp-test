#!/bin/bash

set -e
cd protobuf-3.18.0/
./autogen.sh
./configure CC=clang CXX=clang++ CXXFLAGS='-stdlib=libc++ -I/usr/include/libcxxabi'
make -j $(grep -c ^processor /proc/cpuinfo)
make check -j $(grep -c ^processor /proc/cpuinfo)
make install
# TODO(EyalR) I am doing the below because I need the cmake files
# installed to usr/lib/cmake, surely there must be a better way?
cmake -Hcmake -Bbuild -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ \
      -DCMAKE_CXX_FLAGS="-stdlib=libc++ -fPIC"
cd build
make -j  $(grep -c ^processor /proc/cpuinfo)
make install
ldconfig /usr/local/lib
