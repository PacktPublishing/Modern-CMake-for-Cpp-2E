cmake_minimum_required(VERSION 3.26)
project(Debug CXX)

add_executable(debug hello.cpp)
target_compile_options(debug PRIVATE -save-temps=obj)

add_executable(inclusion hello.cpp)
target_compile_options(inclusion PRIVATE -H)
