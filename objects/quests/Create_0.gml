/// @description Insert description here

enum quest {
	tutorial,
	erosion_investigation,
	erosion_experiment,
	erosion_case,
	hints,
	length,
}

var quest_array = [
	["tutorial", 0, 
	[enum_objective_type.tut_start, noone, noone,
	enum_objective_type.tut_find_key, noone, noone,
	enum_objective_type.ero_start, noone]],
	
	["erosion_investigation", 0,
	[noone,                                  enum_objective_type.ero_weeraway0,             noone, 
	enum_objective_type.ero_poppy0,          noone,                                         enum_objective_type.ero_examine_crops0,
	enum_objective_type.ero_examine_crops1,  noone,                                         enum_objective_type.ero_poppy1, 
	enum_objective_type.ero_measure_soil0,   noone,                                         enum_objective_type.ero_poppy2,                
	enum_objective_type.ero_measure_soil1,   
	enum_objective_type.ero_poppy3,          enum_objective_type.ero_weeraway_fields_erode, noone, enum_objective_type.ero_poppy4, noone]],
	
	["erosion_experiment", -1, 
	[enum_objective_type.ero_ex_start, enum_objective_type.ero_ex_weeraway0]],
	
	["erosion_case", -1, 
	[enum_objective_type.ero_ca_start, enum_objective_type.ero_ca_cheiftain0]],
	
	["hints", 1, 
	[noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone]]
]

quests_grid = scr_create_ds_grid_from_array(quest_array);
quests_grid_n = ds_grid_height(quests_grid);

update = false;

update_map = ds_map_create();
var i = 0; repeat(quest.length) {
	update_map[? i] = true;
	i++;
}