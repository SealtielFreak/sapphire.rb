#!/bin/bash

if [[ "$(echo $CC)" == *"clang"* ]]; then
    echo "Default compiler: clang"
    SDL2_PKG="mingw-w64-x86_64-clang-sdl2"
    SDL2_IMAGE_PKG="mingw-w64-x86_64-clang-sdl2_image"
    SDL2_MIXER_PKG="mingw-w64-x86_64-clang-sdl2_mixer"
    SDL2_NET_PKG="mingw-w64-x86_64-clang-sdl2_net"
    SDL2_TTF_PKG="mingw-w64-x86_64-clang-sdl2_ttf"
else
    echo "Default compiler: mingw64"
    SDL2_PKG="mingw-w64-x86_64-SDL2"
    SDL2_IMAGE_PKG="mingw-w64-x86_64-SDL2_image"
    SDL2_MIXER_PKG="mingw-w64-x86_64-SDL2_mixer"
    SDL2_NET_PKG="mingw-w64-x86_64-SDL2_net"
    SDL2_TTF_PKG="mingw-w64-x86_64-SDL2_ttf"
fi

pacman -Syu

if ! pacman -Qs sdl2 > /dev/null; then
  echo "SDL2 no found. Installing..."
  pacman -S --needed $SDL2_PKG
fi

if ! pacman -Qs sdl2_image > /dev/null; then
  echo "SDL2_image no found. Installing..."
  pacman -S --needed $SDL2_IMAGE_PKG
fi

if ! pacman -Qs sdl2_mixer > /dev/null; then
  echo "SDL2_mixer no found. Installing..."
  pacman -S --needed $SDL2_MIXER_PKG
fi

if ! pacman -Qs sdl2_net > /dev/null; then
  echo "SDL2_net no found. Installing..."
  pacman -S --needed $SDL2_NET_PKG
fi

if ! pacman -Qs sdl2_ttf > /dev/null; then
  echo "SDL2_ttf no found. Installing..."
  pacman -S --needed $SDL2_TTF_PKG
fi

echo "SDL2 install finished"
