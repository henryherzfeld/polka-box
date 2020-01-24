/// @description Insert description here
// You can write your code in this editor

var mx = device_mouse_x_to_gui(0);						//Mouse's X pos relative to the display (not the game world)
var my = device_mouse_y_to_gui(0);						//Mouse's Y pos relative to the display (not the game world)
var m_click_in_box = false;

if(point_in_rectangle(mx, my, textbox_x, textbox_y, textbox_x + box_width, textbox_y + box_height) and mouse_check_button_pressed(mb_left)){m_click_in_box = true;}

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

if (keyboard_check_pressed(interact_key) or m_click_in_box){
	if(page < n - 3){
		++page;
	}
	else{
		draw_options = true;
	}
}



