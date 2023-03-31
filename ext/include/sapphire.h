#ifndef SAPPHIRE_SAPPHIRE_H
#define SAPPHIRE_SAPPHIRE_H

#include "ruby.h"

#ifdef SAPPHIRE_C_DEVELOP
    #include "SDL.h"
    #include "SDL_image.h"
    #include "SDL_mixer.h"
    #include "SDL_ttf.h"
    #include "SDL2_gfxPrimitives.h"
#else
    #include "SDL2/SDL.h"
    #include "SDL2/SDL_image.h"
    #include "SDL2/SDL_mixer.h"
    #include "SDL2/SDL_ttf.h"
    #include "SDL2/SDL2_gfxPrimitives.h"
#endif

#define SDL_SOFTWARE_MODE       0
#define SDL_HARDWARE_MODE       1
#define SDL_GL_MODE             2

int run_sdl2_test(int mode);

#endif //SAPPHIRE_SAPPHIRE_H
