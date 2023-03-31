#!/bin/sh

if [ -x "$(command -v dnf)" ]; then
    sudo dnf install SDL2_ttf-devel SDL2_gfx-devel SDL2_mixer-devel SDL2_image-devel
elif [ -x "$(command -v apt-get)" ]; then
    sudo apt-get install libsdl2-ttf-dev libsdl2-gfx-dev libsdl2-mixer-dev libsdl2-image-dev
elif [ -x "$(command -v zypper)" ]; then
    sudo zypper install libSDL2_ttf-devel libSDL2_gfx-devel libSDL2_mixer-devel libSDL2_image-devel
elif [ -x "$(command -v pacman)" ]; then
    sudo pacman -S mingw-w64-x86_64-SDL2_ttf mingw-w64-x86_64-SDL2_gfx mingw-w64-x86_64-SDL2_mixer mingw-w64-x86_64-SDL2_image mingw-w64-i686-SDL2_ttf mingw-w64-i686-SDL2_gfx mingw-w64-i686-SDL2_mixer mingw-w64-i686-SDL2_image
elif [ -x "$(command -v emerge)" ]; then
    sudo emerge media-libs/libsdl2_ttf media-libs/libsdl2_gfx media-libs/libsdl2_mixer media-libs/libsdl2_image
else
    echo "You need manually install SDL2!"
fi
