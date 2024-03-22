add_library(calc STATIC basic.cpp)
target_sources(calc
  PUBLIC FILE_SET CXX_MODULES FILES extended.cppm
)
target_include_directories(calc PUBLIC include)
target_compile_features(calc PRIVATE cxx_std_20)
set_target_properties(calc PROPERTIES CXX_EXTENSIONS OFF)