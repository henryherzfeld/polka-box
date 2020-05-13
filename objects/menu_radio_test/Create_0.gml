/// @description Insert description here

event_inherited();

par_ptr = par_menu;

window_map = ds_map_create();

button_grid = ds_grid_create(3, 6);
scr_grid_add_button([200, 200, 200, 200], [200, 300, 400, 500], ["1", "2__", "3", "4"], enum_button_type.radio, enum_button_event.run_script, [scr_save_and_exit_to_main, scr_save_and_exit_to_main, scr_save_and_exit_to_main, scr_save_and_exit_to_main]);
scr_grid_add_button([500, 500], [200, 300], ["1", "2"], enum_button_type.radio, enum_button_event.run_script, [scr_save_and_exit_to_main, scr_save_and_exit_to_main]);
scr_grid_add_button(500, 600, "Submit", enum_button_type.click, enum_button_event.new_window, "pause_main");
//scr_grid_add_button(200, 400, "3", enum_button_type.radio, enum_button_event.run_script, scr_save_and_exit_to_main);

//use a map for a radio context and add using a script to window?

scr_add_window("pause_main", 200, 200, "radio test");

par_ptr.curr_window = "pause_main";

