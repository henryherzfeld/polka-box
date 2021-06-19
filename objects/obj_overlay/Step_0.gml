/// @description Insert description here
// You can write your code in this editor

if game.canvas_change {
	/*
	x1 = (game.gui_width - w_pbar)/2;
	x_heart = game.gui_width - (50*flags.hearts+1);
	x_coin = ((game.gui_width - 100)/2) * .75;
	nb_x1 = game.gui_width*.9; nb_y1 = game.gui_height*.8;
	nb_x2 = game.gui_width*.9+100; nb_y2 = game.gui_height*.8+100;
	*/
	
	var gg = scr_translate_coords((750-w_pbar/2), 100, enum_anchor.top_center, 16/9);	
	x1 = gg[0];
	
	var gg = scr_translate_coords(((1500 - 100)/2) * .75, 100, enum_anchor.top_center, 16/9);
	x_coin = gg[0];
	
	var ggg = scr_translate_coords(1500-(50*flags.hearts+1), 100, enum_anchor.top_right, 16/9);	
	x_heart = ggg[0];
	
	var kk = scr_translate_coords(1500*.9, 840*.8, enum_anchor.bottom_right, 16/9);
	nb_x1 = kk[0]; nb_x2 = kk[0]+100;
	nb_y1 = kk[1]; nb_y2 = kk[1]+100;
}

var time = flags.time;

minutes = string(time div 60);
seconds = string(time mod 60);

curr_prog = flags.progress;

if(string_length(seconds) = 1){
	seconds = string_insert("0", seconds, 0);
}

// Changing objective phase draw and text
if objective_change {
	objective_change = false;
	
	objective_col = scr_get_phase_state(flags.objective_phase, enum_phase_state.bg_color);
	objective_text_col = scr_get_phase_state(flags.objective_phase, enum_phase_state.text_color);

}