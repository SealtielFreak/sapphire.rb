#!/usr/bin/sh

curl -O https://repo.msys2.org/msys/x86_64/msys2-keyring-r21.b39fb11-1-any.pkg.tar.xz;
curl -O https://repo.msys2.org/msys/x86_64/msys2-keyring-r21.b39fb11-1-any.pkg.tar.xz.sig;

pacman-key --verify msys2-keyring-r21.b39fb11-1-any.pkg.tar.xz.sig;
pacman -U msys2-keyring-r21.b39fb11-1-any.pkg.tar.xz;

pacman -U --config <(echo) msys2-keyring-r21.b39fb11-1-any.pkg.tar.xz;

pacman -Syy;

if [ "$(uname -m)" = "x86_64" ]; then
    pacman -Sy mingw-w64-x86_64-SDL2_ttf mingw-w64-x86_64-SDL2_gfx mingw-w64-x86_64-SDL2_mixer mingw-w64-x86_64-SDL2_image --noconfirm;
else
    pacman -Sy mingw-w64-i686-SDL2_ttf mingw-w64-i686-SDL2_gfx mingw-w64-i686-SDL2_mixer mingw-w64-i686-SDL2_image --noconfirm;
fi
