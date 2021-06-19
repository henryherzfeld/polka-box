/// @description Insert description here

if do_animation {

	draw_rectangle_color(0, game.gui_height/3-6, game.gui_width, game.gui_height*2/3+6, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
	draw_rectangle_color(0, game.gui_height/3, game.gui_width, game.gui_height*2/3-1, c_gray, c_gray, c_white, c_white, false);
	draw_set_font(font_large);
	
	var curr_text = phase_texts[phase_count];
	var text_w = string_width(curr_text);
	var text_h = string_height(curr_text);
	
	// change text offset as fx of count
	if anim_count <= phase_timing/2 {
		var text_offset = power(anim_count - (phase_timing/2), 2);
	} else {
		var text_offset = 0;
	}

	var tri_offset = 6;
	var steps = (game.gui_width div tri_offset) + 7; 
	var full_count = anim_count + (phase_count*phase_timing);
	
	var tex = sprite_get_texture(spr_coin, 0);
	show_debug_message(texture_get_width(tex));
	draw_primitive_begin_texture(pr_trianglelist, tex);
	draw_primitive_begin(pr_trianglelist);
	for(var i = 0; i <= steps; i++) {
		
		var y_offset = 0;
		if not (i mod 2) {
			y_offset = tri_offset;
		}
		draw_vertex_texture(tri_offset*(i-6)+ ((full_count) mod (tri_offset*(5+(5/6)))), game.gui_height/3+y_offset-6, 400, 400);
	};
	
	draw_primitive_begin(pr_trianglelist);
	for(var i = 0; i <= steps; i++) {
		
		var y_offset = 0;
		if not (i mod 2) {
			y_offset = tri_offset;
		}
		draw_vertex_colour(tri_offset*(i-6)+ ((full_count) mod (tri_offset*(5+(5/6)))), game.gui_height*2/3-y_offset+6, c_black, 1);
	};

	draw_primitive_end();
	draw_set_alpha(anim_count/phase_timing);
	draw_text_color((game.gui_width-text_w)/2+text_offset, game.gui_height/3+(game.gui_height/3-text_h)/2, phase_texts[phase_count], c_black, c_black, c_blue, c_blue, 1);
	draw_set_font(font_small);
	draw_set_alpha(1);
	
	// play sound effect
	if not anim_count { scr_audio_play_sound(phase_sounds[phase_count], 0, false); }
	
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