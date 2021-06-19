/// @description Insert description here

var inst = collision_circle(x, y, detection_radius, polka, false, false);
if inst != noone and not engaged {
	if engage_count < 0 {
		engage_count = engage_time;
	} else if engage_count == 0 {
		engaged = true;
		idle_movement = false;
		x_move = 0;
		y_move = 0;
		engage_count = -1;
	} else {
		if point_distance(x, y, polka.x, polka.y) <= detection_radius/2 {
			engaged = true;
			idle_movement = false;
			x_move = 0;
			y_move = 0;
			engage_count = -1;
		} else {
			engage_count -= 1;
		}
		
	}
}

if(idle_movement){

	//Manage x_move and y_move
	if(xx = x and yy = y){
		
		// Wait for specified amount before assigning movement
		if (counter mod idle_sleep_max = 0){
			counter = 1;
			idle_sleep_max = irandom_range(1, idle_sleep_max - idle_sleep_min) + idle_sleep_min;

			//check for collision
			while(xx = x and yy = y){
				var cs = obj_tile_manager.cell_size;
				
				// Random quad directio move from current position divided by cell size
				xx = (x + (irandom_range(0, 1) * 2 - 1) * irandom_range(0, cs*idle_range)) div cs;
				yy = (y + (irandom_range(0, 1) * 2 - 1) * irandom_range(0, cs*idle_range)) div cs;
				
				//New random coordinates clamped to positive values
				xx = (xx*cs) * sign(xx);
				yy = (yy*cs) * sign(yy);
				
				if(collision_line(x, y, xx, yy, obj_collision, false, true)){
					xx = x;
					yy = y;
					exit;
				}	
			}
		}
		++counter;
		
	} else if(point_distance(x, y, xx, yy) > spd){
		var dir = point_direction(x, y, xx, yy);
		x_move = lengthdir_x(spd, dir);
		y_move = lengthdir_y(spd, dir);
		
		x += x_move;
		y += y_move;
		
	//Check if we're close to our target and set position to target
	} else {
		x = xx;
		y = yy;
		x_move = 0;
		y_move = 0;
	}

} else if engaged {
	var _angle = point_direction(x, y, polka.x, polka.y);
	x_move = lengthdir_x(spd*3, _angle);
	y_move = lengthdir_y(spd*3, _angle);
	
	if point_distance(x, y, polka.x, polka.y) >= spd*3 and not knock_count {

	} else {
		
	}
	
	if fire_count <= -1 {
		fire_count = fire_time;
	} if not fire_count {
		instance_create_layer(x, y, "Menus", obj_bullet);
	}
	fire_count -= 1;
	
}

var inst = collision_rectangle(polka.x, polka.y, polka.x+polka.sprite_width, polka.y+polka.sprite_height, par_enemy, false, false);
if inst != noone and inst.id == id and not polka.invincible and not polka.dash{
		polka.invincible = true;
		polka.alarm[1] = room_speed*3;
		flags.hearts -= 1;
		scr_audio_play_sound(snd_question_wrong, 1, false);
	
		// get knockback values
		knock_angle = point_direction(x, y, polka.x, polka.y);
		knock_count = knock_time;
}


if knock_count >= 0 {
	knock_count -= 1;
	x_move -= lengthdir_x(5*spd-(knock_count*knock_count*.001), knock_angle);
	y_move -= lengthdir_y(5*spd-(knock_count*knock_count*.001), knock_angle);
	
	polka.x += lengthdir_x(3*spd-(knock_count*knock_count*.001), knock_angle)
	polka.y += lengthdir_y(3*spd-(knock_count*knock_count*.001), knock_angle);
}

//Assign facing variable with movement's direction, default to xmovement
if(x_move != 0){
	switch(sign(x_move)){
		case 1: facing = dir.right; break;
		case -1: facing = dir.left; break;
	}
} else if (y_move != 0) {
	switch(sign(y_move)){
		case 1: facing = dir.down; break;
		case -1: facing = dir.up; break;
	}
}

//Assign walking sprite according to direction facing
if(x_move != 0 or y_move != 0){
	switch(facing){ 
		case 0: sprite_index = spr_villy_walk_back; break;
		case 90: sprite_index = spr_villy_walk_right; break;
		case 180: sprite_index = spr_villy_walk_front; break;
		case 270: sprite_index = spr_villy_walk_left; break;
	}
} else { // assign standing  sprite if polka is not moving
	switch(facing){
		case 0: sprite_index = spr_villy_stand_back; break;
		case 90: sprite_index = spr_villy_stand_right; break;
		case 180: sprite_index = spr_villy_stand_front; break;
		case 270: sprite_index = spr_villy_stand_left; break;
	}
}

x += x_move;
y += y_move;