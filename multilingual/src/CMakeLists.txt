
set(EXECUTABLE sayHello)

add_executable(${EXECUTABLE}
  greetings.cxx
  greetings.f90
  main.f90
  )

set_target_properties(${EXECUTABLE}
  PROPERTIES
  RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}
  )
