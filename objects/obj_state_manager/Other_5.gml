/// @description Insert description here
exit;
if(room == erosion_village and !game.do_load){
	if(!ds_list_empty(villies)){
		ds_list_destroy(x_coords);
		ds_list_destroy(y_coords);
		ds_list_destroy(villies);
	}

	x_coords = ds_list_create();
	y_coords = ds_list_create()
	villies = ds_list_create();

	var n = instance_number(obj_npc_villy);
	var i;

	for (i = 0; i < n; i += 1){
		villies[| i] = instance_find(obj_npc_villy, i);
		x_coords[| i] = villies[| i].x;
		y_coords[| i] = villies[| i].y;
	}
}
