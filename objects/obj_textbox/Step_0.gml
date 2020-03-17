/// @description Insert description here

draw_set_font(font);

// Test for interact input to move curr_seq page forward
if (keyboard_check_pressed(interact_key) and !dialogue_pause){
	page_change = true;
	
	if(page < n - 3){
		page++;

	} else if (draw_options){
		draw_options = false;
		visited[? options[selected]] = true;
		
		/*
		// skip first piece of dialogue in sequence
		if(options[selected] = "GREET"){
			page = 0;
		} else {
			page = 1;
		}
		*/
		page = 0;
	
		curr_seq = text[? options[selected]];
		n = array_length_1d(curr_seq);
		
		if(options[selected] = "EXIT"){exiting = true; page_change = false;}
	}
	else{
		draw_options = true;
		
	}
}

// Executing string modification scripts
for(var i = 0; i < string_n_mods; i++){
	curr_mod = string_mods[i];
	if(curr_mod[0] == "SCRIPT"){
		var input = [];
		array_copy(input, 0, curr_mod, 1, array_length_1d(curr_mod) - 1)
		scr_script_execute_array_1d(input);
	}
	
	else if(curr_mod[0] == "EVI_PROMPT"){
		scr_notebook_evi_prompt();
		evidence_target = curr_mod[1];
	}
	// remove entry from script mods
	array_copy(string_mods, 0, string_mods, 1, string_n_mods - 1);
	i -= 1;
	string_n_mods -= 1; 
	
}

// checking if we made a choice for a piece of evidence during a evidence prompt
if(evidence_choice != noone){
	if(evidence_choice == evidence_target){
		show_debug_message("evidence match");
	}
	
	page_change = true;
	evidence_choice = noone;
	page++;
}

if(page_change){
	
	page_change = false;
	string_n_mods = 0;
	string_mods = [];
	
	if(array_length_1d(curr_seq) >= 2){
		string_obj = curr_seq[page];
		speakers = curr_seq[n-1];
		options = curr_seq[n-2];        // get last item of curr_seq dialogue array for options array
		speaker = speakers[page];
		
		// testing current string from current sequence for modifications
		if(is_array(string_obj)){ 
			string_ = string_obj[0];
			string_n_mods = array_length_1d(string_obj) - 1;
			array_copy(string_mods, 0, string_obj, 1, string_n_mods);
			}
		else { string_ = string_obj }
		
	}
	
	n_options = array_length_1d(options);
	
	string_wrapped = scr_wrap_text(string_, box_width);
	string_len = string_length(string_wrapped);
	
	counter = 0;
	
}

// moving up and down through options using arrow keys
if(keyboard_check_pressed(vk_up)){
	--selected;	
} else if (keyboard_check_pressed(vk_down)){
	++selected;
}

// clamping selecting between 0 and n_options - 1
selected = clamp(selected, 0, n_options-2);

// executing all exit scripts upon final dialogue sequence
// maybe this behavior should change in light of string "modifications"
if(exiting){
	if (is_array(scripts)){
	n = array_length_1d(scripts);
	
	for (var i = 0; i < n; ++i){
		args = scripts[i];
		
		scr_script_execute_array_1d(args);
		}
	}	
	instance_destroy();
}

draw_set_font(font_comic);