# Generate O2Version.h header that contains a couple of useful fields such as
# the git commit with which we build. We can also use this to define VERSION
# MACROS etc.

if(DEFINED ENV{O2_GIT_REVISION})
  set(O2_GIT_REVISION $ENV{O2_GIT_REVISION})
else()
  set(O2_GIT_REVISION "--unknown--")
endif()

if(DEFINED ENV{ALIDIST_GIT_REVISION})
  set(ALIDIST_GIT_REVISION $ENV{ALIDIST_GIT_REVISION})
else()
  set(ALIDIST_GIT_REVISION "--unknown--")
endif()

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/O2Version.h.in
               ${CMAKE_CURRENT_BINARY_DIR}/O2Version.h @ONLY)

# install the generated header
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/O2Version.h DESTINATION include)
