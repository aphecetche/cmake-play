add_library(C SHARED src/C.cxx src/C2.cxx)

target_include_directories(C PUBLIC include)

include(O2AddRootDictionary)
o2_add_root_dictionary(C
        HEADERS include/C.h src/C2.h 
        LINKDEF src/CLinkDef.h)

target_link_libraries(C PUBLIC ROOT::Core B)

include(O2DumpTargetProperties)
o2_dump_target_properties(C)

