#[=======================================================================[.rst:
FindAllegro4
-------

Finds the Allegro4 library.

Imported Targets
^^^^^^^^^^^^^^^^

This module provides the following imported targets, if found:

``Allegro4::Allegro4``
  The Allegro4 library

Result Variables
^^^^^^^^^^^^^^^^

This will define the following variables:

``Allegro4_FOUND``
  True if the system has the Allegro4 library.
``Allegro4_INCLUDE_DIRS``
  Include directories needed to use Allegro4.
``Allegro4_LIBRARIES``
  Libraries needed to link to Allegro4.

Cache Variables
^^^^^^^^^^^^^^^

The following cache variables may also be set:

``Allegro4_INCLUDE_DIR``
  The directory containing ``allegro.h``.
``Allegro4_LIBRARY``
  The path to the Allegro4 library.

#]=======================================================================]

find_package(PkgConfig QUIET)
pkg_check_modules(PC_ALLEGRO4 QUIET allegro=4)

find_path(
  Allegro4_INCLUDE_DIR
  NAMES allegro.h
  HINTS ${PC_ALLEGRO4_INCLUDEDIR})

find_library(
  Allegro4_LIBRARY
  NAMES alleg4 alleg
  HINTS ${PC_ALLEGRO4_LIBDIR})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
  Allegro4 REQUIRED_VARS "Allegro4_LIBRARY" "Allegro4_INCLUDE_DIR")

if(Allegro4_FOUND)
  if(NOT TARGET Allegro4::Allegro4)
    add_library(Allegro4::Allegro4 UNKNOWN IMPORTED)
    set_target_properties(
      Allegro4::Allegro4
      PROPERTIES IMPORTED_LOCATION "${Allegro4_LIBRARY}"
                 INTERFACE_INCLUDE_DIRECTORIES "${Allegro4_INCLUDE_DIR}"
                 INTERFACE_COMPILE_OPTIONS "${PC_ALLEGRO4_CFLAGS_OTHER}"
                 INTERFACE_LINK_DIRECTORIES "${PC_ALLEGRO4_LIBRARY_DIRS}"
                 INTERFACE_LINK_OPTIONS "${PC_ALLEGRO4_LDFLAGS_OTHER}")
  endif()
  set(artable2_INCLUDE_DIRS "${Allegro4_INCLUDE_DIR}")
  set(artable2_LIBRARIES Allegro4::Allegro4)
endif()

mark_as_advanced(artable2_INCLUDE_DIR Allegro4_LIBRARY)
