/// @description Insert description here

event_inherited();

if watering {
	if anim_w_count >= water_time and not polka.in_dialogue {
		anim_w_count = 0;
	
		// sampling new coords
		var _rand_coord = irandom_range(0, n_coords-1);
		while _rand_coord == rand_coord {
			var _rand_coord = irandom_range(0, n_coords-1);
		}
		rand_coord = _rand_coord;

		water_coords = [water_x[rand_coord], water_y[rand_coord]];
	} else {
		var xx = water_coords[0];
		var yy = water_coords[1];
		if(point_distance(x, y, xx, yy) > water_spd){
			var dir_ = point_direction(x, y, xx, yy);
			var ldirx = lengthdir_x(water_spd, dir_);
			var ldiry = lengthdir_y(water_spd, dir_);
		
			// apply movement
			x += ldirx;
			y += ldiry;

			if(abs(ldirx) > abs(ldiry)){
				switch(sign(ldirx)){
					case 1: facing = dir.right; break;
					case -1: facing = dir.left; break;
				}
			} else {
				switch(sign(ldiry)){
					case 1: facing = dir.down; break;
					case -1: facing = dir.up; break;
				}
			}

			switch(facing){ 
				
				case 0: sprite_index = walk_back; break;
				case 90: sprite_index = walk_right; break;
				case 180: sprite_index = walk_front; break;
				case 270: sprite_index = walk_left; break;
			}
		} else {
			facing = water_facing[rand_coord];
			switch(facing){
				case 0: sprite_index = spr_poppy_watering_back; break;
				case 90: sprite_index = spr_poppy_watering_right; break;
				case 180:
				case 270: sprite_index = spr_poppy_watering_left; break;
			}

			x = xx;
			y = yy;
		}
	}
	if not polka.in_dialogue { anim_w_count += 1; }
}