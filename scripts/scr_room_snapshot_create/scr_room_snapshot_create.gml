// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_room_snapshot_create(){
	if game_pt.snapshot_exists {
		scr_room_snapshot_delete();
	}
	game_pt.room_snapshot = ds_map_create();
	var _map = game_pt.room_snapshot;
	
	_map[? "coins"] = game_pt.coins;
	_map[? "star_coins"] = game_pt.star_coins;
	_map[? "lives"] = game_pt._lives;
	
	// collect and store all disabled_coins
	var disabled_coins = ds_list_create();
	var inst = instance_find(par_collectable, 0);
	
	var i = 1;
	while inst != noone {
		if inst._disabled {
			ds_list_add(disabled_coins, inst.id);
		}
		
		inst = instance_find(par_collectable, i);
		i += 1;
	}
	
	_map[? "disabled_coins"] = disabled_coins;
	
	// collect and store all modified arrow blocks
	var disabled_arrow_walls = ds_list_create();
	var inst = instance_find(obj_arrow_wall, 0);
	
	var i = 1;
	while inst != noone {
		if inst._disabled {
			ds_list_add(disabled_arrow_walls, inst.id);
		}
		
		inst = instance_find(obj_arrow_wall, i);
		i += 1;
	}
	
	_map[? "disabled_arrow_walls"] = disabled_arrow_walls;
	
	game_pt.snapshot_exists = true;
}