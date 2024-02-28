#ifndef __OLDA__H
#define __OLDA__H

#include "TObject.h"
#include <string>

namespace OLDNAMESPACE {
struct oldA : public TObject {
  std::string id;
  int run;
  int runnumber;

  ClassDef(oldA, 1);
};

void print(const oldA &);
} // namespace OLDNAMESPACE

#endif
