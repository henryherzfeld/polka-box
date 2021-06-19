///@description cutscene_create_dialogue
///@arg character
///@arg emote
///@arg length
function scr_cutscene_emote_character(argument0, argument1, argument2) {

	var _emote_char = argument0;
	var emote_ = argument1;
	var emote_len = argument2;

	if emote_char == -1 {
		emote_char = _emote_char;
		emote_subimg_count = sprite_get_number(emote_);
		emote_count = emote_len;
	
		// emote instance follows given instance and draws emote
		emote_inst = instance_create_layer(emote_char.x, emote_char.y, "Characters", emote);
		emote_inst.sprite_draw = emote_;
		emote_inst.char = emote_char;
	
	} else if emote_count > 0 {
		if not (emote_count mod emote_subimg_count-1) emote_inst.subimg_idx = emote_count2 mod emote_subimg_count;
		//var subimg_idx = (emote_len-emote_count) mod emote_subimg_count;
	
		if not ((emote_count+1) mod 10) emote_count2 += 1;
		emote_count -= 1;
	} else {
		emote_subimg_count = -1;
		emote_char = -1;
		emote_count = -1;
		emote_count2 = 0;
		instance_destroy(emote_inst);
		scr_cutscene_end_action();
	}


}
