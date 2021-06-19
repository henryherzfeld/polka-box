/// @description Insert description here

if !ds_list_empty(trees) {
	if room == second_village_planting {
		for (var i = 0; i < ds_list_size(trees); i++){
			var tree = trees[| i];
			tree.curr_tree = curr_trees[| i];
		}
	} else if room == second_village {
		for (var i = 0; i < ds_list_size(trees); i++){
			var tree = instance_create_layer(trees_x[| i], trees_y[| i], "plantable_tree", obj_plantable_tree);
			tree.curr_tree = curr_trees[| i];
		}
	}
}
exit;

if(!ds_list_empty(villies)){
	if(instance_find(villies[| 0], 0) != noone){
		var i;
		for (i = 0; i < ds_list_size(villies); i += 1){
			var villy = villies[| i];
			villy.xx = x_coords[| i];
			villy.yy = y_coords[| i];
			villy.x = x_coords[| i];
			villy.y = y_coords[| i];
		}
	}
}