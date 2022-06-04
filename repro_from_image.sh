cat >repro.cc <<_EOF_
#include <google/cloud/storage/client.h>
#include <iostream>
#include <stdexcept>

namespace gcs = ::google::cloud::storage;

int main(int argc, char* argv[]) try {
  if (argc != 3) {
    std::cerr << "Usage: " << argv[0] << " <bucket-name> <prefix>\n";
    return 1;
  }

  auto const bucket_name = std::string(argv[1]);
  auto const prefix = std::string(argv[2]);

  auto client = gcs::Client();

  std::cout << "before list objects\n";
  auto reader = client.ListObjects(bucket_name, gcs::Prefix(prefix));
  std::cout << "before for\n";
  for (auto&& object_metadata : reader) {
    if (!object_metadata)
      std::cout << "has no md\n";
    else
      std::cout << "has md\n";
  }
  std::cout << "after for\n";

  return 0;
} catch (std::exception const& ex) {
  std::cerr << "Standard exception raised: " << ex.what() << "\n";
  return 1;
}
_EOF_

cat >CMakeLists.txt <<'_EOF_'
cmake_minimum_required(VERSION 3.20)
project(repro-b-234717882 CXX)

find_package(google_cloud_cpp_storage REQUIRED)


add_executable(repro repro.cc)
target_link_libraries(repro google-cloud-cpp::storage)
_EOF_
cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_CXX_COMPILER=clang++-14 \
      -DCMAKE_CXX_FLAGS="-stdlib=libc++" \
      -G Ninja -S . -B cmake-out && \
    cmake --build cmake-out
