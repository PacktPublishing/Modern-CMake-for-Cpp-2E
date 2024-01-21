#include "class_a.h"
#include "lib2.h"
std::string ClassA::method() {
  Lib2 lib2;
  return lib2.method();
};
