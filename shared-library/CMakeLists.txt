
cmake_minimum_required(VERSION 3.0)

enable_language(Fortran)
enable_testing()

project(shared-library Fortran CXX)

include_directories(include)
add_subdirectory(src)
