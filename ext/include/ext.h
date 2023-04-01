#ifndef SAPPHIRE_EXT_H
#define SAPPHIRE_EXT_H

#include "ruby.h"
#include "sdl.h"

#define SDL_SOFTWARE_MODE       0
#define SDL_HARDWARE_MODE       1
#define SDL_GL_MODE             2

void Init_ext(void);

int run_sdl2_test(int mode);

#endif //SAPPHIRE_EXT_H
