#include "A.h"
#include <iostream>

// extern void printA(int) __attribute__((weak_import));
extern void printA(int) __attribute__((weak));
extern void printB(int) __attribute__((weak));

void A::print() const {
  if (printA == NULL) {
    throw std::runtime_error("not linked with an actual A impl");
  } else {
    if (printB == NULL) {
      throw std::runtime_error("not linked with an actual B impl");
    } else {
      printA(a);
      printB(a);
    }
  }
}
