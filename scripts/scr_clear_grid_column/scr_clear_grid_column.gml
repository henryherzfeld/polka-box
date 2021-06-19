///@description scr_remove_grid_column
function scr_clear_grid_column(argument0, argument1) {
	//@arg0 grid1
	//@arg1 idx

	var _grid = argument0;
	var _idx = argument1;

	var w = ds_grid_width(_grid);
	var h = ds_grid_width(_grid);

	if _idx == w-1 {
		var i = 0;
		repeat(h) {
			_grid[# w-1, i] = 0;
			i += 1;
		}
		return _grid;
	} else {
		var _grid_ret = ds_grid_create(w, h);
		if _idx == 0 {
			ds_grid_set_grid_region(_grid_ret, _grid, 1, 0, w, h, 0, 0);
		} else {
			ds_grid_set_grid_region(_grid_ret, _grid, 0, 0, _idx-1, h, 0, 0);
			ds_grid_add_grid_region(_grid_ret, _grid, _idx+1, 0, w-1, h, _idx, 0);
		}
	}

	ds_grid_destroy(_grid);
	return _grid_ret;


}
