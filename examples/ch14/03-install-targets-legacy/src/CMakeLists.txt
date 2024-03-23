add_library(calc STATIC basic.cpp)
target_include_directories(calc PUBLIC include)
set_target_properties(calc PROPERTIES
    PUBLIC_HEADER include/calc/basic.h
)

include(GNUInstallDirs)
install(TARGETS calc EXPORT CalcTargets
        ARCHIVE
        PUBLIC_HEADER 
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/calc
       )
install(EXPORT CalcTargets
       DESTINATION ${CMAKE_INSTALL_LIBDIR}/calc/cmake
       NAMESPACE Calc::
)