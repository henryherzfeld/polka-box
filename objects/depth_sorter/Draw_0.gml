/// @description Insert description here

var ds_grid = ds_depthgrid;
var n_inst = instance_number(par_depthsorted);

ds_grid_resize(ds_grid, 2, n_inst);

var i = 0; with(par_depthsorted) {
	ds_grid[# 0, i] = id;
	ds_grid[# 1, i] = y;
	i++;
}

// sort by depth
ds_grid_sort(ds_grid, 1, true);

var inst;
var k = 0; repeat(n_inst) {
	//get instance from grid
	inst = ds_grid[# 0, k];
	
	with inst {
		event_perform(ev_draw, 0);
	}
	k++;
}