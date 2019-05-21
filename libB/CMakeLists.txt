add_library(B SHARED src/B.cxx)

target_include_directories(B PUBLIC include)

target_link_libraries(B PUBLIC A)
