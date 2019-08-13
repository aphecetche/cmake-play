cmake_minimum_required(VERSION 3.13)


set(CMAKE_CXX_FLAGS_DEBUG "-g -O0")

project(play)


set(CMAKE_CXX_STANDARD 17)
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

add_executable(toto main.cxx)

