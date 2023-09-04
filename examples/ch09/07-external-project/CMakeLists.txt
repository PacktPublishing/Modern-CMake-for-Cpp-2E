# Based on a great article by Craig Scott:
# https://crascit.com/2015/07/25/cmake-gtest/.

cmake_minimum_required(VERSION 3.26)
project(ExternalProject CXX)

add_executable(welcome main.cpp)
configure_file(config.yaml config.yaml COPYONLY)

configure_file(yaml-cpp.in yaml-download/CMakeLists.txt)
execute_process(COMMAND "${CMAKE_COMMAND}" -G "${CMAKE_GENERATOR}" .
    WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/yaml-download"
)
execute_process(COMMAND "${CMAKE_COMMAND}" --build .
    WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/yaml-download"
)
add_subdirectory("${CMAKE_BINARY_DIR}/yaml-cpp-src"
                 "${CMAKE_BINARY_DIR}/yaml-cpp-build"
)

target_link_libraries(welcome PRIVATE yaml-cpp::yaml-cpp)
