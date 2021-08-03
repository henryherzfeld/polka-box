var inst = instance_find(game_pt, 0);

if inst == noone {
	inst = instance_create_layer(0, 0, "Meta", game_pt);
	
	inst.spawn_x = 128;
	inst.spawn_y = 320;
}