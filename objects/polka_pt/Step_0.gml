/// @description Insert description here

input_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
input_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
//input_jump = keyboard_check(vk_space);
input_run = keyboard_check(vk_shift);
//input_roll = keyboard_check(vk_control);
input_roll = false;

/*
// buffering on_ground
if not place_meeting(x, y+1, par_collision) and on_ground and ground_buffer {
	on_ground = true;
	ground_buffer -= 1
} else {
	on_ground = place_meeting(x, y+1, par_collision);
	ground_buffer = ground_buffer_len;
}
*/

//
if not place_meeting(x, y+1, par_collision) and on_ground {
	input_jump = true;
}

on_ground = place_meeting(x, y+1, par_collision);

// check for presence on ceiling, assign to var
on_ceiling = place_meeting(x, y-1, par_collision);
on_wall = place_meeting(x+1, y, par_collision);

// test for climb action
var cm = bbox_h;
if on_wall {
	var inst = instance_place(x+1, y, par_collision);
	if inst != noone and (y <= inst.y+cm and inst.y >= inst.y-cm){
		x = inst.x
		y = inst.y-bbox_h;
		
		is_jumping = false;
		jump_count = 0;
		y_move = 0;
	} else {
		// swap player run direction if we've encountered a wall without a possible grab action
		run_dir = run_dir*-1;
	}
}

if input_run {
	if spd == base_spd {
		spd = run_spd;
	}
	spd = min((spd + (accel * (1/60))* (1 - ((1 - decel)*(1/60)))), max_spd);
}

spd = min((spd + (accel * (1/60))* (1 - ((1 - decel)*(1/60)))), max_spd);

// if movement is stopped, return to base speed
if not input_left and not input_right or not input_run {
	spd = base_spd;
}

y_move = y_move - grav;

var spd_mod = 0;
if is_slow  {
	spd_mod = spd-1;
}

// runner style fuckery
//x_move = (input_right - input_left) * round(spd-spd_mod);
x_move = 3.5*run_dir;


// performing roll
if input_roll and on_ground {
	do_roll = true;
	if input_left {
		do_roll_left = true;
	}
}

if do_roll {
	if do_roll_left {
		roll_degree -= roll_speed;
		x_move -= min((roll_speed + (accel * (1/60))* (1 - ((1 - decel)*(1/60)))), max_roll_spd);
	} else {
		roll_degree += roll_speed;
		x_move += min((roll_speed + (accel * (1/60))* (1 - ((1 - decel)*(1/60)))), max_roll_spd);
	}
	
	// check if we're over 360 degrees, stop rolling if so
	if roll_degree >= 360 or roll_degree <= -360 {
		do_roll = false;
		do_roll_left = false;
		roll_degree = 0;
	}
}

// handle player jumps
//if input_jump and not is_jumping and on_ground {
if input_jump and not is_jumping {
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
	y_move = -_mod*cos((jump_count/jump_length)*pi);
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

if collision {
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
}

if move_override {exit;}

x += x_move;
y += y_move;


//handle slopes
if input_right or input_left {
	var i = 1;
	repeat(max_slope_y-1) {
		var spdd;
		if input_roll {
			var spdd = roll_speed;
		} else {
			var spdd = spd;
		}
		
		if place_meeting(x+1, y, par_collision) and not place_meeting(x+1, y-i, par_collision) and (input_right or input_roll) {
			x += spdd div 2;
			y -= i;
			on_slope = true;
			break;
		}

		if place_meeting(x-1, y, par_collision) and not place_meeting(x-1, y-i, par_collision) and (input_left or input_roll) {
			x -= spdd div 2;
			y -= i;
			on_slope = true;
			break;
		}
		i++;
		on_slope = false;
	}
}

input_jump = false;