///@description scr_flash_nb_button
function scr_new_evi_noti() {

	with obj_overlay {
		nb_button_pause = true;
		nb_spr = spr_notebook_button_flash;
		alarm[0] = 2 * room_speed;
	}

	return false;


}
