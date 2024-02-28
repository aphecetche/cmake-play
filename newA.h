#ifndef __NEWA__H
#define __NEWA__H

#include "TObject.h"
#include <string>

namespace NEWNAMESPACE {
struct newA {
  std::string id;
  int run;

  ClassDef(newA, 1);
};

void print(const newA &);
} // namespace NEWNAMESPACE

#endif
