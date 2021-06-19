///@description cutscene_pan_camera_char
///@arg character
///@arg relative
///@arg speed
function scr_cutscene_pan_camera_char(argument0, argument1, argument2) {

	var char = argument0;
	var relative = argument1;
	var spd = argument2;
	scr_cutscene_pan_camera(char.x, char.y, relative, spd);


}
