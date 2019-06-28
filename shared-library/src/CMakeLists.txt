
set(SHARED_LIB   reynolds    )
set(FORTRAN_TEST fortran_test)
set(CXX_TEST     cxx_test    )

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

add_executable(${FORTRAN_TEST}
  fortran_test.f90
  )
target_link_libraries(${FORTRAN_TEST}
  PRIVATE
  ${SHARED_LIB}
  )

add_executable(${CXX_TEST}
  cxx_test.cxx
  )
target_link_libraries(${CXX_TEST}
  PRIVATE
  ${SHARED_LIB}
  )

add_test(
  NAME Fortran_Compertibility
  COMMAND $<TARGET_FILE:${FORTRAN_TEST}>
  )

add_test(
  NAME C++_Compertibility
  COMMAND $<TARGET_FILE:${CXX_TEST}>
  )
