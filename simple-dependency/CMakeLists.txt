
cmake_minimum_required(VERSION 3.0)

enable_language(Fortran)

project(simple-dependency Fortran)

set(EXECUTABLE abcd)

add_executable(${EXECUTABLE}
  a.f90
  b.f90
  c.f90
  d.f90
  main.f90
  )
