///@descripton scr_cutscene_animate_character
///@param character
///@param sprite
///@param *animation_multiplier
function scr_cutscene_animate_character() {

	var character = argument0;
	var spr = argument1;

	var multi;
	if argument_count > 2 {
		multi = argument[2];
	} else {
		multi = 1;
	}

	var n_subimg = sprite_get_number(spr);

	var anim_length = multi*n_subimg;

	if not anim_start {
		anim_start = true;
		with character {
			alarm[0] = anim_length*(fps/sprite_get_speed(spr));
			sprite_prev = sprite_index;
			sprite_index = spr;
		}
		// using scr_cutscene alarm to deactivate action
		alarm[0] = anim_length*(fps/sprite_get_speed(spr));
	} 

	if anim_done {
		scr_cutscene_end_action();
		anim_start = false;
		anim_done = false;
	}


}
