/// @description Insert description here
// You can write your code in this editor

// grab all still active instances, deactivate them
for(var i = 0; i < ds_list_size(trans_instances); i++) {;
	 curr_inst = trans_instances[| i];
	 instance_activate_object(curr_inst);
}