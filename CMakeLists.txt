cmake_minimum_required(VERSION 3.10)
project(mrs Fortran)


enable_language(Fortran)

add_dependencies(mrs src/equations_generator)
add_dependencies(mrs src/gaussian_elimination)



add_executable(mrs main.f90)