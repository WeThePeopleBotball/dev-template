cmake_minimum_required(VERSION 3.14)
project(my-robot LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_subdirectory(wtp-lib)

set(TARGET_NAME "main" CACHE STRING "Name of the output binary")
file(GLOB_RECURSE USER_SOURCES CONFIGURE_DEPENDS src/*.cpp)

add_executable(${TARGET_NAME} ${USER_SOURCES})
target_link_libraries(${TARGET_NAME} PRIVATE wtp-lib)
target_include_directories(${TARGET_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)

set_target_properties(${TARGET_NAME} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin"
)
