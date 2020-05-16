/// @description Insert description here

mx = device_mouse_x_to_gui(0);
my = device_mouse_y_to_gui(0);

if (curr_window != noone) {
	
	if child_window_ptr != noone {
		child_window_ptr.destroy_window = true;
	}
	
	var inst = instance_create_layer(0, 0, "Menus", ui_window);
	
	var temp = window_map[? curr_window];
	
	inst.x1 = temp[| 0];
	inst.y1 = temp[| 1];
	inst.text = temp[| 2];
	inst.button_grid = temp[| 3];
	inst.menu_ptr = id;
	curr_window = noone;
	child_window_ptr = inst.id;
}


if(destroy_menu){
	// Destroying button grids
	for(var i = 0; i < ds_map_size(window_map); i++){
		var temp = window_map[? keys_list[| i]];
		var grid = temp[| 3];
		ds_grid_destroy(grid);
	}
	// Destroying window map and keys list
	ds_map_destroy(window_map);
	ds_list_destroy(keys_list);
	instance_destroy();
}