cmake_minimum_required(VERSION 3.26)

set(COUNT 3)
while(COUNT GREATER 0)
  message("COUNT: ${COUNT}")
  math(EXPR COUNT "${COUNT}-1")
endwhile()
