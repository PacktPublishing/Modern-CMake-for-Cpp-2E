cmake_minimum_required(VERSION 3.26)
project(InstallFiles CXX)

include(GNUInstallDirs)
install(FILES
              src/include/calc/basic.h
              src/include/calc/nested/extended.h
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/calc
)
