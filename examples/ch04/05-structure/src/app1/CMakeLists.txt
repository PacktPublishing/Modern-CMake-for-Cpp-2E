add_subdirectory(lib3)
add_executable(app1 main.cpp class_a.cpp class_b.cpp)
target_include_directories(app1 PRIVATE include)
target_link_libraries(app1 PRIVATE lib1 lib2 lib3)
