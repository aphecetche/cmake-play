#include "A.h"
#include <iostream>

// extern void printA(int) __attribute__((weak_import));
extern void printA(int) __attribute__((weak));

void A::print() const {
  if (printA != NULL) {
    printA(a);
  } else {
    throw std::runtime_error("not linked with an actual A impl");
  }
}
