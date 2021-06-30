/// @description Insert description here

// application surface only exists some time after create step of game object
application_surface_draw_enable(false);
window_target_x = 1500
window_target_y = 840
scale = 2;
fullscreen = false;
update = true;

disp_height = display_get_height();
disp_width = display_get_width();

window_count = 0;
window_width = window_get_width();
window_height = window_get_height();

ratio_vals = [2, 2.06, 1.89, 1.78, 1.6, 1.5];
ratio_names = ["18:9", "18.5:9", "17:9", "16:9", "16:10", "3:2"];
ratio_n = array_length_1d(ratio_vals);

resolution_n = 10000;
// each column is an entry for a resolution ratio

/*
resolutions_16_9_x =  [62*24, 71*24, 79*24];
resolutions_16_9_y =  [35*24, 40*24, 45*24];
resolutions_16_10_x = [24*32, 24*32, 24*32];
resolutions_16_10_y = [24*20, 24*20, 24*20];
resolutions_3_2_x =   [24*30, 24*45, 24*60, 24*75, 24*90, 24*105];
resolutions_3_2_y =   [24*20, 24*30, 24*40, 24*50, 24*60, 24*70];

resolutions_x = [resolutions_16_9_x, resolutions_16_10_x, resolutions_3_2_x];
resolutions_y = [resolutions_16_9_y, resolutions_16_10_y, resolutions_3_2_y];
*/

resolution_tiles_max_x = 127;
resolution_tiles_max_y = 60;
resolution_tiles_min_x = 10;
resolution_tiles_min_y = 8;

resolutions_18_9_x = array_create(resolution_n, 0);
resolutions_18_9_y = array_create(resolution_n, 0);

resolutions_18_5_9_x = array_create(resolution_n, 0);
resolutions_18_5_9_y = array_create(resolution_n, 0);

resolutions_17_9_x = array_create(resolution_n, 0);
resolutions_17_9_y = array_create(resolution_n, 0);

resolutions_16_9_x = array_create(resolution_n, 0);
resolutions_16_9_y = array_create(resolution_n, 0);

resolutions_16_10_x = array_create(resolution_n, 0);
resolutions_16_10_y = array_create(resolution_n, 0);

resolutions_16_10_x = array_create(resolution_n, 0);
resolutions_16_10_y = array_create(resolution_n, 0);

resolutions_3_2_x = array_create(resolution_n, 0);
resolutions_3_2_y = array_create(resolution_n, 0);

resolutions_x = [resolutions_18_9_x, resolutions_18_5_9_x, resolutions_17_9_x, resolutions_16_9_x, resolutions_16_10_x, resolutions_3_2_x];
resolutions_y = [resolutions_18_9_y, resolutions_18_5_9_y, resolutions_17_9_y, resolutions_16_9_y, resolutions_16_10_y, resolutions_3_2_y];

/*
// generate pixel perfect resolutions for each aspect ratio
var i = 0;
var j;
var curr_xs;
var curr_ys;
var curr_tile_x;
var curr_tile_y;
var _ratio;
repeat(ratio_n) { // loop through every aspect ratio
	curr_xs = resolutions_x[i];
	curr_ys = resolutions_y[i];

	j = 0;
	
	resolution_tiles_x = scr_get_array_in_range(resolution_tiles_min_x, resolution_tiles_max_x);
	resolution_tiles_y = scr_get_array_in_range(resolution_tiles_min_y, resolution_tiles_max_y);
	
	repeat(min(resolution_n, array_length_1d(resolution_tiles_x), array_length_1d(resolution_tiles_y))) { // loop through desired number of resolutions
		
		curr_tile_x = resolution_tiles_x[j]
		curr_tile_y = resolution_tiles_y[j]
		
		_ratio = curr_tile_x / curr_tile_y;
		
		// detect closest ratio from provided window target
		var k = 0;
		var _min = 100;
		var ratio_idx = -1;
		repeat(ratio_n) {
			var ratio_temp = abs(ratio_vals[k] - _ratio);
			if _min > ratio_temp {
				ratio_idx = k;
				_min = ratio_temp;
			}
			k += 1;
		}
		
		if ratio_idx != -1 and ratio_idx == i {
			curr_xs[j] = resolution_tiles_x[j] * 24;
			curr_ys[j] = resolution_tiles_y[j] * 24;
		}
		j += 1;
	}
	show_debug_message(curr_xs);
	show_debug_message(curr_ys);
	
	resolutions_x[i] = curr_xs;
	resolutions_y[i] = curr_ys;
	
	i += 1;
}
*/

var i = 0;
var j;
var k;
var open_idxs = array_create(ratio_n, 0);
var open_idx;
var curr_xs;
var curr_ys;
var curr_tile_x;
var curr_tile_y;
var _ratio;
resolution_tiles_x = scr_get_array_in_range(resolution_tiles_min_x, resolution_tiles_max_x);
resolution_tiles_y = scr_get_array_in_range(resolution_tiles_min_y, resolution_tiles_max_y);

repeat(array_length_1d(resolution_tiles_x)) { // loop through desired number of resolutions
	curr_tile_x = resolution_tiles_x[i]
	
	j = 0;
	repeat(array_length_1d(resolution_tiles_y)) {
		curr_tile_y = resolution_tiles_y[j]
		
		_ratio = curr_tile_x / curr_tile_y;
		
		// detect closest ratio from provided window target
		k = 0;
		var _min = 100;
		var ratio_idx = -1; // ratio_idx is usually one
		repeat(ratio_n) {
			var ratio_temp = abs(ratio_vals[k] - _ratio);
			if _min > ratio_temp {
				ratio_idx = k;
				_min = ratio_temp;
			}
			k += 1;
		}
		
		//show_debug_message(_ratio);
		//show_debug_message(ratio_names[ratio_idx]);
	
		k = 0;
		if ratio_idx != -1 {
			repeat(ratio_n) {
				if ratio_idx == k {
					curr_xs = resolutions_x[k];
					curr_ys = resolutions_y[k];
				
					open_idx = open_idxs[k];
					curr_xs[open_idx] = curr_tile_x * 24;
					curr_ys[open_idx] = curr_tile_y * 24;
					open_idxs[k] += 1;
					
					resolutions_x[k] = curr_xs;
					resolutions_y[k] = curr_ys;
					
					//show_debug_message(resolutions_x[k]);
					//show_debug_message(resolutions_y[k]);
				}

				k += 1;
			}
		}
		
		j += 1;
	}
	
	i += 1;
}

var idx = 1;
var curr_arr = resolutions_x[idx];
var acc = 0;
var i = 0;
repeat(array_length_1d(curr_arr)) {
	if curr_arr[i] != 0 {
		acc += 1;
	}
	i += 1;
}

// get length of longest resolution array
var _resolution_n = 0;
var i = 0
var array_len;
repeat(array_length_1d(resolutions_x)) {
	array_len = array_length_1d(resolutions_x[i]);
	if array_len > _resolution_n {
		_resolution_n = array_len;
	}
	i += 1;
}

resolution_grid = ds_grid_create(ratio_n, _resolution_n);

// pack resolutions into resolution grid
var i = 0;
var curr_resolutions_x;
var curr_resolutions_y;
repeat(ratio_n) { 
	curr_resolutions_x = resolutions_x[i];
	curr_resolutions_y = resolutions_y[i];
	
	var j = 0;
	repeat(_resolution_n) {
		resolution_grid[# i, j] = [curr_resolutions_x[j], curr_resolutions_y[j]];
		j += 1;
	}
	i += 1;
}