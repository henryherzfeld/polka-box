///@description scr_cutscene_change_character_sprites
///@param character
///@param walk_front
///@param walk_left
///@param walk_back
///@param walk_right
///@param stand_front
///@param stand_left
///@param stand_back
///@param stand_right
function scr_cutscene_change_character_sprites(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {

	var char = argument0;

	with char {
		walk_front = argument1;
		walk_left = argument2;
		walk_back = argument3;
		walk_right = argument4;
		stand_front = argument5;
		stand_left = argument6;
		stand_back = argument7;
		stand_right = argument8;
	
		sprite_index = stand_front;
	}

	scr_cutscene_end_action();


}
