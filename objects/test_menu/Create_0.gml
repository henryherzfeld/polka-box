/// @description Insert description here

event_inherited();

par_ptr = par_menu;

window_map = ds_map_create();

button_grid = ds_grid_create(2, 5);
scr_grid_add_button(200, 200, "", enum_button_type.click, enum_button_event.exit_, noone);
scr_grid_add_button(500, 200, "", enum_button_type.click, enum_button_event.new_window, "test1");
scr_add_window("test", 200, 200, "first");

button_grid = ds_grid_create(2, 5);
scr_grid_add_button(200, 200, "", enum_button_type.click, enum_button_event.new_window, "test");
scr_grid_add_button(500, 200, "", enum_button_type.click, enum_button_event.new_window, "test2");
scr_add_window("test1", 200, 200, "second");

button_grid = ds_grid_create(1, 5);
scr_grid_add_button(200, 200, "", enum_button_type.click, enum_button_event.new_window, "test1");
scr_add_window("test2", 200, 200, "third");

par_ptr.curr_window = "test";