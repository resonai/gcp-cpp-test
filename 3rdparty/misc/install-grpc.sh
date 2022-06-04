#!/bin/bash

set -e

cd grpc-1.43.0/
cmake -H. -Bbuild -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ \
      -DCMAKE_CXX_FLAGS="-stdlib=libc++ -fPIC" -DgRPC_ZLIB_PROVIDER=package \
      -DgRPC_CARES_PROVIDER=package -DgRPC_PROTOBUF_PROVIDER=package \
      -DgRPC_SSL_PROVIDER=package -DgRPC_GFLAGS_PROVIDER=package \
      -DgRPC_BENCHMARK_PROVIDER=package -DgRPC_INSTALL=ON \
      -DgRPC_ABSL_PROVIDER=package   -DgRPC_RE2_PROVIDER=package \
      -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_STANDARD=14
cd build
make -j $(grep -c ^processor /proc/cpuinfo)
make install
ldconfig /usr/local/lib

# TODO(Alex): hack until YBT is fixed: plugin must be named excactly as below
cp /usr/local/bin/grpc_python_plugin /usr/local/bin/protoc-gen-grpc_python
