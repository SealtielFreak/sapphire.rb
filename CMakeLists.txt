cmake_minimum_required(VERSION 3.24)
project(sapphire C)

set(CMAKE_C_STANDARD 23)

include_directories(ext/src)
include_directories(ext/deps)
include_directories(ext/include)

add_library(sapphire SHARED ext/sapphire.c)
