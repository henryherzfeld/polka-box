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

with(obj){

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