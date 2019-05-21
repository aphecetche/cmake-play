#include "A.h"

ClassImp(A);

A::A(int value) : mValue(value) {}

int A::value() const { return mValue; }
