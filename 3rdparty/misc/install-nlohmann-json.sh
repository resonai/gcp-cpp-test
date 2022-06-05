#!/bin/bash
ls
cd json-3.10.5
    cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=yes \
      -DCMAKE_CXX_COMPILER=clang++ \
      -DCMAKE_C_COMPILER=clang \
      -DCMAKE_CXX_FLAGS="-stdlib=libc++" \
      -DCMAKE_CXX_STANDARD=17 \
      -DBUILD_TESTING=OFF \
      -DJSON_BuildTests=OFF \
      -G Ninja -S . -Bcmake-out/nlohmann/json && \
    cmake --build cmake-out/nlohmann/json --target install  && \
    ldconfig
