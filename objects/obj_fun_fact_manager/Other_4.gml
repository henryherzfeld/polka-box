/// @description Insert description here

var n_facts = ds_list_size(facts);
var roll = min(irandom_range(1, roll_max), n_facts);
var rolled_facts = [];
var rolled_locations = [];

var visited_qs = [];
var visited_locs = [];

if ds_map_exists(locations, room) {
	var location = locations[? room];
	var n_locs = array_length_1d(location);
	
	for(var i = 0; i < roll; i++){
	
		var in_visited = true;
		while in_visited {
			in_visited = false;
			var sample_q = irandom_range(0, n_facts-1);
		
			var n_visited = array_length_1d(visited_qs);
			for(var j = 0; j < n_visited; j++){
				if sample_q == visited_qs[j] {
					in_visited = true;
				}
			}
		}
	
		visited_qs[i] = sample_q;
		
		var in_visited = true;
		while in_visited {
			in_visited = false;
			
			var sample_loc = irandom_range(0, n_locs-1)
			for(var j = 0; j < array_length_1d(visited_locs); j++) {
				if sample_loc == visited_locs[j] {
					in_visited = true;
				}
			}
		}
		
		visited_locs[i] = sample_loc;
		
		var coords = location[sample_loc];
			
		var inst = instance_create_layer(coords[0], coords[1], "Menus", obj_fun_fact);
		var question_list = ds_list_create();
		question_list[| 0] = facts[| sample_q];
		inst.question = question_list;
	}
}