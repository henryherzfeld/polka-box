/// @description Insert description here

var my = 2;
var mx = 24;
var gy = 25;

// drawing tooltip like line to preview drawn line
if input_draw and drawing {

	var mx_curr = mouse_x;
	var my_curr = mouse_y;
		
	var _dir = point_direction(mx_prev, my_prev, mx_curr, my_curr);
	var mx_mod = cos(_dir*pi/180)*coll_w;
	var my_mod = sin(_dir*pi/180)*coll_w;
		
	// calculating shorted line terminal coordinate based upon maximum length
	extra_len = max(0, point_distance(mx_prev, my_prev, mx_curr, my_curr) - max_line_len);
	var xx = cos(_dir*pi/180)*extra_len;
	var yy = sin(_dir*pi/180)*extra_len;
	mx_curr -= xx;
	my_curr += yy;

	draw_sprite_pos(coll_obj.sprite_index, 0, mx_prev, my_prev, mx_prev, my_prev+my_mod,
												mx_curr, my_curr, mx_curr, my_curr+my_mod,
												1);
}

if(!global.debug) {exit;}

draw_rectangle_color(px-mx, py+my+gy, px+mx, py+(2*my)+gy, c_red, c_red, c_red, c_red, true);
draw_rectangle_color(px-mx, py+my, px+mx, py+(2*my), c_blue, c_blue, c_blue, c_blue, true);

var i = 0;
repeat(ds_grid_width(path_grid)) {
	var curr_path = path_grid[# i, path.path];
	
	if path_exists(curr_path) {
		var j = 0;
		repeat(path_get_number(curr_path) ) {
			var xx = path_get_point_x(curr_path, j);
			var yy = path_get_point_y(curr_path, j);
			
			var col = c_black;
			if xx == px and yy == py {
				col = c_red;
			}
			draw_circle_color(xx, yy, 5, col, col, false);
			j += 1;
		}
	}
	i += 1;
}

with(par_collision){
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_red, c_red, c_red, c_red, true);	
}

with(obj_transition){
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, c_blue, c_blue, c_blue, true);	
}

with(obj_trigger){
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_purple, c_purple, c_purple, c_purple, true);
}

with(obj_ground){
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_green, c_green, c_green, c_green, true);	
}

with(polka){
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true);	
}

with(polka_pt){
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true);	
}

draw_set_alpha(0.3);

var xx = 0;
var yy = 0;
var cs = 24;

var xr = room_width div cs;
repeat(xr) {
	draw_line_color(xx, 0, xx, room_height, c_white, c_white);	
	xx += cs;
}

var yr = room_height div cs;
repeat(yr){
	draw_line_color(0, yy, room_width, yy, c_white, c_white)
	yy += cs;
}

draw_set_alpha(1);