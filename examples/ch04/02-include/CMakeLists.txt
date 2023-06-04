cmake_minimum_required(VERSION 3.26)
project(Rental CXX)
include(cars/cars.cmake)
add_executable(Rental
               main.cpp
               ${sources} # for cars/
)
