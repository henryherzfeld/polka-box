/// @description Insert description here

event_inherited();

par_ptr = par_menu;

window_map = ds_map_create();

button_grid = ds_grid_create(3, 6);
scr_grid_add_button(200, 200, "Resume", enum_button_type.click, enum_button_event.exit_, noone);
scr_grid_add_button(200, 300, "Settings", enum_button_type.click, enum_button_event.new_window, "settings");
scr_grid_add_button(200, 400, "Exit", enum_button_type.click, enum_button_event.run_script, scr_save_and_exit);
scr_add_window("pause_main", 200, 200, "Pause Menu");

button_grid = ds_grid_create(1, 6);
scr_grid_add_button(200, 200, "Back", enum_button_type.click, enum_button_event.new_window, "pause_main");
scr_add_window("settings", 200, 200, "Settings");

par_ptr.curr_window = "pause_main";