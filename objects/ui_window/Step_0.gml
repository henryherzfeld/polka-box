/// @description Insert description here

with(par_button){
	
	if object_index == but_checkbox {
		if other.destroy_window {
			fire = true;
		}
	}
	
	if fire {

		// execute event
		switch(event){
			case enum_button_event.new_window: {
				other.menu_ptr.curr_window = attr;
				break;
			}
			
			case enum_button_event.run_script: {
				// toggling checkbox enabled attribute for toggle behavior
				if object_index == but_checkbox {
					var temp = attr;
					temp[array_length_1d(attr)] = self.enabled;
					scr_script_execute_array_1d(temp);
				}
				else if(is_array(attr)){ scr_script_execute_array_1d(attr) }
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
			
			case enum_button_event.quiz_multi: {
				if self.enabled {
					obj_quiz_manager.choice = attr;
				}
				break;
			}
			
			case enum_button_event.quiz_checkbox: {
				if self.enabled {
					var n = array_length_1d(obj_quiz_manager.choice)
					obj_quiz_manager.choice[n] = attr;
				}
				break;
			}
		}
	}
}

if(button_grid != -1){
	var i = 0;
	
	repeat(ds_grid_width(button_grid)){
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
				
				
				
				break;
			}
			case enum_button_type.checkbox: {
				but_obj = but_checkbox;
				
				if is_array(but_attr){
					if but_attr[0] == scr_change_variable {
						var enabled = variable_instance_get(but_attr[1], but_attr[2]);
					}
				}
				break;
			}
		}

		var inst = instance_create_layer(but_x, but_y, "Menus", but_obj)
		inst.x1 = but_x;
		inst.y1 = but_y;
		inst.text = but_text;
		inst.event = but_event;
		inst.attr = but_attr;
		if but_obj == but_checkbox and is_array(but_attr){
			inst.enabled = enabled;
		}
		inst.update = true;
		
		i += 1;
	}
	button_grid = -1;
}

if(destroy_window){ 
	with(par_button) { instance_destroy(); }
	instance_destroy();
}