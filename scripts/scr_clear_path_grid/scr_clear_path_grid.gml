////@description scr_clear_path_grid
function scr_clear_path_grid(argument0) {
	//@arg0 grid
	var _grid = argument0;

	var i = 0;
	repeat(ds_grid_width(_grid)) {
		var grid_curr = _grid[# i, path.path];
		if path_exists(grid_curr) {
			path_delete(grid_curr);
		}
		i += 1;
	}

	return _grid;


}
