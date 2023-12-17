add_library(calc SHARED calc.cpp)
target_include_directories(calc INTERFACE include)
target_sources(calc PUBLIC FILE_SET HEADERS
                           BASE_DIRS include
                           FILES include/calc/calc.h
)
