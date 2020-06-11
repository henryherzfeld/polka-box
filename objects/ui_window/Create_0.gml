/// @description Insert description here

destroy_window = false;

window_sprite = spr_stars_bg;

window_h = sprite_get_height(window_sprite);
window_w = sprite_get_width(window_sprite);

sprite_h = 0;
sprite_w = 0;

x1 = (game.gui_width - window_w)/2;
y1 = (game.gui_height - window_h)/2;

x2 = 50;
y2 = 50;

text = -1;

button_grid = -1;
build_buttons = false;

n_but = 0;
button_context = array_create(30);
menu_ptr = noone;

disable = false;
first = false;

is_quiz = false;

sprite_draw = noone;

enabled_radio = noone;
enable_change = false;


enum enum_button_event{
	new_window,
	run_script,
	run_script_exit,
	quiz_multi,
	quiz_checkbox,
	quiz_evidence,
	exit_
}

enum enum_button_type{
	click,
	checkbox,
	radio
}