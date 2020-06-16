/// @description Insert description here

enum quest {
	test1,
	test2,
}
var quest_array = [
	["Test1", 0, ["Testing A", "Testing B"]],
	["Test2", 0, ["Testing AA", "Testing BB"]],
]

quests_grid = scr_create_ds_grid_from_array(quest_array);
quests_grid_n = ds_grid_height(quests_grid);