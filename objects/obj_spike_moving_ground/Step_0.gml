/// @description Insert description here
// You can write your code in this editor

y_move = y_move - grav;

//Check for collision with collision object
if(x_move != 0){
	if(place_meeting(x+x_move, y-1, par_collision)) {
		repeat(abs(x_move)){
			if(!place_meeting(x+sign(x_move), y-1, par_collision)){
				x += sign(x_move);	
			} else { break; }
		}
		run_dir *= -1;
	}
}
if(y_move != 0){
	if(place_meeting(x, y+y_move, par_collision) or place_meeting(x, y+y_move, obj_ground_jump)) {
		repeat(abs(y_move)){
			if(!place_meeting(x, y+sign(y_move), par_collision) and !place_meeting(x, y+sign(y_move), obj_ground_jump)){
				y += sign(y_move);	
			} else { break; }
		}
			y_move = 0;
	}
}

if place_meeting(x, y, polka_pt) {
	scr_restart_room();
}

x += x_move*run_dir;
y += clamp(y_move, -y_move_max, y_move_max);