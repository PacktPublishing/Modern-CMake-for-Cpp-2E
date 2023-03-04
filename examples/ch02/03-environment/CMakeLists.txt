cmake_minimum_required(VERSION 3.26)
project(Environment)

message("generated with " $ENV{myenv})
add_custom_target(EchoEnv ALL COMMAND echo "myenv in build is" $ENV{myenv})
