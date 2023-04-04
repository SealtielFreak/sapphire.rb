#ifndef SAPPHIRE_EVENT_H
#define SAPPHIRE_EVENT_H

#include "ruby.h"
#include "sdl.h"

void Init_event_klass(VALUE rb_module);

SDL_Window * get_event_object(VALUE self);

VALUE get_klass_event();

#endif //SAPPHIRE_EVENT_H
