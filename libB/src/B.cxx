#include "B.h"
#include <iostream>

B::B(int i, float f) : mA(i), mFactor(f) {}

float B::value() const { return mA.value() * mFactor; }

