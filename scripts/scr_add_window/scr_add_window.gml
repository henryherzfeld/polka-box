///@description scr_add_window
///@arg0 key
///@arg1 x
///@arg2 y
///@arg3 prompt
function scr_add_window(argument0, argument1, argument2, argument3) {

	var key = argument0;

	with(par_menu){
		keys_list[| key_idx] = key;
		key_idx += 1;
	}

	window = ds_list_create();

	window[| 0] = argument1; //x
	window[| 1] = argument2; //y
	window[| 2] = argument3; // text
	window[| 3] = button_grid;

	window_map[? key] = window;
	ds_map_add_list(window_map, key, window)


}
