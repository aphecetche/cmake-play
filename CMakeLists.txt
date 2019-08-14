cmake_minimum_required(VERSION 3.13)



project(play)


# correct way to do it : set the (non-cache) variable to the default desired value,
# but developers can still change the CACHE if they want to
# string(APPEND CMAKE_CXX_FLAGS_DEBUG " -O0")

# incorrect way to do it : force unilateraly the value : developpers can no longer
# change the value unless they mess with this CMakeList.txt itself.
set(CMAKE_CXX_FLAGS_DEBUG "-g -O0" CACHE STRING "Debug mode build flags" FORCE)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

add_executable(toto main.cxx)

message(STATUS "CMAKE_CXX_FLAGS_DEBUG=${CMAKE_CXX_FLAGS_DEBUG}")
