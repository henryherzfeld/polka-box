/// @description Insert description here

// flashing behavior for pause background

if not (counter mod 10) {
	var temp = bg_grad1;
	bg_grad1 = bg_grad2;
	bg_grad2 = temp;
}

if pause { exit; }

var curr_dist = point_distance(x, y, x_dest, y_dest);
var total_dist = point_distance(start_x, start_y, x_dest, y_dest);

if curr_dist >= spd {
	var dir = point_direction(x, y, x_dest, y_dest);
	var ldirx = lengthdir_x(spd, dir);
	var ldiry = lengthdir_y(spd, dir);
	
	x += ldirx - 5;
	y += ldiry + 10;
	
} else {
	instance_destroy();
	scr_new_evi_noti();
}

if curr_dist > total_dist*.5 {
	spd *= 1.1;
	scale -= .01*scale;
	
} else {
	spd -= .01*spd;
	scale *= 1.025;
}

counter++;