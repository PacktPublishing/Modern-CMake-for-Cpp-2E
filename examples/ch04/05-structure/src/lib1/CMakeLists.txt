add_library(lib1 lib1.cpp)
target_include_directories(lib1 PRIVATE include)
target_include_directories(lib1 PUBLIC include/lib1)
