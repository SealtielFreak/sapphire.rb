#include "exceptions.h"
#include "klass/event.h"

static VALUE rb_cEvent;

static VALUE New_rbEvent(int argc, VALUE *argv, VALUE klass) {
    VALUE self, rb_title;
    SDL_Event *c_event;

    if (argc > 1) {
        raise_invalid_arguments_excepted(2, argc);
    }

    rb_title = argv[0];
    Check_Type(rb_title, T_STRING);

    c_event = malloc(sizeof(SDL_Event));
    self = Data_Wrap_Struct(klass, 0, free, c_event);

    rb_obj_call_init(self, argc, argv);

    return self;
}

void Init_event_klass(VALUE rb_module) {
    rb_cEvent = rb_define_class_under(rb_module, "Event", rb_cObject);

    rb_define_singleton_method(rb_cEvent, "new", (VALUE (*)(void)) New_rbEvent, -1);
}

SDL_Event * get_event_object(VALUE self) {
    SDL_Event *event;
    Data_Get_Struct(self, SDL_Event, event);
    return event;
}