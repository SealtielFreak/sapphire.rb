#include "ext.h"
#include "exceptions.h"
#include "klass/window.h"

#include <stdio.h>


#define SCREEN_WIDTH_SDL2   640
#define SCREEN_HEIGHT_SDL2  480

static VALUE rb_mExt;

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

    if (SDL_Init(SDL_INIT_EVERYTHING) != 0) {
        printf("SDL2 was init everything failure!\n");
        return Qfalse;
    }

    printf("SDL2 was init everything success!\n");

    SDL_Quit();

    return Qtrue;
}

/*
 * This function is for run SDL2 testing in different modes.
 * Params:
 * +self+:: the object the function is called on
 */
VALUE rb_run_sdl2_test(VALUE self, VALUE rb_mode) {
    Check_Type(rb_mode, T_FIXNUM);

    return INT2NUM(run_sdl2_test(NUM2INT(rb_mode)));
}

void Init_ext(void) {
    rb_define_global_function("init_sdl2_test", (VALUE (*)(void)) rb_init_sdl2_test, 0);
    rb_define_global_function("run_sdl2_test", (VALUE (*)(void)) rb_run_sdl2_test, 1);

    rb_mExt = rb_define_module("Sapphire");

    Init_window_klass(rb_mExt);

}

int run_sdl2_surface() {
    int status = 1;
    SDL_Window *window = NULL;
    SDL_Surface *surface = NULL;

    SDL_Init(SDL_INIT_EVERYTHING);

    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        fprintf(stderr, "could not initialize sdl2: %s\n", SDL_GetError());
        return 1;
    }

    window = SDL_CreateWindow(
            "SDL2 in Software",
            SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED,
            SCREEN_WIDTH_SDL2, SCREEN_HEIGHT_SDL2,
            SDL_WINDOW_SHOWN
    );

    if (window == NULL) {
        fprintf(stderr, "could not create window: %s\n", SDL_GetError());
        return 1;
    }

    surface = SDL_GetWindowSurface(window);

    while (status) {
        SDL_Event event;

        while (SDL_PollEvent(&event) != 0) {
            if (event.type == SDL_QUIT) {
                status = 0;
            }
        }

        SDL_FillRect(surface, NULL, SDL_MapRGB(surface->format, 0xFF, 0xFF, 0xFF));

        SDL_UpdateWindowSurface(window);
    }

    SDL_DestroyWindow(window);

    SDL_Quit();
    return 0;
}


int run_sdl2_renderer() {
    int status = 1;
    SDL_Window *window = NULL;
    SDL_Renderer *renderer = NULL;

    SDL_Init(SDL_INIT_EVERYTHING);

    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        fprintf(stderr, "could not initialize sdl2: %s\n", SDL_GetError());
        return 1;
    }

    window = SDL_CreateWindow(
            "SDL2 in Hardware",
            SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED,
            SCREEN_WIDTH_SDL2, SCREEN_HEIGHT_SDL2,
            SDL_WINDOW_SHOWN
    );

    if (window == NULL) {
        fprintf(stderr, "could not create window: %s\n", SDL_GetError());
        return 1;
    }

    renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);

    while (status) {
        SDL_Event event;

        while (SDL_PollEvent(&event) != 0) {
            if (event.type == SDL_QUIT) {
                status = 0;
            }
        }

        int w, h;
        SDL_GetWindowSize(window, &w, &h);

        SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
        SDL_RenderClear(renderer);

        SDL_RenderPresent(renderer);
    }

    SDL_DestroyWindow(window);

    SDL_Quit();
    return 0;
}


int run_sdl2_gl() {
    return -1;
}

int run_sdl2_test(int mode) {
    switch (mode) {
        case SDL_SOFTWARE_MODE:
            return run_sdl2_surface();
        case SDL_HARDWARE_MODE:
            return run_sdl2_renderer();
        case SDL_GL_MODE:
            return run_sdl2_gl();
    }

    return -1;
}
