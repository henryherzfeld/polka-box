/// @description Insert description here

var my = 2;
var mx = 12;
var gy = 25;

// drawing tooltip like line to preview drawn line
if input_draw and drawing {

	var mx_curr = mouse_x;
	var my_curr = mouse_y;
		
	var _dir = point_direction(mx_prev, my_prev, mx_curr, my_curr);
	var mx_mod = cos(_dir*pi/180)*coll_w;
	var my_mod = sin(_dir*pi/180)*coll_w;
		
	// calculating shortened line terminal coordinate based upon maximum length
	extra_len = max(0, point_distance(mx_prev, my_prev, mx_curr, my_curr) - max_line_len);
	var xx = cos(_dir*pi/180)*extra_len;
	var yy = sin(_dir*pi/180)*extra_len;
	mx_curr -= xx;
	my_curr += yy;
	
	show_debug_message(obj_line_drawer.line_draw_col);
	
	var path_sprite;
	switch obj_line_drawer.line_draw_col { 
		case 0: path_sprite = coll_obj.sprite_index; break;
		case 1: path_sprite = spr_collision_half_green; break;
		case 2: path_sprite = spr_collision_half_blue; break;
	}

	draw_sprite_pos(path_sprite, 0, mx_prev, my_prev, mx_prev, my_prev+my_mod,
												mx_curr, my_curr, mx_curr, my_curr+my_mod,
												1);
}

if(!global.debug) {exit;}

// draw outlines for grab and standard path collision areas 
//draw_rectangle_color(px-mx, py+my+gy, px+mx, py+(2*my)+gy, c_red, c_red, c_red, c_red, true);
//draw_rectangle_color(px-mx, py+my, px+mx, py+(2*my), c_blue, c_blue, c_blue, c_blue, true);


// draw points on each path, if the path is closest, color closest point on that path red
var i = 0;
var closest = -1;
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
				closest = i;
			}
			draw_circle_color(xx, yy, 5, col, col, false);
			j += 1;
		}
	}
	i += 1;
}



if closest != -1 {
	
	var i = 0;
	repeat(n_paths) { 
	
		// change grab behavior dependant on wall type, maybe incorporate something more general based off angle?
		var _type = path_grid[# i, path.type];
		var _angle = path_grid[# i, path.angle];

		var grab_y_diff;
		var coll_rad;
		switch _type {
			case path_type.wall: {
				grab_y_diff = 0;	
				break;
			}
			case path_type.normal: {
				grab_y_diff = 40;
				break;
			}
			case path_type.slide: {
				grab_y_diff = 25;
				break;
			}
		}

		coll_rad = 10;

		var mod_x;
		var mod_y;
		if _angle < 90 or _angle > 270 {
			mod_x = sin(_angle*pi/180)*player.bbox_w;
			mod_y = cos(_angle*pi/180)*player.bbox_h;
		} else {
			mod_x = -sin(_angle*pi/180)*player.bbox_w;
			mod_y = -cos(_angle*pi/180)*player.bbox_h;
		}
		
		var _pt = scr_get_closest_path_point(path_grid[# i, path.path], player.x, player.y);
		var _px = path_get_point_x(path_grid[# i, path.path], _pt);
		var _py = path_get_point_y(path_grid[# i, path.path], _pt);
	
		draw_circle_color(_px, _py, coll_rad, c_blue, c_blue, true);
		draw_circle_color(_px+mod_x, _py+grab_y_diff, coll_rad, c_red, c_red, true);
		draw_text_color(_px+25, _py+5, string(round(_angle))+": "+string(round(mod_x))+", "+string(grab_y_diff), c_black, c_black, c_black, c_black, 1);
		
		
		i += 1;
	}
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

with(obj_wallclimb){
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom,c_blue, c_blue, c_blue, c_blue, true);	
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