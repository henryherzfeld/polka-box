/// @description Insert description here

if do_animation {
	show_debug_message(anim_count);
	draw_rectangle(0, game.gui_height/3, game.gui_width, game.gui_height*2/3, false);
	draw_text_color(0, game.gui_height/3, phase_texts[phase_count], c_black, c_black, c_blue, c_blue, 1);
	
	if not anim_count { audio_play_sound(phase_sounds[phase_count], 0, false); }
	
	anim_count += 1;
	
	if anim_count >= phase_timing {
		anim_count = 0;
		phase_count += 1;
		
		if phase_count >= 3 {
			do_animation = false;
		}
	} 
	
	// controlling polka's movement
	if phase_count >= 2 {
		polka.move_override = false;
	} else {
		polka.move_override = true;
	}
}