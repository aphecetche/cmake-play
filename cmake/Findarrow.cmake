# Copyright CERN and copyright holders of ALICE O2. This software is distributed
# under the terms of the GNU General Public License v3 (GPL Version 3), copied
# verbatim in the file "COPYING".
#
# See http://alice-o2.web.cern.ch/license for full licensing information.
#
# In applying this license CERN does not waive the privileges and immunities
# granted to it by virtue of its status as an Intergovernmental Organization or
# submit itself to any jurisdiction.

# Simply provide a namespaced alias for the existing target

set(CMAKE_FIND_PACKAGE_PREFER_CONFIG_ORIG ${CMAKE_FIND_PACKAGE_PREFER_CONFIG})
set(CMAKE_FIND_PACKAGE_PREFER_CONFIG ON)
find_package(Arrow CONFIG QUIET)
if(Arrow_FOUND)
        find_package(Gandiva CONFIG PATHS ${Arrow_DIR} NO_DEFAULT_PATH QUIET)
endif()
set(CMAKE_FIND_PACKAGE_PREFER_CONFIG ${CMAKE_FIND_PACKAGE_PREFER_CONFIG_ORIG})

# Promote the imported target to global visibility (so we can alias it)
set_target_properties(arrow_shared PROPERTIES IMPORTED_GLOBAL TRUE)
add_library(arrow::arrow_shared ALIAS arrow_shared)

if(TARGET gandiva_shared)
        # Promote the imported target to global visibility (so we can alias it)
        set_target_properties(gandiva_shared PROPERTIES IMPORTED_GLOBAL TRUE)
        add_library(arrow::gandiva_shared ALIAS gandiva_shared)
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(arrow REQUIRED_VARS Arrow_DIR)

if(TARGET arrow::arrow_shared)
        message(STATUS "arrow::arrow_shared target is defined")
endif()
if(TARGET arrow::gandiva_shared)
        message(STATUS "arrow::gandiva_shared target is defined")
endif()
