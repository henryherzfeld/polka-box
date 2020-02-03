///@description cutscene_change_room
///@arg x
///@arg y
///@arg relative
///@arg speed

var relative = argument2;
var spd = argument3;

//Acquiring coordinates for movement
//Testing if this is the first time
if(x_dest = -1){
	if(relative){
		x_dest = obj_camera.x + argument0;
		y_dest = obj_camera.y + argument1;
	} else {
		x_dest = argument0;
		y_dest = argument1;
	}
}

//Pulling coords from cutscene object
var xx = x_dest;
var yy = y_dest;

with(obj_camera){

	if(point_distance(x, y, xx, yy) > spd){
		var dir = point_direction(x, y, xx, yy);
		var ldirx = lengthdir_x(spd, dir);
		var ldiry = lengthdir_y(spd, dir);
		
		x += ldirx;
		y += ldiry;
		
	} else {
		x = xx;
		y = yy;
		
		with(other){
			x_dest = -1;
			y_dest = -1;
			scr_cutscene_end_action();
		}
	}
}