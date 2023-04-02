#ifndef SAPPHIRE_WINDOW_H
#define SAPPHIRE_WINDOW_H

#include "ruby.h"
#include "sdl.h"

void Init_window_klass(VALUE rb_module);

SDL_Window * get_window_object(VALUE self);

VALUE get_klass_window();

#endif //SAPPHIRE_WINDOW_H
