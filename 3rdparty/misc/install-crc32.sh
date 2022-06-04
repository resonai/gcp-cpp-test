#!/bin/bash

set -e
cd crc32c-1.1.2/
    cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=yes \
      -DCMAKE_CXX_COMPILER=clang++ \
      -DCMAKE_C_COMPILER=clang \
      -DCMAKE_CXX_FLAGS="-stdlib=libc++" \
      -DCRC32C_BUILD_TESTS=OFF \
      -DCRC32C_BUILD_BENCHMARKS=OFF \
      -DCRC32C_USE_GLOG=OFF \
      -G Ninja -S . -Bcmake-out && \
    cmake --build cmake-out  && \
    cmake --build cmake-out --target install  && \
    ldconfig
