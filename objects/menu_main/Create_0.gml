/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here

event_inherited();

par_ptr = par_menu;

window_map = ds_map_create();

if(file_exists("savedgame.sav")){
	button_grid = ds_grid_create(4, 6);
	scr_grid_add_button(200, 300, "Load Game", enum_button_type.click, enum_button_event.run_script_exit, scr_load_game_start);
} else {
	button_grid = ds_grid_create(3, 6);
}

scr_grid_add_button(200, 200, "New Game", enum_button_type.click, enum_button_event.run_script_exit, scr_new_game_start);
scr_grid_add_button(200, 400, "Settings", enum_button_type.click, enum_button_event.new_window, "settings");
scr_grid_add_button(200, 500, "Exit", enum_button_type.click, enum_button_event.run_script, scr_exit);
scr_add_window("main_main", 200, 200, "Pause Menu");

button_grid = ds_grid_create(1, 6);
scr_grid_add_button(200, 500, "Save Settings \nand Go Back", enum_button_type.click, enum_button_event.new_window, "main_main");
scr_add_window("settings", 200, 200, "Settings");

par_ptr.curr_window = "main_main";