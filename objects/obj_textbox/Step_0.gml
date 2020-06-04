/// @description Insert description here

//updating parameters on canvas change
if game.canvas_change {
	port_x=(game.gui_width-box_width-port_width)*0.5;
	port_y=(game.gui_height*0.98) - box_height;
	textbox_x=port_x+port_width - 24;
	textbox_y=port_y;
	namebox_x=port_x;
	namebox_y=port_y + port_height;
	textbox_padded_x = textbox_x + text_padding;
	textbox_padded_y = textbox_y + text_padding;
}


draw_set_font(font);

//Test to produce initial greeting text for dialogue
if (first){
	first = false;
	
	curr_seq = text[? "GREET"];
	string_obj = curr_seq[page];
	n = array_length_1d(curr_seq);
	options = curr_seq[n-2];        // get last item of curr_seq dialogue array for options array
	speakers = curr_seq[n-1];
	speaker = speakers[page];
	// unpacking speaker data (portrait emotion) from speaker variable
	if is_array(speaker) {
		emotion = speaker[1];
		speaker = speaker[0];
	} else if speaker != noone {
		emotion = enum_portrait.neutral
	}

	
	// testing current string from current sequence for modifications
	if(is_array(string_obj)){ 
		string_ = string_obj[0];
		string_n_mods = array_length_1d(string_obj) - 1;
		array_copy(string_mods, 0, string_obj, 1, string_n_mods);
	}
	else { string_ = string_obj }
	
	string_wrapped = scr_wrap_text(string_, box_width - 2*text_padding);
	string_len = string_length(string_wrapped);
}

// Test for interact input to move curr_seq page forward
if (keyboard_check_pressed(interact_key) and !dialogue_pause){
	if (draw_options){
			draw_options = false;
			page_change = true;
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


	if text_drawn {
		page_change = true;
		if(page < n - 3){
			page++;
		} else{
			draw_options = true;
		}
	} else {
		counter = string_len;
	}

}

if(page_change){
	
	page_change = false;
	text_drawn = false;
	color_draw = false;
	string_n_mods = 0;
	string_mods = [];
	
	if(array_length_1d(curr_seq) >= 2){
		string_obj = curr_seq[page];
		n = array_length_1d(curr_seq);
		speakers = curr_seq[n-1];
		options = curr_seq[n-2];        // get last item of curr_seq dialogue array for options array
		speaker = speakers[page];
		
		// unpacking speaker data (portrait emotion) from speaker variable
		if is_array(speaker) {
			emotion = speaker[1];
			speaker = speaker[0];
		} else if speaker != noone {
			emotion = enum_portrait.neutral
		}
		
		// testing current string from current sequence for modifications
		if(is_array(string_obj)){ 
			string_ = string_obj[0];
			string_n_mods = array_length_1d(string_obj) - 1;
			array_copy(string_mods, 0, string_obj, 1, string_n_mods);
			}
		else { string_ = string_obj }
		
	}
	
	n_options = array_length_1d(options);

	string_wrapped = scr_wrap_text(string_, box_width - 2*text_padding);
	string_len = string_length(string_wrapped);
	
	counter = 0;
	color_idx = 0;
	
}

// Executing string modification scripts
for(var i = 0; i < string_n_mods; i++){
	curr_mod = string_mods[i];
	
	switch(curr_mod[0]){
		case "SCRIPT": {
			var input = [];
			array_copy(input, 0, curr_mod, 1, array_length_1d(curr_mod) - 1)
			scr_script_execute_array_1d(input);
			break;
		}
			
		case "QUIZ": {
			dialogue_pause = true;
			obj_quiz_manager.questions = curr_mod[1];
			obj_quiz_manager.quizzer_id = curr_mod[2];
			obj_quiz_manager.textbox_ptr = id;
			break;
		}
		
		case "COLOR": {
			if not color_draw {
				preprocess_idx = 0;
				string_wrapped_arr[0] = string_;
				string_len = string_length(string_wrapped_arr[0]);
			}
			
			color_draw = true;
			var color = curr_mod[1];
			var start_ = curr_mod[2] - preprocess_idx;
			var end_ = curr_mod[3] - preprocess_idx;
			
			var n_wrapped = array_length_1d(string_wrapped_arr);
			var str_to_process = string_wrapped_arr[n_wrapped-1];
			var n_str_to_process = string_length(str_to_process);
			
			var before = string_copy(str_to_process, 0, start_-1);
			var colored = string_copy(str_to_process, start_, end_-start_+1);
			var after = string_copy(str_to_process, end_+1, n_str_to_process-end_);
			
			// text 
			string_wrapped_arr[n_wrapped-1] = scr_wrap_text(before, box_width - 2*text_padding);;
			string_wrapped_arr[n_wrapped] = scr_wrap_text(colored, box_width - 2*text_padding);;
			string_wrapped_arr[n_wrapped+1] = scr_wrap_text(after, box_width - 2*text_padding);;
			/*
			// color
			string_wrapped_arr[n_wrapped-1] = noone;
			string_wrapped_arr[n_wrapped] = color;
			string_wrapped_arr[n_wrapped+1] = noone;
			
			// location
			string_wrapped_arr[n_wrapped-1] = before;
			string_wrapped_arr[n_wrapped] = color;
			string_wrapped_arr[n_wrapped+1] = after;
			*/
			
			
			preprocess_idx = curr_mod[3];
			
			

			break;
		}
		
		case "SPRITE": {
			sprite_draw = !sprite_draw;

			if sprite_draw {

				sprite_to_draw = curr_mod[1];
				sprite_x = sprite_get_width(sprite_to_draw);
				sprite_y = sprite_get_height(sprite_to_draw);

			}
			break;
		}
	}
	
	// remove entry from script mods
	var temp = [];
	array_copy(temp, 0, string_mods, 1, string_n_mods - 1);
	string_mods = temp;
	i += 1;
	string_n_mods -= 1; 
	
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
	var n_scripts = array_length_1d(scripts);
	
	for (var i = 0; i < n_scripts; ++i){
		args = scripts[i];
		scr_script_execute_array_1d(args);
		}
	}	
	
	InventoryManager.disable = false;
	with(polka){
		in_dialogue = false;
		interactable = false;
			
	}

	instance_destroy();
}

draw_set_font(font_comic);