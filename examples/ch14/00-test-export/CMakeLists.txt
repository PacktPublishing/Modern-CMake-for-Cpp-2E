# this example only checks if 01-export can be imported
cmake_minimum_required(VERSION 3.28)
project(TestExport CXX)
include("../01-export/build/cmake/CalcTargets.cmake")
# Libc++ has no support compiler extensions for modules.
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD 20)


include(CMakePrintHelpers)
cmake_print_properties(TARGETS "Calc::calc" PROPERTIES
  IMPORTED_CONFIGURATIONS
  INTERFACE_INCLUDE_DIRECTORIES
)

add_executable(main main.cpp)
target_link_libraries(main PRIVATE Calc::calc)
