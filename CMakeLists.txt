cmake_minimum_required(VERSION 3.15)
project(Interface_Programming C)

set(CMAKE_C_STANDARD 11)

# Debug / Release flags
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    add_compile_options(-Wall -g)
elseif(CMAKE_BUILD_TYPE STREQUAL "Release")
    add_compile_options(-O2)
endif()

# Build the executable
add_executable(Interface_Programming WinAPI.c)

# Link against Windows libraries
if(WIN32)
    target_link_libraries(Interface_Programming PRIVATE user32 gdi32)
endif()
