/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here

event_inherited();

draw_windows = false;

window_map = ds_map_create();

if(file_exists("savedgame.sav")){
	button_grid = ds_grid_create(4, 6);
	scr_grid_add_button(0, 100, "Load Game", enum_button_type.click, enum_button_event.run_script_exit, scr_load_game_start);
} else {
	button_grid = ds_grid_create(3, 6);
}

scr_grid_add_button(0, 0, "New Game", enum_button_type.click, enum_button_event.run_script_exit, scr_new_game_start);
scr_grid_add_button(0, 200, "Settings", enum_button_type.click, enum_button_event.new_window, "settings");
scr_grid_add_button(0, 300, "Exit", enum_button_type.click, enum_button_event.run_script, scr_exit);
scr_add_window("main_main", 200, 200, "Main Menu");

button_grid = ds_grid_create(1, 6);
scr_grid_add_button(200, 500, "Save Settings \nand Go Back", enum_button_type.click, enum_button_event.new_window, "main_main");
scr_add_window("settings", 200, 200, "Settings");

curr_window = "main_main";

/// @description Insert description here

system_ptr = part_system_create();
part_system_position(system_ptr, -200, -200)
emitter_fg = part_emitter_create(system_ptr);
emitter_bg = part_emitter_create(system_ptr);

part_fg = part_type_create();
part_type_shape(part_fg, pt_shape_star);
part_type_size(part_fg, .1, .2, .001, 0);
part_type_speed(part_fg, 4, 8, 0, 0);
part_type_direction(part_fg, 270, 360, 0, 0);
part_type_orientation(part_fg, 0, 360, 0, 0, true)
part_type_life(part_fg, 20*room_speed, 30*room_speed);

part_bg = part_type_create();
part_type_shape(part_bg, pt_shape_star);
part_type_size(part_bg, .05, .1, .001, 0);
part_type_speed(part_bg, 2, 4, 0, 0);
part_type_colour1(part_bg, c_gray);
part_type_direction(part_bg, 270, 360, 0, 0);
part_type_orientation(part_bg, 0, 360, 0, 0, true)
part_type_life(part_bg, 20*room_speed, 30*room_speed);

