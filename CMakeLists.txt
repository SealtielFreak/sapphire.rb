cmake_minimum_required(VERSION 3.24)
project(sapphire C)

set(CMAKE_C_STANDARD 11)

include(FetchContent)

FetchContent_Declare(Ruby
        URL https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0.tar.gz
        )


FetchContent_GetProperties(Ruby)
if (NOT Ruby_POPULATED)
    FetchContent_Populate(Ruby)
    add_library(Ruby INTERFACE)
    target_include_directories(Ruby INTERFACE ${ruby_SOURCE_DIR}/include)
    include_directories(${ruby_SOURCE_DIR}/include)
endif ()

include(FetchContent)
FetchContent_Declare(CSFML
        URL https://www.sfml-dev.org/files/CSFML-2.5.1-sources.zip
)
FetchContent_GetProperties(CSFML)
if (NOT CSFML_POPULATED)
    FetchContent_Populate(CSFML)
    add_library(CSFML INTERFACE)
    target_include_directories(CSFML INTERFACE ${csfml_SOURCE_DIR}/include)
    include_directories(${csfml_SOURCE_DIR}/include)
endif ()

add_compile_definitions(SAPPHIRE_C_DEVELOP)

include_directories(ext/src)
include_directories(ext/include)

add_library(sapphire STATIC ext/src/ext.c ext/src/exceptions.c ext/include/exceptions.h)
target_link_libraries(sapphire PRIVATE CSFML Ruby)