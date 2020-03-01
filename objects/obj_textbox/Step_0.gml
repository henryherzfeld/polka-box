/// @description Insert description here

// Test for interact input to move curr_seq page forward
if (keyboard_check_pressed(interact_key)){
	page_change = true;
	
	if(page < n - 3){
		page++;

	} else if (draw_options){
		draw_options = false;
		
		if(options[selected] = "GREET"){
			page = 0;
		} else {
			page = 1;
		}
	
		curr_seq = text[? options[selected]];
		n = array_length_1d(curr_seq);
		
		if(options[selected] = "EXIT"){exiting = true; page_change = false;}
	}
	else{
		draw_options = true;
	}
}

if(page_change){
	
	page_change = false;
	speakers = curr_seq[n-1];
	speaker = speakers[page];
	options = curr_seq[n-2];        // get last item of curr_seq dialogue array for options array
	n_options = array_length_1d(options);
	curr_string = curr_seq[page];
	
}

// moving up and down through options using arrow keys
if(keyboard_check_pressed(vk_up)){
	--selected;	
} else if (keyboard_check_pressed(vk_down)){
	++selected;
}

// clamping selecting between 0 and n_options - 1
selected = clamp(selected, 0, n_options-1)

if(exiting){
	if (is_array(scripts)){
	n = array_length_1d(scripts);
	
	for (var i = 0; i < n; ++i){
		args = scripts[i]
		script_execute(args[0], args[1], args[2], args[3])
		}
	}	
	instance_destroy();
}