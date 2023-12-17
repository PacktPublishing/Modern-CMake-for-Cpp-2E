add_library(calc STATIC calc.cpp)
target_include_directories(calc INTERFACE
  "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
  "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>"
)
target_sources(calc PUBLIC FILE_SET HEADERS
                           BASE_DIRS include
                           FILES include/calc/calc.h
)
