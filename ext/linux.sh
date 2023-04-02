#!/bin/sh

if ! command -v sdl2-config &> /dev/null; then
  if [ -f /etc/fedora-release ]; then
    sudo dnf install -y SDL2-devel SDL2_mixer-devel SDL2_net-devel SDL2_image-devel SDL2_ttf-devel SDL2_gfx-devel

  elif [ -f /etc/debian_version ]; then
    sudo apt-get install -y libsdl2-dev libsdl2-mixer-dev libsdl2-net-dev libsdl2-image-dev libsdl2-ttf-dev libsdl2-gfx-dev

  elif [ -f /etc/SuSE-release ]; then
    sudo zypper install -y SDL2-devel SDL2_mixer-devel SDL2_net-devel SDL2_image-devel SDL2_ttf-devel SDL2_gfx-devel

  elif [ -f /etc/arch-release ]; then
    sudo pacman -S --noconfirm sdl2 sdl2_mixer sdl2_net sdl2_image sdl2_ttf sdl2_gfx

  elif [ -f /etc/gentoo-release ]; then
    sudo emerge -av media-libs/libsdl2 media-libs/SDL2_mixer media-libs/SDL2_net media-libs/SDL2_image media-libs/SDL2_ttf media-libs/SDL2_gfx

  else
    echo "You need manually install SDL2!"
    exit 1
  fi
else
  echo "SDL2 is install in your system!"
fi