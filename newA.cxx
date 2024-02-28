#include "newA.h"
#include <iostream>

namespace NEWNAMESPACE {

void print(const newA &a) {
  std::cout << "this is newa id=" << a.id << " run=" << a.run << "\n";
}
} // namespace NEWNAMESPACE
