#!/bin/bash

set -e
cd benchmark-1.5.2/
cmake -H. -Bbuild -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ \
      -DCMAKE_CXX_FLAGS="-stdlib=libc++" -DBENCHMARK_ENABLE_TESTING=0 \
      -DCMAKE_CXX_STANDARD=14 \
      -DLLVMAR_EXECUTABLE=True -DLLVMNM_EXECUTABLE=True \
      -DLLVMRANLIB_EXECUTABLE=True
cd build
make -j $(grep -c ^processor /proc/cpuinfo)
make install
ldconfig /usr/local/lib
