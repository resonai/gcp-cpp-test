#!/bin/bash

set -e

cd google-cloud-cpp-1.40.2
CLANG_VERSION=$(clang++ --version|sed -n 's/Ubuntu clang version \([0-9]*\.[0-9]*\.[0-9]\).*/\1/p')
cmake -H. -Bcmake-out -DBUILD_TESTING=OFF \
      -DGOOGLE_CLOUD_CPP_ENABLE_EXAMPLES=OFF \
      -DCMAKE_CXX_COMPILER_ID=Clang \
      -DCMAKE_CXX_COMPILER_VERSION=${CLANG_VERSION} \
      -DCMAKE_CXX_STANDARD_COMPUTED_DEFAULT=Clang \
      -DCMAKE_C_COMPILER=clang \
      -DCMAKE_CXX_COMPILER=clang++ \
      -DCMAKE_CXX_FLAGS="-stdlib=libc++ -fPIC"
cmake --build cmake-out --target install -- -j 30

ldconfig /usr/local/lib
