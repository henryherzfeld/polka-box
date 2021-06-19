///@description scr_grid_add_button
///@arg0 x
///@arg1 y
///@arg2 text
///@arg3 type
///@arg4 event
///@arg5 attribute
function scr_grid_add_button(argument0, argument1, argument2, argument3, argument4, argument5) {

	var index = -1;
	for(var i = 0; i < ds_grid_width(button_grid); i++){
		if(index == -1 and ds_grid_get(button_grid, i, 2) == 0){
			index = i;
		}
	}

	button_grid[# index, 0] = argument0;
	button_grid[# index, 1] = argument1;
	button_grid[# index, 2] = argument2;
	button_grid[# index, 3] = argument3;
	button_grid[# index, 4] = argument4;
	button_grid[# index, 5] = argument5;


}
