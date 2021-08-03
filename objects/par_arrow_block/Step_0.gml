/// @description Insert description here

if not pressed and collision_circle(coll_x,coll_y, rad, game_pt.player, false, false) {
	pressed = true;
	
	// kick off scripts, if there are any
	var i = 0;
	if array_length_1d(scripts) > 0 {
		scr_script_execute_array_1d(scripts[i]);
		i += 1;
	}
}