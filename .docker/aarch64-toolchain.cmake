# Toolchain compilers
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR aarch64)

set(CMAKE_C_COMPILER /usr/bin/aarch64-linux-gnu-gcc)
set(CMAKE_CXX_COMPILER /usr/bin/aarch64-linux-gnu-g++)

# Root path where target libraries and headers are
set(CMAKE_FIND_ROOT_PATH /usr/aarch64-linux-gnu)

# Ensure CMake searches this path for packages like absl
set(CMAKE_PREFIX_PATH /usr/aarch64-linux-gnu)

# Search headers and libraries in the sysroot first
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
