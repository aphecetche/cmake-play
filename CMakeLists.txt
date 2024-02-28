cmake_minimum_required(VERSION 3.13)

project(play)

include(GNUInstallDirs)

find_package(ROOT 6.30 REQUIRED)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

add_library(oldLib)
target_sources(oldLib PUBLIC oldA.cxx)
target_link_libraries(oldLib PUBLIC ROOT::RIO)
target_include_directories(oldLib PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
root_generate_dictionary(G_old oldA.h LINKDEF oldLinkDef.h MODULE oldLib)

add_library(newLib)
target_sources(newLib PUBLIC newA.cxx)
target_link_libraries(newLib PUBLIC ROOT::RIO)
target_include_directories(newLib PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
root_generate_dictionary(G_new newA.h LINKDEF newLinkDef.h MODULE newLib)

add_executable(writeold writeold.cxx)
target_link_libraries(writeold PRIVATE oldLib PUBLIC ROOT::Tree)

add_executable(writenew writenew.cxx)
target_link_libraries(writenew PRIVATE newLib PUBLIC ROOT::Tree)

add_executable(readold readOld.cxx)
target_link_libraries(readold PRIVATE oldLib PUBLIC ROOT::Tree)

add_executable(readnew readNew.cxx)
target_link_libraries(readnew PRIVATE newLib PUBLIC ROOT::Tree)
