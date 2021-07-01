// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_restart_room(){

	scr_clear_path_grid(game_pt.path_grid);
	ds_grid_destroy(game_pt.path_grid);
	room_goto(room);

	room_speed = 60;
	game_pt.debug_time_slowed = false;
}