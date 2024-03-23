add_library(calc STATIC basic.cpp)
target_sources(calc
  PUBLIC FILE_SET HEADERS BASE_DIRS include
  FILES "include/calc/basic.h"
)

include(GNUInstallDirs)
install(TARGETS calc 
        ARCHIVE 
        FILE_SET HEADERS 
        )
