cmake_minimum_required(VERSION 3.17)

project(play)

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

# note that we are using _our_ module with lower case 'a'
find_package(LibUV MODULE REQUIRED)

include(FeatureSummary)
feature_summary(WHAT ALL FATAL_ON_MISSING_REQUIRED_PACKAGES)
