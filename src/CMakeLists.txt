
include_directories(${CMAKE_BINARY_DIR}/version)
add_executable(play)
target_sources(play PRIVATE play.cxx)
