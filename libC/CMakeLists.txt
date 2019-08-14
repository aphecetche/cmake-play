add_library(playlib-C SHARED src/C.cxx src/C2.cxx)
add_library(C ALIAS playlib-C)

target_include_directories(playlib-C PUBLIC include)

include(O2TargetRootDictionary)
o2_target_root_dictionary(C
        HEADERS include/C.h src/C2.h 
        LINKDEF src/CLinkDef.h)

target_link_libraries(playlib-C PUBLIC ROOT::Core B)

include(O2DumpTargetProperties)
o2_dump_target_properties(C)

