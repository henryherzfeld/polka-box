/// @description Insert description here

if(keyboard_check_pressed(vk_backspace) and keyboard_check(vk_lcontrol)){
	if (debug){
		debug = false;
	} else{
		debug = true;	
	}
}

if(browser_width != width || browser_height != height){
    width = min(base_width, browser_width);
    height = min(base_height, browser_height);
    scr_scale_canvas(base_width, base_height, width, height, true);
}

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

if(initial){
	if file_exists("savedgame.sav"){
	game.do_load = true;
}
	if(room == start_room){
		if(game.do_load){ scr_construct_load_meta(); game.do_load = false; }
		else { scr_construct_meta(); }
		initial = false;
	}
}