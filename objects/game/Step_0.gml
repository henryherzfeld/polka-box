/// @description Insert description here

/*
if weather_change {
	switch(weather) {
	 case "sunny":
		
	 break;
	 case "raining":
		
	 break;
	}
}
*/

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