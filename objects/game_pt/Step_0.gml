/// @description Insert description here

input_draw_start = device_mouse_check_button_pressed(0, mb_left);
input_draw = device_mouse_check_button(0, mb_left);
input_draw_end = device_mouse_check_button_released(0, mb_left);

// toggle debug
if(keyboard_check_pressed(vk_backspace) and keyboard_check(vk_lcontrol)){
	if (global.debug){
		global.debug = false;
	} else{
		global.debug = true;	
	}
}

// loop through entire grid, test for existence of paths
// also perform some tasks while looping: time decrement, path deletion on timeout
var i = 0;
var n_temp = 0;
var to_destroy_idx = -1;
repeat(ds_grid_width(path_grid)) {
	var p = path_grid[# i, path.path];
	if path_exists(p) {
		
		// test bool flag for "stop player" debug
		if not debug_path_timeout {
			path_grid[# i, path.time] -= 1; // time decrement for all paths
		}

		if not drawing and path_grid[# i, path.time] < 0 { // path deletion on timeout

			// if the player is on this path (i), turn on a flag which will dismount the player
			to_destroy_idx = i;
			
		}
		n_temp += 1;
	}
	i += 1;
}

n_paths = n_temp;
path_idx = n_paths;

// handle start and end of draw action
if input_draw_start {
	mx_prev = mouse_x;
	my_prev = mouse_y;
	
	drawing = true;

} else if input_draw_end and drawing {
	var _dist_raw = point_distance(mx_prev, my_prev, mouse_x, mouse_y);
	var _dist = min(_dist_raw, max_line_len);
	var _angle = point_direction(mx_prev, my_prev, mouse_x, mouse_y);
		
	// move collision line terminal from mouse position to regularized position according to maximum line length
	var mx_coll = mouse_x + cos((_angle-180)*pi/180)*(_dist_raw-_dist);
	var my_coll = mouse_y - sin((_angle-180)*pi/180)*(_dist_raw-_dist);
	
	// also move location of collision line terminal towards line start slightly to allow drawing slightly into coll
	// but only if the line is a "horizontal" one
	var mw = 7.5
	if (_angle > 270-mw and _angle < 270+mw) or
		(_angle > 90-mw and _angle < 90+mw) {
		mx_coll -= cos(_angle*pi/180)*coll_w*4;
		my_coll += sin(_angle*pi/180)*coll_w*4;
	}
	
	if _angle < 90 or _angle > 270 {
		var mod_x = -sin(_angle*pi/180)*player.bbox_w - (player.bbox_w/2);
		var mod_y = -cos(_angle*pi/180)*player.bbox_h;
	} else {
		var mod_x = sin(_angle*pi/180)*player.bbox_w;
		var mod_y = cos(_angle*pi/180)*player.bbox_h;
	}
	
	// test for collision on position of line end and
	// test for collision on line between start and line end
	if not collision_line(mx_prev, my_prev, mx_coll, my_coll, par_collision, false, false) and
	   not collision_line(mx_prev, my_prev, mx_coll, my_coll, coll_obj, false, false) and 
	   not collision_line(mx_prev+mod_x, my_prev+mod_y, mx_coll+mod_x, my_coll+mod_y, par_collision, false, false) and
       not collision_line(mx_prev+mod_x+player.bbox_w, my_prev+mod_y, mx_coll+mod_x+player.bbox_w, my_coll+mod_y, par_collision, false, false) {
		
		path_grid[# path_idx, path.path] = path_add();
		
		// add x and y components of player bounding box and collision object to path start coord before building line
		//var mx_curr = mx_prev + cos(_dir*pi/180)*(player.bbox_h+(coll_diag*.5));
		//var my_curr = my_prev - sin(_dir*pi/180)*(player.bbox_h+(coll_diag*.5));
		var mx_curr = mx_prev;
		var my_curr = my_prev;
		
		// calculate line type
		var mw = 7.5;
		var ms = 32.5;
		var type;
		if (_angle > 270-mw and _angle < 270+mw) or
			(_angle > 90-mw and _angle < 90+mw) {
			type = path_type.wall;
		} else if (_angle > 270-ms and _angle < 270+ms) or
			      (_angle > 90-ms and _angle < 90+ms) {
			type = path_type.slide;
			obj_line_drawer.line_draw_col = line_draw.slide;
		} else { //normal
			type = path_type.normal;
			obj_line_drawer.line_draw_col = line_draw.normal;
		}
		
		var arr = array_create(max_path_objects, noone);
		var i = 0;
		repeat((_dist div coll_w)+1) {
			
			if _angle < 90 or _angle > 270 {
				var mod_x = -sin(_angle*pi/180)*player.bbox_w - (player.bbox_w/2);
				var mod_y = -cos(_angle*pi/180)*player.bbox_h;
			} else {
				var mod_x = sin(_angle*pi/180)*player.bbox_w;
				var mod_y = cos(_angle*pi/180)*player.bbox_h;
			}
			
			path_add_point(path_grid[# path_idx, path.path], mx_curr+mod_x, my_curr+mod_y, spd);

			var inst = instance_create_layer(mx_curr, my_curr, "Meta", coll_obj);
			arr[i] = inst;
			inst.image_angle = _angle;
			mx_curr += cos(_angle*pi/180)*coll_w;
			my_curr -= sin(_angle*pi/180)*coll_w;
			i += 1;
		}
		
		// associate line objects with path in grid
		path_grid[# path_idx, path.objects] = arr;
		
		// path meta configuration
		path_set_kind(path_grid[# path_idx, path.path], 1);
		path_set_precision(path_grid[# path_idx, path.path], 8);
		path_set_closed(path_grid[# path_idx, path.path], false);
	
		// assign metadata to path grid entry
		path_grid[# path_idx, path.angle] = _angle;
		path_grid[# path_idx, path.time] = path_timeout;
		
		// change slide behavior dependent on player direction
		if type = path_type.slide {
			if (_angle < 90 and _angle > 0) or (_angle > 90 and _angle < 180) { // player moving right, slide moving right 
				path_reverse(path_grid[# path_idx, path.path]);
			}
		}
		
		path_grid[# path_idx, path.type] = type;
		
		mx_prev = 0;
		my_prev = 0;
		drawing = false;
		//path_idx += 1;
	}
} else if drawing { //if a line isnt being started or ended calculate its type to determine coloring behavior
	var _dist_raw = point_distance(mx_prev, my_prev, mouse_x, mouse_y);
	var _dist = min(_dist_raw, max_line_len);
	var _angle = point_direction(mx_prev, my_prev, mouse_x, mouse_y);

	// move collision line terminal from mouse position to regularized position according to maximum line length
	var mx_coll = mouse_x + cos((_angle-180)*pi/180)*(_dist_raw-_dist);
	var my_coll = mouse_y - sin((_angle-180)*pi/180)*(_dist_raw-_dist);
	
	// also move location of collision line terminal towards line start slightly to allow drawing slightly into coll
	// but only if the line is a "horizontal" one
	var mw = 7.5
	if (_angle > 270-mw and _angle < 270+mw) or
		(_angle > 90-mw and _angle < 90+mw) {
		mx_coll -= cos(_angle*pi/180)*coll_w*4;
		my_coll += sin(_angle*pi/180)*coll_w*4;
	}
	
	if _angle < 90 or _angle > 270 {
		var mod_x = -sin(_angle*pi/180)*player.bbox_w - (player.bbox_w/2);
		var mod_y = -cos(_angle*pi/180)*player.bbox_h;
	} else {
		var mod_x = sin(_angle*pi/180)*player.bbox_w;
		var mod_y = cos(_angle*pi/180)*player.bbox_h;
	}

	// calculate line type
	var mw = 7.5;
	var ms = 32.5;
	var draw_type;
	
	if collision_line(mx_prev, my_prev, mx_coll, my_coll, par_collision, false, false) or
	   collision_line(mx_prev, my_prev, mx_coll, my_coll, coll_obj, false, false) or 
	   collision_line(mx_prev+mod_x, my_prev+mod_y, mx_coll+mod_x, my_coll+mod_y, par_collision, false, false) or
       collision_line(mx_prev+mod_x+player.bbox_w, my_prev+mod_y, mx_coll+mod_x+player.bbox_w, my_coll+mod_y, par_collision, false, false) {
		   
		draw_type = line_draw.invalid;
	} else if (_angle > 270-mw and _angle < 270+mw) or
		(_angle > 90-mw and _angle < 90+mw) {
		draw_type = line_draw.slide // wall
	} else if (_angle > 270-ms and _angle < 270+ms) or
			    (_angle > 90-ms and _angle < 90+ms) {
		draw_type = line_draw.slide;
	} else {
		draw_type = line_draw.normal;
	}
	obj_line_drawer.line_draw_col = draw_type;
}

// get current path's closest path_point's x and y coords
if not (closest_calc_counter mod 10) {
	var max_ = 10000;
	var temp;
	var i = 0;
	repeat(n_paths) {
		var _pt = scr_get_closest_path_point(path_grid[# i, path.path], player.x, player.y);
		px = path_get_point_x(path_grid[# i, path.path], _pt);
		py = path_get_point_y(path_grid[# i, path.path], _pt);
		
		temp = point_distance(player.x, player.y, px, py);
		if temp < max_ {
			closest = i;
			max_ = temp;
		}
		i += 1;
	}
}
closest_calc_counter += 1;

var _pt = scr_get_closest_path_point(path_grid[# closest, path.path], player.x, player.y);
px = path_get_point_x(path_grid[# closest, path.path], _pt);
py = path_get_point_y(path_grid[# closest, path.path], _pt);

//test and turn on flag if player is going to collide with collision parent while on path
var player_collision_on_path = false;
if curr_path_idx != -1 {
	
	_angle = path_grid[# closest, path.angle];
	with player {
		
		mod_x = cos(_angle*pi/180)*bbox_w;
		mod_y = -sin(_angle*pi/180)*bbox_h;
		
		if collision_rectangle(x+mod_x, y+mod_y, x+bbox_w+mod_x, y+bbox_h+mod_y, par_collision, false, false) or 
		   collision_rectangle(x, y, x+bbox_w, y+bbox_h, par_collision, false, false) {
			player_collision_on_path = true;
		}
	}
}
//var player_collision_on_path = false;
// test position on path and remove player from path if player is far enough on path
// or if a path is flagged to be destroyed and the player is on that path
// or if there is a projected collision from player while on path
if player.path_position >= 1-path_position_margin
   or (to_destroy_idx != -1 and to_destroy_idx == curr_path_idx)
   or player_collision_on_path {
	with player {
		path_end();
		
		// player jumps off path upon exit but not on path type "slide"
		if other.path_grid[# other.curr_path_idx, path.type] != path_type.slide {
			input_jump = true;
		}
		path_position = 0;
	}

	// kick off path end countdown for buffering player from starting new path
	path_ended_count = path_ended_timeout;
	curr_path_idx = -1;

} else if curr_path_idx != -1 {
	player.y_move = 0;
}

// destroy path flagged for destruction
if to_destroy_idx != -1 {
	path_delete(path_grid[# to_destroy_idx, path.path]);
	var curr_objects = path_grid[# to_destroy_idx, path.objects];
	var j = 0;
	repeat(max_path_objects) {
		var curr_object = curr_objects[j];
		if curr_object != noone {
			instance_destroy(curr_objects[j]);
		}
		j += 1;
	}
			
	// reorganize path_grid to reflect removed path
	path_grid = scr_clear_path_grid_column(path_grid, to_destroy_idx);
	//path_idx -= 1;
	if curr_path_idx > to_destroy_idx {
		curr_path_idx -= 1;
	}
}

if path_ended_count > 0 {
	path_ended_count -= 1;
}

/*
// using rectangle in rectangle to detect player contact with path
var my = 2;
var mx = 12;
var path_coll = rectangle_in_rectangle(player.x, player.y, player.x+player.bbox_w, player.y+player.bbox_h,
										px-mx, py+my, px+mx, py+(2*my)
										);
	
var gy = 25;
var grab_coll = rectangle_in_rectangle(player.x, player.y, player.x+player.bbox_w, player.y+player.bbox_h,
										px-mx, py+my+gy, px+mx, py+(2*my)+gy
										);
										*/

var start_path = false;

// TEST FOR MOVING PLAYER TO PATH
// if we've successfully passed time buffer for ending a path and currently not on a path
if path_ended_count == 0 and curr_path_idx == -1 {
	
	var _type = path_grid[# closest, path.type];
	var _angle = path_grid[# closest, path.angle];
	
	// change grab behavior dependant on wall type, maybe incorporate something more general based off angle?
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

	with player {
		var path_coll = rectangle_in_circle(x, y, x+bbox_w, y+bbox_h, other.px, other.py, coll_rad);

		var grab_coll = rectangle_in_circle(x, y, x+bbox_w, y+bbox_h, other.px+mod_x, other.py+grab_y_diff, coll_rad);
	}
	
	// if there is a path or grab collision, not a wall, and grab isnt timing out, begin player placement resolution	
	if (grab_coll or path_coll) and _type != path_type.wall and path_coll_count <= 0 {
		
		// kill player jump
		player.jump_count = 0;
		player.input_jump = false;
		player.is_jumping = false;
		
		// kick off grab collision timeout
		path_coll_count = path_coll_count_max;
		
		// set grab target to closest point on closest path
		grab_resolution_x = px;
		grab_resolution_y = py;
		
		// use center of player object for moving to target point on path (bbox_w/2, bbox_h/2)
		grab_resolution_dir = point_direction(player.x, player.y, px, py);
		//grab_resolution_dir = point_direction(player.x+player.bbox_w/2, player.y+player.bbox_h/2, px, py);
	}

	if path_coll_count > 0 {
		path_coll_count -= 1;
		
		// kill jump
		player.is_jumping = false;
		player.jump_count = 0;
		player.y_move = 0;
		
		if curr_path_idx == -1 {
		
			if point_distance(player.x, player.y, px, py) >= grab_resolution_spd {
				
				grab_resolution_dir = point_direction(player.x, player.y, px, py);
				
				var ldirx = lengthdir_x(grab_resolution_spd, grab_resolution_dir);
				var ldiry = lengthdir_y(grab_resolution_spd, grab_resolution_dir);
				
				with player {
					x += ldirx;
					y += ldiry;
				}
			} else {
				// end grab collision resolution
				player.x = px;
				player.y = py;
				path_coll_count = -1;

				start_path = true;
			}
		}
	}
	
	// resolve wall logic in presence of 
	if (path_coll or grab_coll) and _type == path_type.wall {
		player.run_dir *= -1;
	}
}

if start_path { 
	
		// assign speed and change player direction based upon path angle
		var _spd;
		
		switch _type {
			case path_type.normal: 
				_spd = spd;
				break;
			case path_type.slide:
				_spd = spd*2.5;
				break;
		}
		
		var _angle = path_grid[# closest, path.angle];

		// if starting a path, change player run direction dependent on path angle
		// but first check if we're using an upwards slide, in which case do not change run direction
		var can_dir_change = true;
		if _type = path_type.slide {
			if (_angle < 90 and _angle > 0) or (_angle > 90 and _angle < 180) {
				can_dir_change = false;
			}
		}
			
		if can_dir_change {
			if _angle > 270 or _angle < 90 { //facing right
				player.run_dir = 1;
			} else {
				player.run_dir = -1;
			}
		}
	
	with player {
		path_start(other.path_grid[# other.closest, path.path], _spd, path_action_continue, true);
	}
	
	curr_path_idx = closest;
	// calculate normalized position value for use as path_position
	var target_path_position = _pt/path_get_number(path_grid[# closest, path.path]);
	player.x = path_get_x(path_grid[# closest, path.path], target_path_position);
	player.y = path_get_y(path_grid[# closest, path.path], target_path_position);
	player.path_position = _pt/path_get_number(path_grid[# closest, path.path]);
}

