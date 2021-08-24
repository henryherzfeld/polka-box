/// @description draws the player and drawn lines for platforming, performs masking to hide player sprite behind line

with game_pt {
	// drawing tooltip like line to preview drawn line
	if input_draw and drawing {
		
		var mx_diff = camera_get_view_x(cam) - camx_prev; 
		var my_diff = camera_get_view_y(cam) - camy_prev; 

		var mx_curr = mouse_x - mx_diff;
		var my_curr = mouse_y - my_diff;
	
		var pt_draw_x = mx_prev;
		var pt_draw_y = my_prev;
		
		var _dir = point_direction(mx_prev, my_prev, mx_curr, my_curr);
		var mx_mod = cos(_dir*pi/180)*coll_h;
		var my_mod = sin(_dir*pi/180)*coll_w;
		
		// calculating shortened line terminal coordinate based upon maximum length
		extra_len = max(0, point_distance(mx_prev, my_prev, mx_curr, my_curr) - max_line_len);
		var xx = cos(_dir*pi/180)*extra_len;
		var yy = sin(_dir*pi/180)*extra_len;
		mx_curr -= xx;
		my_curr += yy;
	
		var path_sprite;
		switch obj_line_drawer.line_draw_col { 
			case 0: path_sprite = spr_collision_half; break;
			case 1: path_sprite = spr_collision_half_green; break;
			case 2: path_sprite = spr_collision_half_blue; break;
		}

	/*
		draw_sprite_pos(path_sprite, 0, mx_prev, my_prev, mx_prev, my_prev+my_mod,
													mx_curr, my_curr, mx_curr, my_curr+my_mod,
													.4);
													*/
		var _dist = point_distance(pt_draw_x, pt_draw_y, mx_curr, my_curr);
												
		while _dist > coll_w {
			draw_sprite_ext(path_sprite, 0, pt_draw_x, pt_draw_y, 1, 1, _dir, c_white, .3);
			pt_draw_x += mx_mod;
			pt_draw_y -= my_mod;
		
			_dist = point_distance(pt_draw_x, pt_draw_y, mx_curr, my_curr);
		}
	}
}

/*

if not surface_exists(surface_mask) {
	surface_mask = surface_create(room_width, room_height);
}

surface_set_target(surface_mask);
draw_clear_alpha(c_white, 0);

// draw player
draw_sprite_ext(polka_pt.sprite_index, 0, polka_pt.x, polka_pt.y, 1, 1, polka_pt.roll_degree, c_white, 1);

// iterate thru grid
var i = 0;
repeat(game_pt.max_paths) {
	var _objects = game_pt.path_grid[# i, path.objects];
	var _time = game_pt.path_grid[# i, path.time];
	var _angle = game_pt.path_grid[# i, path.angle];
	var mask_line = game_pt.curr_path_idx == i;
	
	var j = 0;
	
	repeat(array_length_1d(_objects)) {
		var _object = _objects[j];
		if instance_exists(_object) {

			if mask_line {
				gpu_set_blendmode(bm_subtract);
			
				if _angle < 90 or _angle > 270 {
					var mod_x = sin(_angle*pi/180)*24;
					var mod_y = cos(_angle*pi/180)*24;
				} else {
					var mod_x = -sin(_angle*pi/180)*24;
					var mod_y = -cos(_angle*pi/180)*24;
				}
				
				draw_sprite_ext(spr_draw_line_subtract, 0, _object.x, _object.y, 1, 1, _angle, c_black, 1);
				draw_sprite_ext(spr_draw_line_subtract_tall, 0, _object.x+mod_x, _object.y+mod_y, 1, 1, _angle, c_black, 1);
			
				gpu_set_blendmode(bm_normal);
			}
			draw_sprite_ext(_object.sprite_index, 0, _object.x, _object.y, 1, 1, _angle, c_white, ((_time+80)/game_pt.path_timeout)*1.2);
			
		}
		j += 1;
	}
	i += 1;
}


surface_reset_target();
draw_surface(surface_mask, 0, 0);

if !global.debug { exit; }

// draw player x and y for debug
draw_circle_color(game_pt.player.x, game_pt.player.y, 5, c_black, c_black, false);
*/




