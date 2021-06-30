/// @description Insert description here

/// @description Insert description here

if os_browser != browser_not_a_browser {
	exit;
}

input_fs = keyboard_check_pressed(vk_f10);
input_1 = keyboard_check_pressed(vk_f1) or keyboard_check_pressed(ord("9"));
input_2 = keyboard_check_pressed(vk_f2);
input_3 = keyboard_check_pressed(vk_f3);
input_4 = keyboard_check_pressed(vk_f4);
input_5 = keyboard_check_pressed(vk_f5);
input_any = input_1 or input_2 or input_3 or input_4 or input_5;

// change scale value
if keyboard_check_pressed(vk_pageup) {
	scale *= 2;
	update = true;
} else if keyboard_check_pressed(vk_pagedown) {
	scale /= 2;
	update = true;
}

if input_fs {
	fullscreen = !fullscreen
	window_set_fullscreen(fullscreen);
}

if input_1 {
	window_target_x = (1500 div 24) * 24;
	window_target_y = (840 div 24) * 24;
} else if input_2 {
	window_target_x = 1500;
	window_target_y = 840;
} else if input_3 {
	window_target_x = 24 * 32;
	window_target_y = 24 * 20;
} else if input_4 { 
	window_target_x = 24 * 30;
	window_target_y = 24 * 20;
} else if input_5 {
	window_target_x = 24 * 16.23;
	window_target_y = 24 * 8.79;
}

if update or input_any {
	
	// change max display width and height dependant on fullscreen on windows or on phone
	if (fullscreen and os_type == os_windows) or os_type == os_android or os_type == os_ios {
		max_disp_height = disp_height;
		max_disp_width = disp_width;
	} else {
		max_disp_height = window_get_height();
		max_disp_width = window_get_width();
	}

	var _ratio = disp_width/disp_height;
	
	// detect closest ratio from provided window target
	var i = 0;
	var _min = 100;
	var ratio_idx = 0;
	repeat(ratio_n) {
		var ratio_temp = abs(ratio_vals[i] - _ratio);
		if _min > ratio_temp {
			ratio_idx = i;
			_min = ratio_temp;
		}
		i += 1;
	}
	
	// find resolution that fits inside display matching aspect ratio index
	var i = 0;
	var target_x;
	var target_y;
	var min_resolution = resolution_grid[# ratio_idx, 0];
	var max_x = min_resolution[0];
	var max_y = min_resolution[1];
	repeat(resolution_n) {
		var curr_resolution = resolution_grid[# ratio_idx, i];
		var curr_x = curr_resolution[0];
		var curr_y = curr_resolution[1];
		
		if curr_x <= max_disp_width and curr_y <= max_disp_height {
			if curr_x > max_x and curr_y > max_y {
				max_x = curr_x;
				max_y = curr_y;
			}
		}
		i += 1;
	}
	target_x = max_x;
	target_y = max_y;
	
	show_debug_message("\n\nResolution Values: ");
	show_debug_message([window_target_x, window_target_y]);
	show_debug_message([target_x, target_y]);
    show_debug_message([scale, ratio_names[ratio_idx]]);

	window_target_x = target_x;
	window_target_y = target_y;
	
	// resize camera view to reflect change in viewport, window, surface
	camera_set_view_size(view_camera[0], window_target_x/scale, window_target_y/scale);
	
	// resize and center window
	var disp_offx = (display_get_width()-window_target_x)/2
	var disp_offy = (display_get_height()-window_target_y)/2
	window_set_rectangle(disp_offx, disp_offy, window_target_x, window_target_y);
	
	//keep app surface and window the same size
	// not necessary if forcing to window_target_x
	surface_resize(application_surface, window_target_x, window_target_y);
}

var offx = (window_width-window_target_x)/2;
var offy = (window_height-window_target_y)/2;

if surface_exists(application_surface) { 
	gpu_set_blendenable(false);
	draw_surface_ext(application_surface, offx, offy, 1, 1, 0, c_white, 1);
	gpu_set_blendenable(true);
}

update = false;