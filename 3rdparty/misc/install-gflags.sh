#!/bin/bash

set -e
cd $( ls -d */ | head -1 )
mkdir build && cd build
cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_CXX_COMPILER=clang++ \
-DGFLAGS_NAMESPACE=google \
-DCMAKE_CXX_FLAGS="${CMAKE_CXX_FLAGS} -stdlib=libc++ -std=c++14 -fPIC" \
-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
-DCMAKE_EXE_LINKER_FLAGS="${CMAKE_EXE_LINKER_FLAGS} -lc++abi" ../
make -j $(grep -c ^processor /proc/cpuinfo)
make install
ldconfig /usr/local/lib
