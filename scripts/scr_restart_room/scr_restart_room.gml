// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_restart_room(){
	
	if game_pt._lives >= 1 {
		room_goto(game_pt.checkpoint_spawn_room);
		
		if game_pt.snapshot_exists {
			var _map = game_pt.room_snapshot;
			var coins = _map[? "coins"];
			var star_coins = _map[? "star_coins"];
			var _lives = _map[? "lives"];
			var disabled_coins = _map[? "disabled_coins"];
			var disabled_arrow_walls = _map[? "disabled_arrow_walls"];
			
			//update map to store updated life count, only way to reach checkpoint is death
			_map[? "lives"] = _lives-1;
			
			var i = 0;
			repeat(ds_list_size(disabled_coins)) {
				var _id = disabled_coins[| i];
				_id._disabled = true;
				i++;
			}
			
			var i = 0;
			repeat(ds_list_size(disabled_arrow_walls)) {
				var _id = disabled_arrow_walls[| i];
				_id._disabled = true;
				i++;
			}
			
			// set coins and star coins to recorded state
			game_pt.coins = coins;
			game_pt.star_coins = star_coins;
			
		} else {
			
			// no snapshot, set coins and star coins back to 0
			game_pt.coins = 0;
			game_pt.star_coins = 0;
		}	
		
		game_pt._lives -= 1;
		
	} else { // reset collectibles and return to beginning of level
		room_goto(game_pt.initial_spawn_room);
		scr_room_snapshot_delete();
		game_pt.snapshot_exists = false;
		game_pt.checkpoint = -1;
		game_pt._lives = 1;
		game_pt.coins = 0;
		game_pt.star_coins = 0;
	}

	room_speed = 60;
	game_pt.debug_time_slowed = false;
}