/// @description Insert description here

event_inherited();

game.pause_change = true;

window_map = ds_map_create();

button_grid = ds_grid_create(3, 6);
scr_grid_add_button(0, 0, "Resume", enum_button_type.click, enum_button_event.exit_, noone);
scr_grid_add_button(0, 100, "Settings", enum_button_type.click, enum_button_event.new_window, "settings");
scr_grid_add_button(0, 200, "Exit", enum_button_type.click, enum_button_event.run_script, scr_save_and_exit_to_main);
scr_add_window("pause_main", 200, 200, "Pause Menu");

button_grid = ds_grid_create(3, 6);
scr_grid_add_button(0, 0, "Debug Mode", enum_button_type.checkbox, enum_button_event.run_script, [scr_change_variable, game.id, "debug"]);
scr_grid_add_button([300, 400], [300, 500], ["debug on", "debug off"], enum_button_type.radio, enum_button_event.run_script, [[scr_change_variable, game.id, "debug", true], [scr_change_variable, game.id, "debug", false]]);
scr_grid_add_button(0, 300, "Save Settings \nand Go Back", enum_button_type.click, enum_button_event.new_window, "pause_main");
scr_add_window("settings", 200, 200, "Settings");

curr_window = "pause_main";

