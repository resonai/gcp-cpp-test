#!/bin/bash

set -e
ls
cd re2-2022-04-01/
    cmake -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=ON \
      -DCMAKE_CXX_COMPILER=clang++ \
      -DCMAKE_C_COMPILER=clang \
      -DCMAKE_CXX_FLAGS="-stdlib=libc++" \
      -DRE2_BUILD_TESTING=OFF \
      -S . -B cmake-out -GNinja && \
    cmake --build cmake-out && \
    cmake --install cmake-out && \
    ldconfig
