/// @description Insert description here

if(room != main_menu and room != fin){
	var inst = instance_find(polka,0);
	if inst {
		polka.x = spawn_x;
		polka.y = spawn_y;
		polka.facing = spawn_facing;
	}

	// save game slightly after room load
	//alarm[0] = room_speed;
}

