cmake_minimum_required(VERSION 3.26)
project(InstallTargets CXX)
add_subdirectory(src bin)

include(GNUInstallDirs)
install(TARGETS calc ARCHIVE FILE_SET HEADERS)
