#!/bin/bash

set -e
cd abseil-cpp-20211102.0/
    cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_TESTING=OFF \
      -DBUILD_SHARED_LIBS=yes \
      -DCMAKE_CXX_COMPILER=clang++ \
      -DCMAKE_C_COMPILER=clang \
      -DCMAKE_CXX_FLAGS="-stdlib=libc++" \
      -DCMAKE_CXX_STANDARD=17 \
      -G Ninja -S . -B cmake-out && \
    cmake --build cmake-out  && \
    cmake --build cmake-out --target install  && \
    ldconfig
