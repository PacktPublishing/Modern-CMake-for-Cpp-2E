cmake_minimum_required(VERSION 3.26)
project(Testing CXX)

add_library(program program.cpp)

add_executable(main main.cpp)
target_link_libraries(main program)

add_executable(test test.cpp)
target_link_libraries(test program)
