/// @description Insert description here
// You can write your code in this editor

var time = flags.time;

minutes = string(time div 60);
seconds = string(time mod 60);

curr_prog = flags.progress;

if(string_length(seconds) = 1){
	seconds = string_insert("0", seconds, 0);
}


// Changing objective phase draw and text
//show_debug_message(flags.objective_phase);

if objective_change {
	objective_change = false;
	objective_col = scr_get_phase_state(flags.objective_phase, enum_phase_state.bg_color);
	objective_text_col = scr_get_phase_state(flags.objective_phase, enum_phase_state.text_color);

}