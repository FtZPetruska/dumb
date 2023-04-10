#[=======================================================================[.rst:
Findargtable2
-------

Finds the argtable2 library.

Imported Targets
^^^^^^^^^^^^^^^^

This module provides the following imported targets, if found:

``argtable2::argtable2``
  The argtable2 library

Result Variables
^^^^^^^^^^^^^^^^

This will define the following variables:

``argtable2_FOUND``
  True if the system has the argtable2 library.
``argtable2_INCLUDE_DIRS``
  Include directories needed to use argtable2.
``argtable2_LIBRARIES``
  Libraries needed to link to argtable2.

Cache Variables
^^^^^^^^^^^^^^^

The following cache variables may also be set:

``argtable2_INCLUDE_DIR``
  The directory containing ``argtable2.h``.
``argtable2_LIBRARY``
  The path to the argtable2 library.

#]=======================================================================]

find_package(PkgConfig QUIET)
pkg_check_modules(PC_ARGTABLE2 QUIET argtable2)

find_path(
  argtable2_INCLUDE_DIR
  NAMES argtable2.h
  HINTS ${PC_ARGTABLE2_INCLUDEDIR})

find_library(
  argtable2_LIBRARY
  NAMES argtable2
  HINTS ${PC_ARGTABLE2_LIBDIR})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
  argtable2 REQUIRED_VARS "argtable2_LIBRARY" "argtable2_INCLUDE_DIR")

if(argtable2_FOUND)
  if(NOT TARGET argtable2::argtable2)
    add_library(argtable2::argtable2 UNKNOWN IMPORTED)
    set_target_properties(
      argtable2::argtable2
      PROPERTIES IMPORTED_LOCATION "${argtable2_LIBRARY}"
                 INTERFACE_INCLUDE_DIRECTORIES "${argtable2_INCLUDE_DIR}"
                 INTERFACE_COMPILE_OPTIONS "${PC_ARGTABLE2_CFLAGS_OTHER}"
                 INTERFACE_LINK_DIRECTORIES "${PC_ARGTABLE2_LIBRARY_DIRS}"
                 INTERFACE_LINK_OPTIONS "${PC_ARGTABLE2_LDFLAGS_OTHER}")
  endif()
  set(artable2_INCLUDE_DIRS "${argtable2_INCLUDE_DIR}")
  set(artable2_LIBRARIES argtable2::argtable2)
endif()

mark_as_advanced(artable2_INCLUDE_DIR argtable2_LIBRARY)
