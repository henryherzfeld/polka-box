/// @description Insert description here
// You can write your code in this editor

font = font_comic
debug = false;
randomize();

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

spawn_room = -1;
black_alpha = 0;

spawn_x = 493;
spawn_y = 325;

do_transition = false;

objective = "";
objective_padding = 100;

//FLAGS
find_weeraway = false;
find_poppy = false;
examine_crops = false;
report_crops_to_poppy = false;
measure_soil_moisture = false;

draw_set_font(font);

// Creating direction enumerator for player transitions
enum dir {
	up = 0,
	right = 90,
	down = 180,
	left = 270
}