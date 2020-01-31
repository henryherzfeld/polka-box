/// @description Insert description here

if(keyboard_check_pressed(vk_backspace) and keyboard_check(vk_lcontrol)){
	show_debug_message(debug)
	if (debug){
		debug = false;
	} else{
		debug = true;	
	}
}

