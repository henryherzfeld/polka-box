/// @description Insert description here

input_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
input_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
input_jump = keyboard_check(vk_space);
input_run = keyboard_check(vk_shift);

// buffering on_ground
if not place_meeting(x, y+1, par_collision) and on_ground and ground_buffer {
	on_ground = true;
	ground_buffer -= 1
} else {
	on_ground = place_meeting(x, y+1, par_collision);
	ground_buffer = ground_buffer_len;
}

// check for presence on ceiling, assign to var
on_ceiling = place_meeting(x, y-1, par_collision);

if input_run {
	if spd == base_spd {
		spd = run_spd;
	}
	spd = min((spd + (accel * (1/60))* (1 - ((1 - decel)*(1/60)))), max_spd)
}

// if movement is stopped, return to base speed
if not input_left and not input_right or not input_run {
	spd = base_spd;
}

y_move = y_move - grav;

var spd_mod = 0;
if is_slow  {
	spd_mod = spd-1;
}
x_move = (input_right - input_left) * round(spd-spd_mod);

// handle player jumps
if input_jump and not is_jumping and on_ground {
	is_jumping = true;
	alarm[0] = jump_length;
} else if is_jumping and not on_ceiling {
	jump_count += 1;
	
	var _mod = 10;
	var _margin = .20;
	if jump_count/jump_length > .5-_margin and jump_count/jump_length < .5+_margin {
		_mod = 2.5;
	}
	
	// apply jump y movement
	y_move = -_mod*cos((jump_count/jump_length) *pi);
} else if on_ceiling {
	is_jumping = false;
	jump_count = 0;
}

// assigning facing
if(x_move != 0){
	switch(sign(x_move)){
		case 1: facing = dir.right; break;
		case -1: facing = dir.left; break;
	}
} else {
	facing = dir.down;
}

// assigning sprite
if(x_move != 0){
	switch(facing){
		case 0: sprite_index = walk_back; break;
		case 90: sprite_index = walk_right; break;
		case 180: sprite_index = walk_front; break;
		case 270: sprite_index = walk_left; break;
	}
} else { // assign standing sprite if polka is not moving
	switch(facing){
		case 0: sprite_index = stand_back; break;
		case 90: sprite_index = stand_right; break;
		case 180: sprite_index = stand_front; break;
		case 270: sprite_index = stand_left; break;
	}
}

//Check for collision with collision object
if(x_move != 0){
	if(place_meeting(x+x_move, y-1, par_collision)) {
		repeat(abs(x_move)){
			if(!place_meeting(x+sign(x_move), y-1, par_collision)){
				x += sign(x_move);	
			} else { break; }
		}
		x_move = 0;
	}
}
if(y_move != 0){
	if(place_meeting(x, y+y_move, par_collision)) {
		repeat(abs(y_move)){
			if(!place_meeting(x, y+sign(y_move), par_collision)){
				y += sign(y_move);	
			} else { break; }
		}
		 y_move = 0;
	}
}

x += x_move;
y += y_move;


var bbox_width = bbox_right-bbox_left
var bbox_height = bbox_bottom-bbox_top

var bbox_xs = [x, x+bbox_width/2, y];
var i = 0;
repeat(3) {
	var bbox_x = bbox_xs[i];
	var inst = collision_line(bbox_x, y+bbox_height, bbox_x, y+bbox_height+32, par_slope, false, true);
	i++;
	
	if inst != noone {
		ds_list_add(inst_collision, inst);
	}
}

for(var j = 0; j < ds_list_size(inst_collision); j++) {
	var inst = inst_collision[| j];
}


if inst != noone and inst.object_index != obj_ground{
	var normal = 270;
	switch (object_get_parent(inst.object_index)){
		case par_angle_45:
			normal = 225;
			break;
	}
	
	var inst_bbox_width = inst.bbox_right+1-inst.bbox_left;
	var inst_bbox_height = inst.bbox_bottom+1-inst.bbox_top;
	
	var line1 = scr_lines_intersect(x+bbox_width/3, y+bbox_height, x+bbox_width/3, y+bbox_height+96,
									inst.x, inst.y+inst_bbox_height, inst.x+inst_bbox_width, inst.y, true)
									
	var line2 = scr_lines_intersect(x+bbox_width*(2/3), y+bbox_height, x+bbox_width*(2/3), y+bbox_height+96,
								    inst.x, inst.y+inst_bbox_height, inst.x+inst_bbox_width, inst.y, true)
									
	if line1 != line2 {
		on_slope = true;
	
		var hyp = sqrt((inst_bbox_width*inst_bbox_width)+(inst_bbox_height*inst_bbox_height))
		var angle = normal-270;
		var yy = sin(angle)*hyp;
		var xx = cos(angle)*hyp;
	
		var yyy = lengthdir_x(spd, angle);
		var xxx = lengthdir_y(spd, angle);
		
		if input_right or input_left {
			if input_right {
				x += xxx;
			} else {
				x -= xxx;
			}
			y -= yyy;
		}
		
		show_debug_message([xxx, yyy]);
	
		/*
		var line1 = scr_lines_intersect(x+bbox_width/3, y+bbox_height, x+bbox_width/3, y+bbox_height+96,
										inst.x, inst.y+inst_bbox_height, inst.x+inst_bbox_width, inst.y, true)
									
		var line2 = scr_lines_intersect(x+bbox_width*(2/3), y+bbox_height, x+bbox_width*(2/3), y+bbox_height+96,
									    inst.x, inst.y+inst_bbox_height, inst.x+inst_bbox_width, inst.y, true)
		*/
		
		var acc = scr_project_line(object_index, inst, 0, 1/3);

		show_debug_message(acc); 
	}
} else {
	on_slope = false;
}