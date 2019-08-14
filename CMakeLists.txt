cmake_minimum_required(VERSION 3.13)

project(play)

include(GNUInstallDirs)

find_package(Geant4 REQUIRED)
find_package(ROOT 6.16 REQUIRED)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

add_subdirectory(libA)
add_subdirectory(libB)
add_subdirectory(libC)

