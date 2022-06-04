#!/bin/bash

set -e

cd grpc-1.46.3/
    cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=yes \
      -DCMAKE_CXX_COMPILER=clang++ \
      -DCMAKE_C_COMPILER=clang \
      -DCMAKE_CXX_FLAGS="-stdlib=libc++" \
      -DgRPC_INSTALL=ON \
      -DgRPC_BUILD_TESTS=OFF \
      -DgRPC_ABSL_PROVIDER=package \
      -DgRPC_CARES_PROVIDER=package \
      -DgRPC_PROTOBUF_PROVIDER=package \
      -DgRPC_RE2_PROVIDER=package \
      -DgRPC_SSL_PROVIDER=package \
      -DgRPC_ZLIB_PROVIDER=package \
      -G Ninja -S . -Bcmake-out && \
    cmake --build cmake-out  && \
    cmake --build cmake-out --target install  && \
    ldconfig

# TODO(Alex): hack until YBT is fixed: plugin must be named excactly as below
cp /usr/local/bin/grpc_python_plugin /usr/local/bin/protoc-gen-grpc_python
