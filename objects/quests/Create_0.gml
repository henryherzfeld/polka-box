/// @description Insert description here

enum quest {
	test1,
	test2,
	length,
}
var quest_array = [
	["Test1", 0, [enum_objective_type.start, enum_objective_type.find_weeraway, enum_objective_type.find_poppy]],
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