/// @description Insert description here

if(!ds_list_empty(villies)){
	show_debug_message(instance_find(villies[| 0], 1));
	if(instance_find(villies[| 0], 0) != noone){
		show_debug_message("here");
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