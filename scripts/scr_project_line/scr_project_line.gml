////@description scr_project_line
///@arg0 caller
///@arg1 inst
///@arg2 axis
///@arg3 ratio of bbox
function scr_project_line(argument0, argument1, argument2, argument3) {

	var caller = argument0
	var inst = argument1;
	var axis = argument2;
	var ratio = argument3;
	var n_lines = 1/ratio;

	var cbb_w = caller.bbox_right-caller.bbox_left;
	var cbb_h = caller.bbox_bottom-caller.bbox_top;
	var bb_w = inst.bbox_right-inst.bbox_left;
	var bb_h = inst.bbox_bottom-inst.bbox_top;

	var cx = caller.x;
	var cy = caller.y;
	var xx = inst.x;
	var yy = inst.y;

	var acc = array_create(n_lines);
	var n = 0;
	var multi;
	repeat(n_lines) {
		multi = n*ratio;
		acc[n] = scr_lines_intersect(cx+cbb_w*multi, cy+cbb_h, cx+cbb_w/3, cy+cbb_h+96,
										xx, yy+bb_h, xx+bb_w, yy, true);
		n++;
	}

	return acc;


}
