/// @description Insert description here

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
		}
		
		var inst = instance_create_layer(but_x, but_y, "Menus", but_obj)
		inst.x1 = but_x;
		inst.y1 = but_y;
		inst.text = but_text;
		inst.event = but_event;
		inst.attr = but_attr;
		inst.update = true;
		
		i += 1;
	}
	button_grid = -1;
}

with(par_button){
	if fire {
		// execute event
		switch(event){
			case enum_button_event.new_window: {
				other.destroy_window = true;
				other.menu_ptr.curr_window = attr;
				break;
			}
			
			case enum_button_event.run_script: {
				if(is_array(attr)){ scr_script_execute_array_1d(attr) }
				else { script_execute(attr); }
				break;
			}
			
			case enum_button_event.run_script_exit: {
				if(is_array(attr)){ scr_script_execute_array_1d(attr) }
				else { script_execute(attr); }
				other.destroy_window = true; 
				par_menu.destroy_menu = true;
				break;
			}
			
			case enum_button_event.exit_: {
				other.destroy_window = true; 
				par_menu.destroy_menu = true;
				break;
			}
		}
	}	
}

if(destroy_window){ 
	with(par_button){
		instance_destroy();
	}
	instance_destroy();
	}