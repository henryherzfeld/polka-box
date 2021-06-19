/// @description Insert description here
// You can write your code in this editor

if(!is_array(scene_info)) {instance_destroy(); game_set_speed(60, gamespeed_fps)}
if(active){
	scr_script_execute_array_1d(scene_info[scene])
}

if game.debug and active {

	// reduce gamespeed
	if keyboard_check_direct(vk_control) {
		if keyboard_check_pressed(vk_down) and debug_speed >= debug_speed_interval+1 {
			debug_speed -= debug_speed_interval;
		} else if keyboard_check_pressed(vk_up) {
			debug_speed += debug_speed_interval;
		}
	}
	game_set_speed(debug_speed, gamespeed_fps);
}