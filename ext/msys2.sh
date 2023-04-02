#!/bin/bash

if which x86_64-pc-msys-gcc > /dev/null; then
  echo "Default compiler: clang"
  SDL2_PKG="mingw-w64-x86_64-clang-sdl2"
  SDL2_IMAGE_PKG="mingw-w64-x86_64-clang-sdl2_image"
  SDL2_MIXER_PKG="mingw-w64-x86_64-clang-sdl2_mixer"
  SDL2_NET_PKG="mingw-w64-x86_64-clang-sdl2_net"
  SDL2_TTF_PKG="mingw-w64-x86_64-clang-sdl2_ttf"
  SDL2_GFX_PKG="mingw-w64-x86_64-clang-sdl2_gfx"
  INCLUDE_PATH="/usr/include"
elif which x86_64-w64-mingw32-gcc > /dev/null; then
  echo "Default compiler: mingw64"
  SDL2_PKG="mingw-w64-x86_64-SDL2"
  SDL2_IMAGE_PKG="mingw-w64-x86_64-SDL2_image"
  SDL2_MIXER_PKG="mingw-w64-x86_64-SDL2_mixer"
  SDL2_NET_PKG="mingw-w64-x86_64-SDL2_net"
  SDL2_TTF_PKG="mingw-w64-x86_64-SDL2_ttf"
  SDL2_GFX_PKG="mingw-w64-x86_64-SDL2_gfx"
  INCLUDE_PATH="/mingw64/include"
else
  echo "Default compiler: no found"
  yes | pacman -Syy;
  yes | pacman -Syu --noconfirm;
  yes | pacman -Q mingw-w64-x86_64-gcc;
  yes | pacman -Sy --needed base-devel --noconfirm;
  yes | pacman -Sy mingw-w64-x86_64-pkg-config --noconfirm;
fi

if [ -d "$INCLUDE_PATH" ]; then
  echo "Include path: $INCLUDE_PATH"
else
  echo "Include path: no found"
  exit 1
fi

if ! pacman -Qs sdl2 > /dev/null; then
  echo "SDL2 no found. Installing..."
  pacman -S --needed $SDL2_PKG --noconfirm;
fi

if ! pacman -Qs sdl2_image > /dev/null; then
  echo "SDL2_image no found. Installing..."
  pacman -S --needed $SDL2_IMAGE_PKG --noconfirm;
fi

if ! pacman -Qs sdl2_mixer > /dev/null; then
  echo "SDL2_mixer no found. Installing..."
  pacman -S --needed $SDL2_MIXER_PKG --noconfirm;
fi

if ! pacman -Qs sdl2_net > /dev/null; then
  echo "SDL2_net no found. Installing..."
  pacman -S --needed $SDL2_NET_PKG --noconfirm;
fi

if ! pacman -Qs sdl2_ttf > /dev/null; then
  echo "SDL2_ttf no found. Installing..."
  pacman -S --needed $SDL2_TTF_PKG --noconfirm;
fi

if ! pacman -Qs sdl2_gfx > /dev/null; then
  echo "SDL2_gfx no found. Installing..."
  pacman -S --needed $SDL2_GFX_PKG --noconfirm;
fi

echo "Checking SDL2..."

if ! pacman -Qs sdl2 > /dev/null; then
  echo "You need install manually SDL2 in your system"
  exit 1
else
  pacman -Qs sdl2;
  pkg-config --modversion sdl2
  pkg-config --modversion sdl2_ttf
  pkg-config --modversion sdl2_image
  pkg-config --modversion sdl2_mixer
  pkg-config --modversion sdl2_net
fi

echo "SDL2 install finished!"
