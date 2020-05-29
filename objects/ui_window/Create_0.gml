/// @description Insert description here

destroy_window = false;

window_sprite = spr_test_menu;

window_h = sprite_get_height(window_sprite);
window_w = sprite_get_width(window_sprite);

x1 = (game.gui_width - window_w)/2;
y1 = (game.gui_height - window_h)/2;

x2 = 50;
y2 = 50;

text = -1;

button_grid = -1;
menu_ptr = noone;

disable = false;

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