#include "exceptions.h"
#include "klass/window.h"

static VALUE rb_cWindow;

static VALUE New_rbWindow(int argc, VALUE *argv, VALUE klass) {
    VALUE self, rb_title;
    SDL_Window *c_window;

    if (argc > 1) {
        raise_invalid_arguments_excepted(2, argc);
    }

    rb_title = argv[0];
    Check_Type(rb_title, T_STRING);

    c_window = SDL_CreateWindow(RSTRING_PTR(rb_title), SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 640, 480, SDL_WINDOW_SHOWN);
    self = Data_Wrap_Struct(klass, 0, SDL_DestroyWindow, c_window);

    rb_obj_call_init(self, argc, argv);

    return self;
}

static VALUE Initialize_rbWindow(int argc, VALUE *argv, VALUE self) {
    return self;
}

void Init_window_klass(VALUE rb_module) {
    rb_cWindow = rb_define_class_under(rb_module, "Window", rb_cObject);

    rb_define_singleton_method(rb_cWindow, "new", New_rbWindow, -1);

    rb_define_method(rb_cWindow, "initialize", Initialize_rbWindow, -1);
}

SDL_Window * get_window_object(VALUE self) {
    SDL_Window *ptr;
    Data_Get_Struct(self, SDL_Window, ptr);
    return ptr;
}

VALUE get_klass_window() {
    return rb_cWindow;
}