#include <stdio.h>

#include "ext.h"
#include "exceptions.h"

#include "SFML/Graphics.h"


static VALUE rb_mExt;

int run_sfml_test();

void Init_ext(void) {
    rb_mExt = rb_define_module("Sapphire");

    printf("It's working the module in C for Ruby!\n");
}

int run_sfml_test() {
    sfVideoMode mode = {800, 600};
    sfRenderWindow *window = sfRenderWindow_create(mode, "Mi ventana", sfResize | sfClose, NULL);

    sfRectangleShape *rectangle = sfRectangleShape_create();
    sfVector2f size = {800.f, 600.f};
    sfRectangleShape_setSize(rectangle, size);
    sfRectangleShape_setFillColor(rectangle, sfWhite);

    while (sfRenderWindow_isOpen(window)) {
        sfEvent event;
        while (sfRenderWindow_pollEvent(window, &event)) {
            if (event.type == sfEvtClosed)
                sfRenderWindow_close(window);
        }

        sfRenderWindow_clear(window, sfBlack);
        sfRenderWindow_drawRectangleShape(window, rectangle, NULL);

        sfRenderWindow_display(window);
    }

    sfRectangleShape_destroy(rectangle);
    sfRenderWindow_destroy(window);

    return 0;
}