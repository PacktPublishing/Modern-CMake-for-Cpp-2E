cmake_minimum_required(VERSION 3.26.0)
project(CXXModules CXX)

# turn on the experimental API
if(CMAKE_VERSION VERSION_GREATER_EQUAL 3.28.0)
  # We don't know yet if 3.28 wil require API gate flag,
  # or what will be its value
  message(FATAL_ERROR "Version higher than 3.27 not supported")
elseif(CMAKE_VERSION VERSION_GREATER_EQUAL 3.27.0)
  set(CMAKE_EXPERIMENTAL_CXX_MODULE_CMAKE_API
      "aa1f7df0-828a-4fcd-9afc-2dc80491aca7")
elseif(CMAKE_VERSION VERSION_GREATER_EQUAL 3.26.0)
  set(CMAKE_EXPERIMENTAL_CXX_MODULE_CMAKE_API
      "2182bf5c-ef0d-489a-91da-49dbc3090d2a")
  set(CMAKE_EXPERIMENTAL_CXX_MODULE_DYNDEP 1)
else()
  message(FATAL_ERROR "Version lower than 3.26 not supported")
endif()

# Libc++ has no support compiler extensions for modules.
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD 20)

add_library(math)
target_sources(math
  PUBLIC FILE_SET cxx_modules TYPE CXX_MODULES FILES math.cpp
)
add_executable(main main.cpp)
target_link_libraries(main PRIVATE math)
