// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_room_snapshot_delete(){
	ds_list_destroy(game_pt.room_snapshot[? "disabled_coins"]);
	ds_map_destroy(game_pt.room_snapshot);
	game_pt.room_snapshot = noone;
}