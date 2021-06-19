////@description scr_get_closest_path_point
///@param0 path_idx
///@param1 x
///@param2 y
function scr_get_closest_path_point() {

	var path_idx = argument[0];
	var xx = argument[1];
	var yy = argument[2];

	var min_dist = 1000;
	var min_idx = 0;
	var n = path_get_number(path_idx);
	var i = 0;
	repeat(n) {
		var px = path_get_point_x(path_idx, i);
		var py = path_get_point_y(path_idx, i);
	
		var _dist = point_distance(xx, yy, px, py);

		if _dist < min_dist {
			min_dist = _dist;
			min_idx = i;
		}
		i += 1;
	}

	return min_idx;


}
