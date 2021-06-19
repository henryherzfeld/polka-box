///@description change 
///@arg character
///@arg facing
function scr_cutscene_change_facing(argument0, argument1) {

	var char = argument0;
	var _facing = argument1;

	with char {
		switch(_facing){
			case 0: sprite_index = stand_back; break;
			case 90: sprite_index = stand_right; break;
			case 180: sprite_index = stand_front; break;
			case 270: sprite_index = stand_left; break;
		}
	}

	scr_cutscene_end_action();


}
