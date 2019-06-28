
cmake_minimum_required(VERSION 3.0)

enable_language(Fortran)

project(more-dependency Fortran)

set(EXECUTABLE a_to_z)

add_executable(${EXECUTABLE}
  a.f90
  b.f90
  c.f90
  d.f90
  e.f90
  f.f90
  g.f90
  h.f90
  i.f90
  j.f90
  k.f90
  l.f90
  m.f90
  n.f90
  o.f90
  p.f90
  q.f90
  r.f90
  s.f90
  t.f90
  u.f90
  v.f90
  w.f90
  x.f90
  y.f90
  z.f90
  main.f90
  )
