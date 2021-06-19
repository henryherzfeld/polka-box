///@description scr_create_ds_grid_from_array
///@arg0 array
function scr_create_ds_grid_from_array() {

	var array = argument[0];
	var n_quests = array_length_1d(array);
	var n_width = array_length_1d(array[0]);
	var ds_grid;

	ds_grid = ds_grid_create(n_width, n_quests);

	var yy = 0; repeat(n_quests){
		var quest_array = array[yy];

		var xx = 0; repeat(n_width) {
			ds_grid[# xx, yy] = quest_array[xx];
			xx++;
		}
		yy++;
	}

	return ds_grid;


}
