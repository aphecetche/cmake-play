cmake_minimum_required(VERSION 3.13)

enable_testing()

project(play)

find_package(Boost REQUIRED)

include(GNUInstallDirs)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

add_library(A SHARED)
target_sources(A PUBLIC A.cxx)
if(APPLE)
  target_link_options(A PUBLIC "LINKER:-U,printA,-U,printB,-undefined,dynamic_lookup")
endif()

add_library(B SHARED)
target_sources(B PUBLIC B.cxx)
target_link_libraries(B PUBLIC A)

add_library(Aimpl1 SHARED)
target_sources(Aimpl1 PUBLIC Aimpl1.cxx)

add_library(Aimpl2 SHARED)
target_sources(Aimpl2 PUBLIC Aimpl2.cxx)

add_executable(failing failing.cxx)
target_link_libraries(failing PUBLIC B Boost::headers)

add_executable(passing1 passing.cxx)
target_link_libraries(passing1 PUBLIC B Aimpl1 Boost::headers)

add_executable(passing2 passing.cxx)
target_link_libraries(passing2 PUBLIC B Aimpl2 Boost::headers)

# the following should not link (on purpose) as printB and printA are
# defined in the two libraries.
# add_executable(toto passing.cxx)
# target_link_libraries(toto PUBLIC B Aimpl1 Aimpl2 Boost::headers)

add_test(failing failing)
add_test(passing1 passing1)
add_test(passing2 passing2)

