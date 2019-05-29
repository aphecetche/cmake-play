#
# o2_add_root_dictionary generates one dictionary to be added to a target
#
# * 1st parameter is the name of the associated target.  That target is used to
#   :
#
#   * get the dependencies required to have the correct list of include files
#     when using rootcling
#   * get the destination lib directory for the rootmap generation
#
# * OUTPUT : filename of the output dictionary file (e.g. G__somename.cxx)
# * LINKDEF : filepath to the LinkDef file needed by rootcling
# * HEADERS : the list of filepaths of the headers needed for the generation
#
# Both LINKDEF and HEADERS must be relative paths (relative to the
# CMakeLists.txt that calls this o2_add_root_dictionary function).
#
function(o2_add_root_dictionary)
  cmake_parse_arguments(PARSE_ARGV
                        1
                        A
                        ""
                        "LINKDEF"
                        "HEADERS")

  set(TARGET ${ARGV0})

  set(DICTIONARY_FILE ${CMAKE_CURRENT_BINARY_DIR}/G__${TARGET}Dict.cxx)

  target_sources(${TARGET} PRIVATE ${DICTIONARY_FILE})

  # check all given filepaths are relative ones
  foreach(H ${A_HEADERS} ${A_LINKDEF})
    if(IS_ABSOLUTE ${H})
      message(
        FATAL_ERROR
          "o2_add_root_dictionary only accepts relative paths, not absolute ones."
        )
    endif()
  endforeach()

  # convert all relative paths to absolute ones
  # linkdef must be the last one.
  foreach(H ${A_HEADERS} ${A_LINKDEF})
    get_filename_component(HABS ${CMAKE_CURRENT_SOURCE_DIR}/${H} ABSOLUTE)
    list(APPEND HEADERS ${HABS})
  endforeach()

  # cmake-format: off
  add_custom_command(
          OUTPUT ${DICTIONARY_FILE}
    VERBATIM
    COMMAND
      ${ROOT_rootcling_CMD}
      -f
      ${DICTIONARY_FILE}
      -inlineInputHeader
      -rmf lib${TARGET}.rootmap
      $<GENEX_EVAL:-I$<JOIN:$<TARGET_PROPERTY:${TARGET},INCLUDE_DIRECTORIES>,\;-I>>
      # the generator expression above gets the list of all include 
      # directories that might be required using the  transitive dependencies 
      # of the target ${TARGET} and prepend each item of that list with -I 
      ${INCDIRS} ${HEADERS}
    COMMAND_EXPAND_LISTS)
  # cmake-format: on

  # install the rootmap and pcm files alongside the target's lib
  get_filename_component(DICT ${DICTIONARY_FILE} NAME_WLE)
  install(FILES ${CMAKE_CURRENT_BINARY_DIR}/lib${TARGET}.rootmap
                ${CMAKE_CURRENT_BINARY_DIR}/${DICT}_rdict.pcm
          TYPE LIB)

endfunction()
