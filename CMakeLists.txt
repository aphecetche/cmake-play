cmake_minimum_required(VERSION 3.13)

project(play)

include(GNUInstallDirs)

set(CMAKE_CXX_STANDARD 17)
set(BUILD_SHARED_LIBS ON)

add_subdirectory(det)
add_subdirectory(fwk)
add_subdirectory(fwk/wflow)

