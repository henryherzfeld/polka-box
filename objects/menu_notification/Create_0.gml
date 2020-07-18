/// @description Insert description here
// You can write your code in this editor

event_inherited();

window_map = ds_map_create();

button_grid = ds_grid_create(1, 6);
scr_grid_add_button(500, 500, "Close", enum_button_type.radio, enum_button_event.exit_, []);


scr_add_window("noti_main", 200, 200, "notification text goes here right????????");

par_ptr.curr_window = "noti_main";