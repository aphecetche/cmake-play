cmake_minimum_required(VERSION 3.15)

project(play VERSION 1.2.3 LANGUAGES CXX)

set(CMAKE_CXX_FLAGS "-O3")

add_executable(insane)
target_sources(insane PRIVATE insane.cxx)

set(CMAKE_CXX_FLAGS "-g -O1 -fsanitize=address")
