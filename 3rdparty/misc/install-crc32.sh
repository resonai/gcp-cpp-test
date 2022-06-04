#!/bin/bash

set -e
cd crc32c-1.1.0/
cmake -H. -Bbuild -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ \
      -DCMAKE_CXX_FLAGS="-stdlib=libc++" -H. -Bbuild -DCMAKE_C_COMPILER=clang \
      -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_CXX_FLAGS="-stdlib=libc++" \
      -DCRC32C_BUILD_TESTS=OFF -DCRC32C_BUILD_BENCHMARKS=OFF -DCRC32C_USE_GLOG=OFF
cd build
make -j $(grep -c ^processor /proc/cpuinfo)
make install
ldconfig /usr/local/lib
