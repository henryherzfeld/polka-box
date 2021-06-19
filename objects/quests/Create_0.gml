/// @description Insert description here


enum quest_pb {
	// POLKA BOX
	tutorial,
	erosion_investigation,
	erosion_experiment,
	erosion_case,
	hints,
	length
}

enum quest_mtv {
	polka,
	gilly,
	length
}

var quest_pb_array = [
	["tutorial", 0, 
	[enum_objective_type.tut_start, noone, noone, 
	noone, enum_objective_type.tut_find_key, noone, noone,
	noone, noone, noone, noone, 
	noone, noone, enum_objective_type.ero_start, noone]],
	
	["erosion_investigation", 0,
	[noone,                                  enum_objective_type.ero_weeraway0,             noone, 
	enum_objective_type.ero_poppy0,          noone,                                         enum_objective_type.ero_examine_crops0,
	enum_objective_type.ero_examine_crops1,  noone,                                         enum_objective_type.ero_poppy1, 
	enum_objective_type.ero_measure_soil0,   noone,                                         enum_objective_type.ero_poppy2,                
	enum_objective_type.ero_measure_soil1,   
	enum_objective_type.ero_poppy3,          enum_objective_type.ero_weeraway_fields_erode, noone, enum_objective_type.ero_poppy4, noone, noone, noone, noone]],
	
	["erosion_experiment", -1, 
	[enum_objective_type.ero_ex_start, enum_objective_type.ero_ex_weeraway0, noone, noone, noone]],
	
	["erosion_case", -1, 
	[enum_objective_type.ero_ca_start, enum_objective_type.ero_ca_cheiftain0, enum_objective_type.ero_end]],
	
	["hints", 0, 
	[noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone]]
]

var quest_mtv_array = [
	["polka", 0,
	[noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone]],
	["gilly", 0,
	[noone, noone, noone]]
]

update = false;
update_map = ds_map_create();

if game.mode == "pb" {
	quests_grid = scr_create_ds_grid_from_array(quest_pb_array);
	var i = 0; repeat(quest_pb.length) {
	update_map[? i] = true;
	i++;
	}
} else if game.mode == "mtv" {
	quests_grid = scr_create_ds_grid_from_array(quest_mtv_array);
	var i = 0; repeat(quest_mtv.length) {
	update_map[? i] = true;
	i++;
	}
}

quests_grid_n = ds_grid_height(quests_grid);


