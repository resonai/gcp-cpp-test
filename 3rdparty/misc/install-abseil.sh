#!/bin/bash

set -e
cd abseil-cpp-20210324.2/
cmake -H. -Bbuild -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ \
      -DCMAKE_CXX_FLAGS="-stdlib=libc++ -fPIC" \
      -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_STANDARD=14 -DABSL_DEFAULT_COPTS=ON -DABSL_BUILD_TESTING=ON -DABSL_USE_GOOGLETEST_HEAD=ON
cd build
make -j $(grep -c ^processor /proc/cpuinfo)
cmake --build . --target all
make install
ldconfig /usr/local/lib
