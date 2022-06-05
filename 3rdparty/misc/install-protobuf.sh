#!/bin/bash

set -e
cd protobuf-3.20.1/
    cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=yes \
      -DCMAKE_CXX_COMPILER=clang++ \
      -DCMAKE_C_COMPILER=clang \
      -DCMAKE_CXX_FLAGS="-stdlib=libc++" \
      -DCMAKE_CXX_STANDARD=17 \
      -Dprotobuf_BUILD_TESTS=OFF \
      -G Ninja -S cmake -Bcmake-out && \
    cmake --build cmake-out  && \
    cmake --build cmake-out --target install  && \
    ldconfig
