///@description cutscene_change_room
///@arg room
///@arg polka_x
///@arg polka_y
function scr_cutscene_change_room(argument0, argument1, argument2) {

	persistent = true;

	with(game){
		spawn_x = argument1;
		spawn_y = argument2;
		spawn_room = argument0;
		do_transition = true;
	}

	scr_cutscene_end_action();


}
