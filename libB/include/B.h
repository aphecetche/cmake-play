#ifndef __B__
#define __B__

#include "A.h"

class B {
public:
  B(int i, float f);

  float value() const;

private:
  A mA;
  float mFactor;
};

#endif
