#include <iostream>
#include <stdexcept>

#include "ybtproto/proto_test/test.pb.h"

int main(int argc, char* argv[]) try {

  ywz::Test t;

} catch (std::exception const& ex) {
  std::cerr << "Standard exception raised: " << ex.what() << "\n";
  return 1;
}
