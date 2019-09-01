add_library(core core.cxx)
target_include_directories(core PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}>)

