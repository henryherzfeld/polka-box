// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_restart_room(){

	scr_clear_path_grid(game_pt.path_grid);
	room_goto(rm_platformer_test_drawing);

	room_speed = 60;
	game_pt.debug_time_slowed = false;
}