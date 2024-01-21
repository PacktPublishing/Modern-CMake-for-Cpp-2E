#include <iostream>
#include "lib1.h"
#include "class_a.h"
#include "class_b.h"

int main() {
  std::cout << "App1 main()" << std::endl;

  ClassA class_a;
  std::cout << class_a.method() << std::endl;

  ClassB class_b;
  std::cout << class_b.method() << std::endl;

  return 0;
}
