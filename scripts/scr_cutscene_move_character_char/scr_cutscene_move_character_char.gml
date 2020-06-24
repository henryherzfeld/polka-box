///@description move polka
///@arg obj
///@arg char
///@arg relative?
///@arg speed

var obj = argument0;
var char = argument1;
var relative = argument2;
var spd = argument3;


//Acquiring coordinates for movement
//Testing if this is the first time
if(x_dest = -1){
	if(relative){
		x_dest = obj.x + char.x;
		y_dest = obj.y + char.y;
	} else {
		x_dest = char.x;
		y_dest = char.y;
	}
}

//Pulling coords from cutscene object
var xx = x_dest + 48;
var yy = y_dest;

var facing;
if(xx > yy){
	switch(sign(xx)){
		case 1: facing = dir.right; break;
		case -1: facing = dir.left; break;
	}
} else {
	switch(sign(yy)){
		case 1: facing = dir.down; break;
		case -1: facing = dir.up; break;
	}
}

with(obj){

	if(point_distance(x, y, xx, yy) > spd){
		var dir = point_direction(x, y, xx, yy);
		var ldirx = lengthdir_x(spd, dir);
		var ldiry = lengthdir_y(spd, dir);
		
		x += ldirx;
		y += ldiry;
		
				//Assign facing variable with movement's direction, default to xmovement
		
		switch(facing){ 
			case 0: sprite_index = spr_villy_walk_back; break;
			case 90: sprite_index = spr_villy_walk_right; break;
			case 180: sprite_index = spr_villy_walk_front; break;
			case 270: sprite_index = spr_villy_walk_left; break;
		}
		
	} else {
		switch(facing){
			case 0: sprite_index = spr_villy_stand_right; break;
			case 90: sprite_index = spr_villy_stand_right; break;
			case 180: sprite_index = spr_villy_stand_right; break;
			case 270: sprite_index = spr_villy_stand_right; break;
		}
		x = xx;
		y = yy;
		
		with(other){
			x_dest = -1;
			y_dest = -1;
			scr_cutscene_end_action();
		}
	}
}