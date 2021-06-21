#include "O2Version.h"
#include <iostream>

int main() {
  std::cout << "Version is " << O2_GIT_REVISION << "\n";
  return 0;
}
