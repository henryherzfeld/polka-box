/// @description Insert description here
// You can write your code in this editor
send_event("A", "B", "C");
font = font_comic
debug = false;
randomize();

name = "Default"

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
base_width = 1500;
base_height = 840;
width = base_width;
height = base_height;

spawn_room = -1;
black_alpha = 0;

spawn_x = 255;
spawn_y = 76;

do_transition = false;

draw_set_font(font);

villies = ds_list_create();
x_coords = ds_list_create();
y_coords = ds_list_create();

// Creating direction enumerator for player transitions
enum dir {
	up = 0,
	right = 90,
	down = 180,
	left = 270
}