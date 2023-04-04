cmake_minimum_required(VERSION 3.24)
project(sapphire C)

set(CMAKE_C_STANDARD 23)
include(FetchContent)
FetchContent_Declare(SDL2
        GIT_REPOSITORY https://github.com/libsdl-org/SDL.git
        GIT_TAG release-2.0.16
        )

FetchContent_Declare(SDL2_ttf
        GIT_REPOSITORY https://github.com/libsdl-org/SDL_ttf.git
        GIT_TAG release-2.0.15
        )

FetchContent_Declare(SDL2_gfx
        URL http://www.ferzkopp.net/Software/SDL2_gfx/SDL2_gfx-1.0.4.tar.gz
        )

FetchContent_Declare(SDL2_mixer
        GIT_REPOSITORY https://github.com/libsdl-org/SDL_mixer.git
        GIT_TAG release-2.0.4
        )

FetchContent_Declare(SDL2_net
        GIT_REPOSITORY https://github.com/libsdl-org/SDL_net.git
        GIT_TAG release-2.0.1
        )

FetchContent_Declare(SDL2_image
        GIT_REPOSITORY https://github.com/libsdl-org/SDL_image.git
        GIT_TAG release-2.0.5
        )

FetchContent_Declare(Ruby
        URL https://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.0.tar.gz
        )

FetchContent_GetProperties(SDL2)
if (NOT SDL2_POPULATED)
    FetchContent_Populate(SDL2)
    add_library(SDL2 INTERFACE)
    target_include_directories(SDL2 INTERFACE ${sdl2_SOURCE_DIR}/include)
    include_directories(${sdl2_SOURCE_DIR}/include)
endif ()

FetchContent_GetProperties(SDL2_ttf)
if (NOT SDL2_TTF_POPULATED)
    FetchContent_Populate(SDL2_ttf)
    add_library(SDL2_ttf INTERFACE)
    target_include_directories(SDL2_ttf INTERFACE ${sdl2_ttf_SOURCE_DIR})
    include_directories(${sdl2_ttf_SOURCE_DIR})
endif ()

FetchContent_GetProperties(SDL2_gfx)
if (NOT SDL2_GFX_POPULATED)
    FetchContent_Populate(SDL2_gfx)
    add_library(SDL2_gfx INTERFACE)
    target_include_directories(SDL2_gfx INTERFACE ${sdl2_gfx_SOURCE_DIR})
    include_directories(${sdl2_gfx_SOURCE_DIR}/include)
endif ()

FetchContent_GetProperties(SDL2_mixer)
if (NOT SDL2_MIXER_POPULATED)
    FetchContent_Populate(SDL2_mixer)
    add_library(SDL2_mixer INTERFACE)
    target_include_directories(SDL2_mixer INTERFACE ${sdl2_mixer_SOURCE_DIR})
    include_directories(${sdl2_mixer_SOURCE_DIR})
endif ()

FetchContent_GetProperties(SDL2_net)
if (NOT SDL2_NET_POPULATED)
    FetchContent_Populate(SDL2_net)
    add_library(SDL2_net INTERFACE)
    target_include_directories(SDL2_net INTERFACE ${sdl2_net_SOURCE_DIR})
    include_directories(${sdl2_net_SOURCE_DIR})
endif ()

FetchContent_GetProperties(SDL2_image)
if (NOT SDL2_IMAGE_POPULATED)
    FetchContent_Populate(SDL2_image)
    add_library(SDL2_image INTERFACE)
    target_include_directories(SDL2_image INTERFACE ${sdl2_image_SOURCE_DIR})
    include_directories(${sdl2_image_SOURCE_DIR})
endif ()

FetchContent_GetProperties(Ruby)
if (NOT Ruby_POPULATED)
    FetchContent_Populate(Ruby)
    add_library(Ruby INTERFACE)
    target_include_directories(Ruby INTERFACE ${ruby_SOURCE_DIR}/include)
    include_directories(${ruby_SOURCE_DIR}/include)
endif ()

add_compile_definitions(SAPPHIRE_C_DEVELOP)

include_directories(ext/src)
include_directories(ext/include)

add_library(sapphire STATIC ext/src/ext.c ext/src/window.c ext/include/klass/window.h ext/include/sdl.h ext/src/exceptions.c ext/include/exceptions.h ext/src/event.c ext/include/klass/event.h)
target_link_libraries(sapphire PRIVATE SDL2 SDL2_mixer SDL2_image SDL2_gfx SDL2_ttf Ruby)