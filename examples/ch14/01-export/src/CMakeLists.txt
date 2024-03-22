add_library(calc STATIC basic.cpp)
target_sources(calc
  PUBLIC FILE_SET CXX_MODULES FILES extended.cppm
  PUBLIC FILE_SET HEADERS BASE_DIRS include
  FILES "include/calc/basic.h"
)

target_compile_features(calc PRIVATE cxx_std_20)
set_target_properties(calc PROPERTIES CXX_EXTENSIONS OFF)

export(TARGETS calc
       FILE "${CMAKE_BINARY_DIR}/cmake/CalcTargets.cmake"
       CXX_MODULES_DIRECTORY "modules"
       NAMESPACE Calc::
)

include(GNUInstallDirs)
install(TARGETS calc EXPORT CalcTargets
       CXX_MODULES_BMI DESTINATION "lib"
       FILE_SET CXX_MODULES DESTINATION "lib"
       FILE_SET HEADERS DESTINATION "lib"
)

export(EXPORT CalcTargets
       CXX_MODULES_DIRECTORY "modules2"
       FILE "${CMAKE_BINARY_DIR}/cmake/CalcTargets2.cmake"
       NAMESPACE Calc::
)