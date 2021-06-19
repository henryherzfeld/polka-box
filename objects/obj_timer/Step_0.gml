/// @description Insert description here

if game.canvas_change {
	xx = (game.gui_width - w_bar) / 2;
	yy = game.gui_height / 6;
}

// formatting minutes and seconds
minutes = string(time div 60);
seconds = string(time mod 60);
if(string_length(seconds) = 1){
	seconds = string_insert("0", seconds, 0);
}

timer_text = minutes + ":" + seconds;

h_text = string_height(timer_text);

if start { 
	start = false;
	time_start = time;
	
	// start counting down
	alarm[0] = room_speed;
}



if time <= 0 {
	if not fired {
		fired = true;
		scr_script_execute_array_1d(on_finish);
	}
}