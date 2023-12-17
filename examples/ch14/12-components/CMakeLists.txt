cmake_minimum_required(VERSION 3.26)
project(Components CXX)
include(GNUInstallDirs)
add_subdirectory(src bin)

install(TARGETS calc EXPORT CalcTargets
  ARCHIVE
    COMPONENT lib
  FILE_SET HEADERS
    COMPONENT headers
)

install(EXPORT CalcTargets
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/calc/cmake
  NAMESPACE Calc::
  COMPONENT lib
)

install(CODE "MESSAGE(\"Installing 'extra' component\")"
  COMPONENT extra
  EXCLUDE_FROM_ALL
)

install(FILES "CalcConfig.cmake"
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/calc/cmake
)
