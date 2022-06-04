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
    else {
      std::cout << "Got OK object_metadata " << object_metadata->kind()
                << std::endl;
      std::cout << object_metadata->name() << "has md, size: "
                << object_metadata->size() << std::endl;

      google::cloud::StatusOr<gcs::ObjectMetadata> m =
          client.GetObjectMetadata(object_metadata->bucket(),
                                   object_metadata->name());
      if (!m)
        std::cout << "GetObjectMetadata failed\n";
      else {
        std::cout << m->name() << " has md, size: "<< m->size() << std::endl;
      }
    }
  }
  std::cout << "after for\n";

  return 0;
} catch (std::exception const& ex) {
  std::cerr << "Standard exception raised: " << ex.what() << "\n";
  return 1;
}
