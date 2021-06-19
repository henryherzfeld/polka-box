/// @description Insert description here

if place_meeting(x, y, polka_pt) {
	scr_clear_path_grid(game_pt.path_grid);
	ds_grid_destroy(game_pt.path_grid);
	room_goto(room);
}

if place_meeting(x, y, polka_pt_rc) {
	scr_clear_path_grid(game_pt.path_grid);
	ds_grid_destroy(game_pt.path_grid);
	room_goto(room);
}