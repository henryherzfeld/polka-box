/// @description Insert description here
// You can write your code in this editor

font = font_comic
debug = false;
randomize();

mode = "pb";
hacks = true;
music = false;

name = "Default"

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

display_set_gui_size(1500, 840);

base_width = 1500;
base_height = 840;
width = base_width;
height = base_height;

play_audio = false;

spawn_room = -1;
black_alpha = 0;

spawn_x = 255;
spawn_y = 76;

do_transition = false;
start_room = rm_polka_interior;
do_load = false;
initial = true;

pause = false;
pause_change = false;
screenshot = noone;

canvas_change = false;

buffer = 10;

// WEATHER FOR NOW
rain = false;

draw_set_font(font);

// Creating direction enumerator for player transitions
enum dir {
	up = 0,
	right = 90,
	down = 180,
	left = 270
}

//portraits
enum enum_portrait {
	angry = 0,
	happy = 1,
	neutral = 2,
	sad = 3,
	length = 4
}

//alarm[0] = room_speed;

draw_help = false;
spr_help_w = sprite_get_width(spr_help);
spr_help_h = sprite_get_height(spr_help);

draw_map = false;
spr_map_w = sprite_get_width(spr_map);
spr_map_h = sprite_get_height(spr_map);

outline = 5;

game_over_bg = noone;
game_over_text = "Game Over";
game_over_text_w = string_width(game_over_text);
game_over_text_h = string_width(game_over_text);