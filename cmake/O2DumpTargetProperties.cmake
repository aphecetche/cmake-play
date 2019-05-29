include_guard()

function(o2_dump_target_properties)
  set(target ${ARGV0})
  get_property(targetType TARGET ${target} PROPERTY TYPE)
  message(STATUS "--------------------------------------------------------")
  message(STATUS "Properties of target ${target} of type ${targetType}")
  message(STATUS)
  set(properties
      INTERFACE_COMPILE_DEFINITIONS
      INTERFACE_COMPILE_FEATURES
      INTERFACE_COMPILE_OPTIONS
      INTERFACE_INCLUDE_DIRECTORIES
      INTERFACE_LINK_DEPENDS
      INTERFACE_LINK_DIRECTORIES
      INTERFACE_LINK_LIBRARIES
      INTERFACE_LINK_OPTIONS
      INTERFACE_POSITION_INDEPENDENT_CODE
      INTERFACE_SOURCES
      INTERFACE_SYSTEM_INCLUDE_DIRECTORIES)
  if(NOT ${targetType} STREQUAL "INTERFACE_LIBRARY")
    list(APPEND properties INCLUDE_DIRECTORIES PUBLIC_LINK_LIBRARIES SOURCES
                PUBLIC_HEADER)
  endif()
  foreach(prop IN LISTS properties)
    get_property(is_set TARGET ${target} PROPERTY ${prop} SET)
    if(is_set)
      get_property(value TARGET ${target} PROPERTY ${prop})
      message(STATUS "${prop} = ${value}")
      message(STATUS)
    endif()
  endforeach()
endfunction()
