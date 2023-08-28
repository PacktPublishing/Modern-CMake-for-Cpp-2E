# Defining IMPORTED targets
function(define_imported_target library headers)
  add_library(PQXX::PQXX UNKNOWN IMPORTED)
  set_target_properties(PQXX::PQXX PROPERTIES
    IMPORTED_LOCATION ${library}
    INTERFACE_INCLUDE_DIRECTORIES ${headers}
  )
  set(PQXX_FOUND 1 CACHE INTERNAL "PQXX found" FORCE)
  set(PQXX_LIBRARIES ${library}
      CACHE STRING "Path to pqxx library" FORCE)
  set(PQXX_INCLUDES ${headers}
      CACHE STRING "Path to pqxx headers" FORCE)
  mark_as_advanced(FORCE PQXX_LIBRARIES)
  mark_as_advanced(FORCE PQXX_INCLUDES)
endfunction()

# Accepting user-provided paths and reusing cached values
if (PQXX_LIBRARIES AND PQXX_INCLUDES)
  define_imported_target(${PQXX_LIBRARIES} ${PQXX_INCLUDES})
  return()
endif()

# Searching for nested dependencies
set(QUIET_ARG)
if(PQXX_FIND_QUIETLY)
  set(QUIET_ARG QUIET)
endif()

set(REQUIRED_ARG)
if(PQXX_FIND_REQUIRED)
  set(REQUIRED_ARG REQUIRED)
endif()
find_package(PostgreSQL ${QUIET_ARG} ${REQUIRED_ARG})

# Searching for library files
file(TO_CMAKE_PATH "$ENV{PQXX_DIR}" _PQXX_DIR)
find_library(PQXX_LIBRARY_PATH NAMES libpqxx pqxx
  PATHS
    ${_PQXX_DIR}/lib/${CMAKE_LIBRARY_ARCHITECTURE}
    ${CMAKE_INSTALL_PREFIX}/lib/${CMAKE_LIBRARY_ARCHITECTURE}
    /usr/local/pgsql/lib/${CMAKE_LIBRARY_ARCHITECTURE}
    /usr/local/lib/${CMAKE_LIBRARY_ARCHITECTURE}
    /usr/lib/${CMAKE_LIBRARY_ARCHITECTURE}
    ${_PQXX_DIR}/lib
    ${_PQXX_DIR}
    ${CMAKE_INSTALL_PREFIX}/lib
    ${CMAKE_INSTALL_PREFIX}/bin
    /usr/local/pgsql/lib
    /usr/local/lib
    /usr/lib
  NO_DEFAULT_PATH
)

# Searching for header files
find_path(PQXX_HEADER_PATH NAMES pqxx/pqxx
  PATHS
    ${_PQXX_DIR}/include
    ${_PQXX_DIR}
    ${CMAKE_INSTALL_PREFIX}/include
    /usr/local/pgsql/include
    /usr/local/include
    /usr/include
  NO_DEFAULT_PATH
)

# Returning the final results
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
  PQXX DEFAULT_MSG PQXX_LIBRARY_PATH PQXX_HEADER_PATH
)

if (PQXX_FOUND)
  define_imported_target(
    "${PQXX_LIBRARY_PATH};${POSTGRES_LIBRARIES}"
    "${PQXX_HEADER_PATH};${POSTGRES_INCLUDE_DIRECTORIES}"
  )
endif()
