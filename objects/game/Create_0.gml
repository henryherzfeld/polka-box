/// @description Insert description here
// You can write your code in this editor

font = font_comic
debug = false;
randomize();

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

spawn_room = -1;
black_alpha = 0;

spawn_x = 170;
spawn_y = 300;

do_transition = false;

objective = "None";
objective_padding = 100;

//FLAGS
find_weeravay = false;

draw_set_font(font);