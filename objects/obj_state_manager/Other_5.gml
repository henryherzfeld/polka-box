/// @description Insert description here

if(room == second_village_planting and !game.do_load){

	var n = instance_number(obj_plantable_tree);

	for (var i = 0; i < n; i ++){
		var inst = instance_find(obj_plantable_tree, i);
		trees[| i] = inst;
		trees_x[| i] = inst.x;
		trees_y[| i] = inst.y;
		curr_trees[| i] = inst.curr_tree;
	}
}

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
