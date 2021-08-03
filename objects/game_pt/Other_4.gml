/// @description Insert description here

if checkpoint >= 0 {
	var inst = instance_find(polka_pt, 0);
	
	if inst != noone {
		player.x = checkpoint_spawn_x;
		player.y = checkpoint_spawn_y;
		//polka.facing = spawn_facing;
	}
}

scr_clear_path_grid(path_grid);