// iterate thru grid, skip currently ridden line if it exists
var i = 0;
repeat(game_pt.max_paths) {

	if game_pt.curr_path_idx != i {
		
		var _objects = game_pt.path_grid[# i, path.objects];
		var _time = game_pt.path_grid[# i, path.time];
		var _angle = game_pt.path_grid[# i, path.angle];
		var _type = game_pt.path_grid[# i, path.type];
		
		if _angle < 90 or _angle > 270 {
			var mod_x = sin(_angle*pi/180)*24;
			var mod_y = cos(_angle*pi/180)*24;
		} else {
			var mod_x = -sin(_angle*pi/180)*24;
			var mod_y = -cos(_angle*pi/180)*24;
		}
		
		var path_sprite;
		switch _type { 
			case 0: path_sprite = spr_collision_half_green; break;
			case 1: path_sprite = spr_collision_half_blue; break;
			case 2: path_sprite = spr_collision_half_blue; break;
		}
		
		var j = 0;
		repeat(array_length_1d(_objects)) {
			var _object = _objects[j];
			if instance_exists(_object) {
				draw_sprite_ext(path_sprite, 0, _object.x, _object.y, 1, 1, _angle, c_white, (_time+20)/game_pt.path_timeout);
			}
			j += 1;
		}
	}
	i += 1;
}

if game_pt.curr_path_idx >= 0 { // if we're riding a line, draw pc on new surface to subtract from based upon current line
	if not surface_exists(surface_mask) { // create surface square which outsizes any line drawn
		//var max_surface_width = game_pt.coll_w * game_pt.max_path_objects;
		//surface_mask = surface_create(max_surface_width, max_surface_width);
		surface_mask = surface_create(room_width, room_height);
	}
	
	surface_set_target(surface_mask);
	draw_clear_alpha(c_white, 0);
	
	// draw player
	draw_sprite_ext(polka_pt.sprite_index, 0, polka_pt.x, polka_pt.y, 1, 1, polka_pt.roll_degree, c_white, 1);
	
	// draw ridden line
	var _objects = game_pt.path_grid[# game_pt.curr_path_idx, path.objects];
	var _time = game_pt.path_grid[# game_pt.curr_path_idx, path.time];
	var _angle = game_pt.path_grid[# game_pt.curr_path_idx, path.angle];
	var _type= game_pt.path_grid[# game_pt.curr_path_idx, path.type];
	
	// calculate modification of line location
	if _angle < 90 or _angle > 270 {
		var mod_x = sin(_angle*pi/180)*24;
		var mod_y = cos(_angle*pi/180)*24;
	} else {
		var mod_x = -sin(_angle*pi/180)*24;
		var mod_y = -cos(_angle*pi/180)*24;
	}
	
	var spr;
	switch _type {
		case path_type.normal: spr = spr_collision_half_green; break;
		case path_type.slide:
		case path_type.wall: spr = spr_collision_half_blue; break;
	}
	
	j = 0;
	repeat(array_length_1d(_objects)) {
		var _object = _objects[j];
		
		if instance_exists(_object) {
			gpu_set_blendmode(bm_subtract);
			draw_sprite_ext(spr_draw_line_subtract, 0, _object.x, _object.y, 1, 1, _angle, c_black, 1);
			draw_sprite_ext(spr_draw_line_subtract_tall, 0, _object.x+mod_x, _object.y+mod_y, 1, 1, _angle, c_black, 1);
			gpu_set_blendmode(bm_normal);
		
			gpu_set_blendenable(false);
			
			draw_sprite_ext(spr, 0, _object.x, _object.y, 1, 1, _angle, c_white, (_time+20)/game_pt.path_timeout);
			gpu_set_blendenable(true);
		}
		j += 1;
	}
	
	surface_reset_target();
	draw_surface(surface_mask, 0, 0);
	
} else { // if we're not riding a line just draw pc, forget the surface
	draw_sprite_ext(polka_pt.sprite_index, 0, polka_pt.x, polka_pt.y, 1, 1, polka_pt.roll_degree, c_white, 1);
}



if !global.debug { exit; }

// draw player x and y for debug
draw_circle_color(game_pt.player.x, game_pt.player.y, 5, c_black, c_black, false);

