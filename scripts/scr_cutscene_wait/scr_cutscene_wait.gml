///description cutscene_wait
///@arg seconds
function scr_cutscene_wait(argument0) {

	timer++;

	if(timer >= argument0 * room_speed){
		timer = 0;
		scr_cutscene_end_action();
	}


}
