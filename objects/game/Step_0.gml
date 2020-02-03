/// @description Insert description here

if(keyboard_check_pressed(vk_backspace) and keyboard_check(vk_lcontrol)){
	if (debug){
		debug = false;
	} else{
		debug = true;	
	}
}

if (browser_width != width || browser_height != height){
    width = min(base_width, browser_width);
    height = min(base_height, browser_height);
    scr_scale_canvas(base_width, base_height, width, height, true);
}