add_library(A SHARED src/A.cxx G__A.cxx)

add_custom_command(OUTPUT G__A.cxx
  COMMAND ${ROOT_rootcling_CMD} -f G__A.cxx
  -I${CMAKE_CURRENT_SOURCE_DIR}/src 
  -I${CMAKE_CURRENT_SOURCE_DIR}/include 
  -c A.h ALinkDef.h)

target_link_libraries(A PUBLIC ROOT::Core)

target_include_directories(A PUBLIC include)
