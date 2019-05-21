#
# o2_generate_root_dictionary generates one dictionary source file.
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
function(o2_generate_root_dictionary)
  cmake_parse_arguments(PARSE_ARGV
                        1
                        A
                        ""
                        "OUTPUT;LINKDEF"
                        "HEADERS")

  set(DEPSFROM ${ARGV0})

  # get the directories and filenames of the provided headers
  foreach(H ${A_HEADERS} ${A_LINKDEF})
    get_filename_component(FILEPATH ${H} ABSOLUTE)
    get_filename_component(DIR ${FILEPATH} DIRECTORY)
    get_filename_component(FILENAME ${FILEPATH} NAME)
    list(APPEND HEADERS ${FILENAME})
    list(APPEND INCDIRS -I${DIR})
  endforeach()
  # try to limit the number of duplicates in the include paths. note that
  # unfortunately the generator expression below might contains some duplicates
  # to those in INCDIRS. Not completely clean but should not hurt.
  list(REMOVE_DUPLICATES INCDIRS)

  # cmake-format: off
  add_custom_command(
    OUTPUT ${A_OUTPUT}
    VERBATIM
    COMMAND
      ${ROOT_rootcling_CMD}
      -f
      ${A_OUTPUT}
      -rmf lib${DEPSFROM}.rootmap
      $<GENEX_EVAL:-I$<JOIN:$<TARGET_PROPERTY:${DEPSFROM},INTERFACE_INCLUDE_DIRECTORIES>,\;-I>>
      # the generator expression above gets the list of all include 
      # directories that might be required using the  transitive dependencies 
      # of the target ${DEPSFROM} and prepend each item of that list with -I 
      -c
      ${INCDIRS} ${HEADERS}
    COMMAND_EXPAND_LISTS)
  # cmake-format: on

  # install the rootmap and pcm files alongside the target's lib
  get_filename_component(DICT ${A_OUTPUT} NAME_WLE)
  install(FILES ${CMAKE_CURRENT_BINARY_DIR}/lib${DEPSFROM}.rootmap
                ${CMAKE_CURRENT_BINARY_DIR}/${DICT}_rdict.pcm
          TYPE LIB)

endfunction()
