/// @description Insert description here

// modify scaling on canvas change

if disable { 
	if not first {
		first = true;
		for(var i = 0; i < n_but; i++) {
			var inst = button_context[i];
			inst.disable = true;
		}
	}
	exit;
} else {
	if first {
		first = false;
		for(var i = 0; i < n_but; i++) {
			var inst = button_context[i];
			inst.disable = false;
		}
	}
}

if is_quiz {
	window_sprite = spr_test_menu;
	window_h = sprite_get_height(window_sprite);
	window_w = sprite_get_width(window_sprite);
	game.canvas_change = true;
}

if game.canvas_change {
	
	var prevx = x1;
	var prevy = y1;
	
	x1 = (game.gui_width - window_w)/2;
	y1 = (game.gui_height - window_h)/2;
	
	var newx = x1;
	var newy = y1;
	
	for(var i = 0; i < n_but; i++) {
	var inst = button_context[i];
		with inst {
			var absx = x1 - prevx;
			var absy = y1 - prevy;
		
			x1 = absx + newx;
			y1 = absy + newy;
			update = true;
		}
	}
}

if(destroy_window){ 
	for(var i = 0; i < n_but; i++) {
		var inst = button_context[i];

		with(inst) { instance_destroy(); }
	}
	instance_destroy();
}

// disabling other radios relative to enabled radio context
if enable_change {
	enable_change = false;
	
	var curr_context = enabled_radio.context;
	
	for(i = 0; i < enabled_radio.n_context; i++){
		var inst = curr_context[i];
		
		if inst.id != enabled_radio.id {
			inst.enabled = false;
		}	
	}
	enabled_radio = noone;
}

if build_buttons {
	build_buttons = false;
	
	var i = 0;
	var j = 0;
	
	repeat(ds_grid_width(button_grid)){
		var build_radio = false;
		
		var but_x = button_grid[# i, 0];
		var but_y = button_grid[# i, 1]
		var but_text = button_grid[# i, 2];
		var but_type = button_grid[# i, 3];
		var but_event = button_grid[# i, 4];
		var but_attr = button_grid[# i, 5];
		
		var but_obj = noone;
		
		switch(but_type){
			case enum_button_type.click: but_obj = but_click break;
			case enum_button_type.radio: {
				but_obj = but_radio;
				
				build_radio = true;
				
				break;
			}
			case enum_button_type.checkbox: {
				but_obj = but_checkbox;
				
				if is_array(but_attr){
					if but_attr[0] == scr_change_variable {
						var is_enabled = variable_instance_get(but_attr[1], but_attr[2]);
					}
				}
				break;
			}
		}

		if build_radio {
			var n = array_length_1d(but_x);
			
			var temp_context = [];

			for(var k = 0; k < n; k++){
				var inst = instance_create_layer(but_x[k], but_y[k], "Menus", but_obj);
				button_context[i+k] = inst.id;
				
				temp_context[k] = inst.id;
				
				inst.x1 = but_x[k] + x1;
				inst.y1 = but_y[k] + y1;
				inst.text = but_text[k];
				inst.event = but_event;
				inst.attr = but_attr[k];
			}

			j += n-1;
			
			// assign context array to context member of all elements of current radio context array
			for(var k = 0; k < n; k++){
				var inst = temp_context[k];
				inst.context = temp_context;
				inst.n_context = n;
				inst.update = true;
			}
		} else {

			var inst = instance_create_layer(but_x, but_y, "Menus", but_obj);
			button_context[i+j] = inst.id;
			inst.x1 = but_x + x1;
			inst.y1 = but_y + y1;
			inst.text = but_text;
			inst.event = but_event;
			inst.attr = but_attr;
			if but_obj == but_checkbox and is_array(but_attr){
				inst.enabled = is_enabled;
			}
			inst.update = true;
		}
		i += 1;
	}
	n_but = i+j;
} else {
	for(var i = 0; i < n_but; i++) {
	
		var but = button_context[i];

			with but {
	
			// enable on leave behavior for buttons in a window
			// does not fire in time for quiz behavior
			if object_index == but_checkbox {
				if other.destroy_window {
					fire = true;
				}
			} else if object_index == but_radio {
				if other.destroy_window and enabled {
					fire = true;
				}
			}
	
			if fire {
				fire = false;

				// execute event
				switch(event){
					case enum_button_event.new_window: {
						other.menu_ptr.curr_window = attr;
						break;
					}
			
					case enum_button_event.quiz_evidence:
					case enum_button_event.run_script: {

						// toggling checkbox enabled attribute for toggle behavior
						if object_index == but_checkbox {
							var temp = attr;
							temp[array_length_1d(attr)] = self.enabled;
							scr_script_execute_array_1d(temp);
						}
						else if(is_array(attr)){ 
							if is_array(attr[0]) { 
								var i = 0; repeat(array_length_1d(attr)){
									scr_script_execute_array_1d(attr[i])
									i++;
								}
							} else {
								scr_script_execute_array_1d(attr); 
							}
							}
						else { script_execute(attr); }
						break;
					}
			
					case enum_button_event.run_script_exit: {
						// toggling checkbox enabled attribute for toggle behavior
						if object_index == but_checkbox {
							var temp = attr;
							temp[array_length_1d(attr)] = self.enabled;
							scr_script_execute_array_1d(temp);
						}
						else if(is_array(attr)){ scr_script_execute_array_1d(attr) }
						else { script_execute(attr); }
					}
			
					case enum_button_event.exit_: {
						other.destroy_window = true; 
						par_menu.destroy_menu = true;
						break;
					}
				}
			} else {
				switch(event) {
			
					case enum_button_event.quiz_multi: {
						if self.enabled {
							obj_quiz_manager.choice = attr;
						}
						break;
					}
			
					case enum_button_event.quiz_checkbox: {
						var n = array_length_1d(obj_quiz_manager.choice);
						
						var in_choices = false;
						var choice_idx = 0;
				
						for(var j = 0; j < n; j++){
							if attr == obj_quiz_manager.choice[j] {
								choice_idx = j;
								in_choices = true;
							}
						}
				
						if not in_choices {
							if self.enabled {
								obj_quiz_manager.choice[n] = attr;
							}
						// removing de-selected choice from quiz manager choices if any exist
						} else if not self.enabled and n > 0 {
							var new_choices = [];
							
							for(var k = 0; k < choice_idx; k++){
								new_choices[k] = obj_quiz_manager.choice[k];
							}
					
							array_copy(new_choices, choice_idx, obj_quiz_manager.choice, choice_idx + 1, n-choice_idx-1);
							obj_quiz_manager.choice = new_choices;
						}
					break;
					}
				}
			}
		}
	}
}