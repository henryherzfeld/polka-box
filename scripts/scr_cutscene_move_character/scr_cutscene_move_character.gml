///@description move polka
///@arg obj
///@arg x
///@arg y
///@arg relative?
///@arg speed
function scr_cutscene_move_character(argument0, argument1, argument2, argument3, argument4) {
	var obj = argument0;
	var relative = argument3;
	var spd = argument4;


	//Acquiring coordinates for movement
	//Testing if this is the first time
	if(x_dest = -1){
		if(relative){
			x_dest = obj.x + argument1;
			y_dest = obj.y + argument2;
		} else {
			x_dest = argument1;
			y_dest = argument2;
		}
	}

	//Pulling coords from cutscene object
	var xx = x_dest;
	var yy = y_dest;

	with(obj){
	
		// testing if this object is an npc
		var is_npc = false;
		if object_get_parent(obj) == par_NPC or obj == polka is_npc = true;

		if(point_distance(x, y, xx, yy) > spd){
			var dir_ = point_direction(x, y, xx, yy);
			var ldirx = lengthdir_x(spd, dir_);
			var ldiry = lengthdir_y(spd, dir_);
		
			// apply movement
			x += ldirx;
			y += ldiry;
			if is_npc {
				if(abs(ldirx) > abs(ldiry)){
					switch(sign(ldirx)){
						case 1: other.facing = dir.right; break;
						case -1: other.facing = dir.left; break;
					}
				} else {
					switch(sign(ldiry)){
						case 1: other.facing = dir.down; break;
						case -1: other.facing = dir.up; break;
					}
				}

				switch(other.facing){ 
				
					case 0: sprite_index = walk_back; break;
					case 90: sprite_index = walk_right; break;
					case 180: sprite_index = walk_front; break;
					case 270: sprite_index = walk_left; break;
				}
			}
		
		} else {
			if is_npc {
				switch(other.facing){
					case 0: sprite_index = stand_back; break;
					case 90: sprite_index = stand_right; break;
					case 180: sprite_index = stand_front; break;
					case 270: sprite_index = stand_left; break;
				}
			}
			x = xx;
			y = yy;
		
			with(other){
				x_dest = -1;
				y_dest = -1;
				facing = dir.down;
				scr_cutscene_end_action();
			}
		}
	}


}
