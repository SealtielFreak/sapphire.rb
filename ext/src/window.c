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

/*
 * Windows initializer.
 * Params:
 * +title+:: set title of Window
 */
static VALUE Initialize_rbWindow(int argc, VALUE *argv, VALUE self) {
    return self;
}

/*
 * Get events from Window.
 * Params:
 * +self+:: the object the function is called on
 */
static VALUE PollEvent_rbWindow(VALUE self) {
    SDL_Window *window = get_window_object(self);
    const size_t windowID = SDL_GetWindowID(window);

    SDL_Event event;

    if(SDL_PollEvent(&event) != 0) {
        const size_t currentEventID = event.window.windowID;

        if(windowID == currentEventID) {
            printf("Event type: %u, current id: %zu\n", event.type, currentEventID);

            if(event.type == SDL_QUIT) {
                return Qtrue;
            }
        }
    }

    return Qnil;
}

/*
 * Update window.
 * Params:
 * +self+:: the object the function is called on
 */
static VALUE Update_rbWindow(VALUE self) {
    SDL_Window *window = get_window_object(self);
    SDL_Renderer *renderer = SDL_GetRenderer(window);

    SDL_RenderPresent(renderer);

    return Qnil;
}

/*
 * Update window.
 * Params:
 * +self+:: the object the function is called on
 */
static VALUE Close_rbWindow(VALUE self) {

    return Qnil;
}

void Init_window_klass(VALUE rb_module) {
    rb_cWindow = rb_define_class_under(rb_module, "Window", rb_cObject);

    rb_define_singleton_method(rb_cWindow, "new", (VALUE (*)(void)) New_rbWindow, -1);

    rb_define_method(rb_cWindow, "initialize", (VALUE (*)(void)) Initialize_rbWindow, -1);
    rb_define_method(rb_cWindow, "poll_event", (VALUE (*)(void)) PollEvent_rbWindow, 0);
    rb_define_method(rb_cWindow, "update!", (VALUE (*)(void)) Update_rbWindow, 0);

}

SDL_Window * get_window_object(VALUE self) {
    SDL_Window *window;
    Data_Get_Struct(self, SDL_Window, window);
    return window;
}

VALUE get_klass_window() {
    return rb_cWindow;
}