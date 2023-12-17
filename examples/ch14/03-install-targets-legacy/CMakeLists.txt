cmake_minimum_required(VERSION 3.22) # legacy
project(InstallTargets CXX)
add_subdirectory(src bin)

include(GNUInstallDirs)
install(TARGETS calc
        ARCHIVE
        PUBLIC_HEADER
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/calc
       )
