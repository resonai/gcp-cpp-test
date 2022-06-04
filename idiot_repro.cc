#include <string>;
using namespace std;

int main (int argc, char* argv[]) {
  system(("repro " + string(argv[1]) + string(argv[2])).c_str());
  return 0;
}
