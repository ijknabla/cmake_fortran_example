
cmake_minimum_required(VERSION 3.0)

project(external-library Fortran)
enable_language(Fortran)

find_package(MPI    REQUIRED)
find_package(OpenMP REQUIRED)

set(EXECUTABLE MPI-OpenMP-hybrid)

add_executable(${EXECUTABLE}
  main.f90
  communications.f90
  )
target_link_libraries(${EXECUTABLE}
  PRIVATE
  MPI::MPI_Fortran
  OpenMP::OpenMP_Fortran
  )
