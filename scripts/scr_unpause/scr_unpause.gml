///@description scr_unpause
function scr_unpause() {

	if(sprite_exists(screenshot)){
		sprite_delete(screenshot);
	}

	instance_activate_all();


}
