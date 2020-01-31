/// @description Insert description here
// You can write your code in this editor
event_inherited();

if(idle_movement){
	if(!moving) {
		
		alarm[0] = 20 * random_range(0, idle_move_wait_max);
		
		//set target destination
		x_move = random_range(-1*idle_move, idle_move);
		y_move = random_range(-1*idle_move, idle_move);

		//movement
		x += x_move;
		y += y_move;
	
	} else {

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
}