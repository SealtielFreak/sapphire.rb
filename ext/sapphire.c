#include "sapphire.h"

#include <stdio.h>

#include "SDL2/SDL.h"
#include "ruby.h"

/*
 * This function is for SDL2 testing.
 * Params:
 * +self+:: the object the function is called on
 */
VALUE rb_init_sdl2_test(VALUE self) {
    if (SDL_WasInit(SDL_INIT_EVERYTHING) != 0) {
        printf("SDL2 was init everything\n");
        return Qtrue;
    }

    if(SDL_Init(SDL_INIT_EVERYTHING) != 0) {
        printf("SDL2 was init everything failure!\n");
        return Qfalse;
    }

    printf("SDL2 was init everything success!\n");

    return Qtrue;
}

VALUE rb_hello(VALUE self) {
    return Qnil;
}

void Init_ext(void) {
    rb_define_global_function("init_sdl2_test", rb_init_sdl2_test, 0);
}

void hello(void) {
    printf("Hello, World!\n");
}
