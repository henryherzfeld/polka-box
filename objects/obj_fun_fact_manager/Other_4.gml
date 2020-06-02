/// @description Insert description here

var n_facts = ds_list_size(facts);
var roll = min(irandom_range(1, roll_max), n_facts);
var rolled_facts = [];
var rolled_locations = [];

var visited = [];

for(var i = 0; i < roll; i++){
	
	var in_visited = true;
	while in_visited {
		in_visited = false;
		var sample = irandom_range(0, n_facts-1);
		
		var n_visited = array_length_1d(visited);
		for(var j = 0; j < n_visited; j++){
			if sample == visited[j] {
				in_visited = true;
			}
		}
	}
	
	visited[i] = sample;
	
	// building questions
	show_debug_message(room);
	if ds_map_exists(locations, room) {
		var location = locations[? room];
		var coords = location[sample];
		var inst = instance_create_layer(coords[0], coords[1], "Menus", obj_fun_fact);
		var question_list = ds_list_create();
		question_list[| 0] = facts[| sample];
		inst.question = question_list;
	}
}

show_debug_message(visited);