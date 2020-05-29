/// @description Insert description here
// You can write your code in this editor

if game.canvas_change {
	x1 = (game.gui_width - w_pbar)/2;
	x_heart = game.gui_width - 150;
	x_coin = ((game.gui_width - 100)/2) * 1.5;
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