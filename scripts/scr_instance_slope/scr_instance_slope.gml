////@description scr_instance_slope
function scr_instance_slope(argument0) {
	//@arg0 instance_id

	var inst = argument0;

	var dx;
	var dy;

	with inst {
		dx = bbox_right - bbox_left;
		dy = bbox_top - bbox_bottom;
	}

	return point_direction(0, 0, dx, dy);



}
