cmake_minimum_required(VERSION 3.26)
project(ExternalProjectGit CXX)

add_executable(welcome main.cpp)
configure_file(config.yaml config.yaml COPYONLY)

include(FetchContent)
FetchContent_Declare(external-yaml-cpp
  GIT_REPOSITORY    shttps://github.com/jbeder/yaml-cpp.git
  GIT_TAG           0.8.0
  FIND_PACKAGE      yaml-cpp
)
FetchContent_MakeAvailable(external-yaml-cpp)
target_link_libraries(welcome PRIVATE yaml-cpp)

include(CMakePrintHelpers)
cmake_print_properties(TARGETS yaml-cpp
                       PROPERTIES TYPE SOURCE_DIR)
