add_library(cars OBJECT
    car.cpp
#   more files in other directories
)
target_include_directories(cars PUBLIC .)
