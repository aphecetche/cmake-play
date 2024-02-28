#include "oldA.h"
#include <iostream>

namespace OLDNAMESPACE {

void print(const oldA &a) {
  std::cout << "this is olda id=" << a.id << " run=" << a.run << "\n";
}
} // namespace OLDNAMESPACE
