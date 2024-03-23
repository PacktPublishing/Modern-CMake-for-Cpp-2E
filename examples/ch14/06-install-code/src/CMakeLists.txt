add_library(calc SHARED basic.cpp)
target_sources(calc PUBLIC FILE_SET HEADERS
                           BASE_DIRS include
                           FILES include/calc/basic.h
)
