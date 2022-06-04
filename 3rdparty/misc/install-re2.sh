#!/bin/bash

set -e
ls
cd re2-2021-11-01/
cmake -H. -Bbuild -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ \
      -DCMAKE_CXX_FLAGS="-stdlib=libc++ -fPIC" \
      -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_STANDARD=14
cd build
make -j $(grep -c ^processor /proc/cpuinfo)
make install
ldconfig /usr/local/lib
