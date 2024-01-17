cmake_minimum_required(VERSION 3.26)

message([[multiline
bracket
argument
]])

message([==[
  because we used two equal-signs "=="
  this command receives only a single argument
  even if it includes two square brackets in a row
  { "petsArray" = [["mouse","cat"],["dog"]] }
]==])
