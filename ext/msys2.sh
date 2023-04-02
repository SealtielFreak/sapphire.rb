#!/bin/bash

if pacman -Q mingw-w64-x86_64-gcc >/dev/null 2>&1; then
  if ! pacman -Q mingw-w64-x86_64-toolchain >/dev/null 2>&1; then
    pacman -Sy --needed base-devel mingw-w64-x86_64-toolchain --noconfirm
  fi
  COMPILER=mingw
elif pacman -Q mingw-w64-x86_64-clang >/dev/null 2>&1; then
  if ! pacman -Q mingw-w64-x86_64-clang-analyzer >/dev/null 2>&1; then
    pacman -Sy --needed base-devel mingw-w64-x86_64-clang mingw-w64-x86_64-clang-analyzer mingw-w64-x86_64-lld --noconfirm
  fi
  COMPILER=clang
else
  echo "Compiler no found! Installing..."
  pacman -Sy mingw-w64-x86_64-gcc base-devel --noconfirm
  COMPILER=mingw
fi

if pacman -Q mingw-w64-x86_64-csfml >/dev/null 2>&1; then
  echo "CSFML is install!"
else
  echo "CSFML no found! Installing..."
  if [ "$COMPILER" == "mingw" ]; then
    pacman -Sy mingw-w64-x86_64-csfml --noconfirm
  elif [ "$COMPILER" == "clang" ]; then
    pacman -Sy mingw-w64-x86_64-clang-csfml --noconfirm
  fi
fi

if ! pacman -Q mingw-w64-x86_64-csfml >/dev/null 2>&1; then
  echo "CSFML install failure!"
fi