cmake_minimum_required(VERSION 3.26)

macro(Test myVar)
  set(myVar "new value")
  message("argument: ${myVar}")
endmacro()

set(myVar "first value")
message("myVar is now: ${myVar}")
Test("called value")
message("myVar is now: ${myVar}")
