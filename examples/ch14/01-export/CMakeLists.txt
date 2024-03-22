cmake_minimum_required(VERSION 3.28)
project(ExportCalc CXX)

add_subdirectory(src bin)

set(EXPORT_DIR "${CMAKE_CURRENT_BINARY_DIR}/cmake")

export(TARGETS calc
       FILE "${EXPORT_DIR}/CalcTargets.cmake"
       CXX_MODULES_DIRECTORY "${EXPORT_DIR}/modules"
       NAMESPACE Calc::
)

include(GNUInstallDirs)
install(TARGETS calc EXPORT CalcTargets
       CXX_MODULES_BMI DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT runtime
       FILE_SET CXX_MODULES DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT runtime
)

export(EXPORT CalcTargets
       CXX_MODULES_DIRECTORY "${EXPORT_DIR}/modules2"
       FILE "${EXPORT_DIR}/CalcTargets2.cmake"
       NAMESPACE Calc::
)
