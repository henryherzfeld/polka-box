/// @description Insert description here
n_options = array_length_1d(options);

if(keyboard_check_pressed(vk_up)){
	--selected;	
} else if (keyboard_check_pressed(vk_down)){
	++selected;
}

// clamping selecting between 0 and n_options - 1
selected = clamp(selected, 0, n_options-1)


// Test for interact input to move current page forward
if (keyboard_check_pressed(interact_key)){
	if(page < n - 3){
		++page;
	} else if (draw_options){
		draw_options = false;
		page = 1;
		current = text[? options[selected]];
		if(options[selected] = "EXIT"){exiting = true;}
	}
	else{
		draw_options = true;
	}
}



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