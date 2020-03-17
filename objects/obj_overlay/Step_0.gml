/// @description Insert description here
// You can write your code in this editor

minutes = string(time div 60);
seconds = string(time mod 60);

curr_prog = flags.progress;

if(string_length(seconds) = 1){
	seconds = string_insert("0", seconds, 0);
}


// Changing objective phase draw and text
//show_debug_message(flags.objective_phase);

switch(flags.objective_phase){
	case enum_objective_phase.miscellaneous: {objective_col = c_navy; objective_text_col = c_white; break;}
	case enum_objective_phase.ask_questions: {objective_col = c_red; objective_text_col = c_black; break;}
	case enum_objective_phase.collect_clues: {objective_col = c_green; objective_text_col = c_white; break;}
	case enum_objective_phase.analyze_clues: {objective_col= c_purple; objective_text_col = c_white; break;}
}