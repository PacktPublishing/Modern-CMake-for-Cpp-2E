cmake_minimum_required(VERSION 3.26)
project(InstallCode CXX)
add_subdirectory(src bin)

include(GNUInstallDirs)
install(TARGETS calc LIBRARY FILE_SET HEADERS)

if (UNIX)
  install(CODE "execute_process(COMMAND ldconfig)")
endif()
