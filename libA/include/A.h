#ifndef __A__
#define __A__

#include "TObject.h"

class A : public TObject {
public:
  A(int val = 42);

  int value() const;

private:
  int mValue;

  ClassDef(A, 1);
};
#endif
