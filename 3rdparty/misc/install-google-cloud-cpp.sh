#!/bin/bash

set -e

cd google-cloud-cpp-1.40.2
    cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=yes \
      -DCMAKE_CXX_COMPILER=clang++ \
      -DCMAKE_C_COMPILER=clang \
      -DCMAKE_CXX_FLAGS="-stdlib=libc++" \
      -DCMAKE_CXX_STANDARD=17 \
      -DBUILD_TESTING=OFF \
      -G Ninja -S . -B cmake-out && \
    cmake --build cmake-out --target install  && \
    ldconfig
