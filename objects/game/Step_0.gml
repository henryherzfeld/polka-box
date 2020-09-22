/// @description Insert description here


// grabbing audio context for html5
if not play_audio and audio_system_is_available() {
	play_audio = true;
	if music audio_play_sound(snd_orbit, 100, true);
}

if rain and (room == erosion_forest or room == erosion_village) effect_create_below(ef_rain, 10, 10, 1, c_white);

if(keyboard_check_pressed(vk_backspace) and keyboard_check(vk_lcontrol)){
	if (debug){
		debug = false;
	} else{
		debug = true;	
	}
}


if(buffer != 0){
	buffer -= 1;
}

/*
if(keyboard_check_pressed(vk_escape)){
	
	if(buffer == 0){
		buffer = 5;
		var inst = instance_find(menu_pause, 0);
		if(inst == noone){
			instance_create_layer(0, 0, "Menus", menu_pause);
			scr_event_fire(event.pause);
		}
	}
}
*/

canvas_change = false;

if(browser_width != width || browser_height != height){
	canvas_change = true;
    width = min(base_width, browser_width);
    height = min(base_height, browser_height);
    scr_scale_canvas(base_width, base_height, width, height, true);
}

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

if(pause_change){

	pause_change = false;

	if pause { pause = false; }
	else { pause = true; }

	if(pause){
		scr_pause();
	}
	else {
		scr_unpause();
	}

}

if room == main_menu { exit;}

// swap behavior for help and map menus
if keyboard_check_pressed(ord("H")) {
	draw_help = !draw_help;
	if draw_map and draw_help { draw_map = false;}
}

if keyboard_check_pressed(ord("M")) {
	draw_map = !draw_map;
	if draw_map and draw_help { draw_help = false;}
}