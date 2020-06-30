/// @description Insert description here

enum quest {
	erosion_investigation,
	test2,
	length,
}
var quest_array = [
	["erosion_investigation", 0, 
	[enum_objective_type.ero_start, enum_objective_type.ero_weeraway0, enum_objective_type.ero_poppy0,
	enum_objective_type.ero_examine_crops0, enum_objective_type.ero_poppy1, enum_objective_type.ero_measure_soil0, 
	enum_objective_type.ero_poppy2]],
	["Test2", 0, ["Testing AA", "Testing BB"]],
]

quests_grid = scr_create_ds_grid_from_array(quest_array);
quests_grid_n = ds_grid_height(quests_grid);

register_events = true;

update_map = ds_map_create();
var i = 0; repeat(quest.length) {
	update_map[? i] = true;
	i++;
}