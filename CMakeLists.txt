cmake_minimum_required(VERSION 3.13)

enable_testing()

project(play)

find_package(Boost REQUIRED)

include(GNUInstallDirs)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

add_library(A SHARED)
target_sources(A PRIVATE A.cxx)
target_link_options(A PUBLIC "LINKER:-U,printA,-undefined,dynamic_lookup")

add_library(B SHARED)
target_sources(B PRIVATE B.cxx)
target_link_libraries(B PRIVATE A)

add_library(Aimpl SHARED)
target_sources(Aimpl PRIVATE Aimpl.cxx)

add_executable(failing failing.cxx)
target_link_libraries(failing PUBLIC B Boost::headers)

add_executable(passing passing.cxx)
target_link_libraries(passing PUBLIC B Aimpl Boost::headers)

add_test(failing failing)
add_test(passing passing)

