
cmake_minimum_required(VERSION 3.0)

enable_language(Fortran)

project(static-library Fortran)

set(STATIC_LIB some )
set(TOOL1      tool1)
set(TOOL2      tool2)

add_library(${STATIC_LIB}
  STATIC
  some_library.f90
  )

add_executable(${TOOL1}
  tool1.f90
  )
target_link_libraries(${TOOL1}
  PRIVATE
  ${STATIC_LIB}
  )

add_executable(${TOOL2}
  tool2.f90
  )
target_link_libraries(${TOOL2}
  PRIVATE
  ${STATIC_LIB}
  )
