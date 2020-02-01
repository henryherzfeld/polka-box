/// @description Insert description here
// You can write your code in this editor

font = font_comic
debug = false;
randomize();

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

spawn_room = -1;
black_alpha = 0;

spawn_x = 255;
spawn_y = 76;

do_transition = false;

draw_set_font(font);

// Creating direction enumerator for player transitions
enum dir {
	up = 0,
	right = 90,
	down = 180,
	left = 270
}