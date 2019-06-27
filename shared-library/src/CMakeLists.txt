
set(SHARED_LIB reynolds)

add_library(${SHARED_LIB}
  SHARED
  reynolds_lib.f90
  reynolds_c_interface.f90
  reynolds_cxx_interface.cxx
  )

