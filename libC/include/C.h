#ifndef __C__
#define __C__

#include "B.h"
#include "TObject.h"

class C : public TObject {
public:
  C();
  void process();

private:
  B mB;
  ClassDef(C, 1);
};

#endif
