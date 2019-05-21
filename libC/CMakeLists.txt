add_library(C SHARED src/C.cxx src/C2.cxx ${CMAKE_CURRENT_BINARY_DIR}/G__C.cxx)

target_include_directories(C PUBLIC include PRIVATE src)

include(O2GenerateRootDictionary)
o2_generate_root_dictionary(C
        OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/G__C.cxx
        HEADERS include/C.h src/C2.h 
        LINKDEF src/CLinkDef.h)

target_link_libraries(C PUBLIC ROOT::Core B)
