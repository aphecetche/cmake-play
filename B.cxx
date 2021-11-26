#include "B.h"
#include "A.h"
#include <iostream>

void B::print() const {
  A a{42};

  a.print();
  std::cout << "b=" << b << "\n";
}
