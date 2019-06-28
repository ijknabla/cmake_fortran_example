
set(SHARED_LIB reynolds)

add_library(${SHARED_LIB}
  SHARED
  reynolds_lib.f90
  reynolds_c_interface.f90
  reynolds_cxx_interface.cxx
  )
set_target_properties(${SHARED_LIB}
  PROPERTIES
  PUBLIC_HEADER ../include/reynolds.h
  )

install(TARGETS ${SHARED_LIB}
  LIBRARY DESTINATION lib
  PUBLIC_HEADER DESTINATION include
  )

install(FILES
  ${CMAKE_CURRENT_BINARY_DIR}/reynolds_lib.mod
  DESTINATION lib
  )

