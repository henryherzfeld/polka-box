/// @description Insert description here

if checkpoint >= 0 {
	var inst = instance_find(polka_pt, 0);
	
	if inst != noone {
		player.x = checkpoint_spawn_x;
		player.y = checkpoint_spawn_y;
		//polka.facing = spawn_facing;
	}
	
	// disable collectables
	var disabled_coins = room_snapshot[? "disabled_coins"];
			
	var i = 0;
	repeat(ds_list_size(disabled_coins)) {
		var _id = disabled_coins[| i];
		show_debug_message(_id)
		_id._disabled = true;
		i++;
	}
}

scr_clear_path_grid(path_grid);