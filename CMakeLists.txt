cmake_minimum_required(VERSION 3.0.0)
project(hello VERSION 0.1.0)

add_compile_options(-Wall -Wextra -pedantic -Werror -Werror=vla)

add_executable(hello "")

add_subdirectory(src)
