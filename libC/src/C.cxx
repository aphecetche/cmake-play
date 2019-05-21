#include "C.h"
#include <iostream>

ClassImp(C);

C::C() : mB(10, 4.2) {}

void C::process() { std::cout << "C::process : " << mB.value() << "\n"; }

