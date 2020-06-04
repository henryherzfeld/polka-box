/// @description Insert description here

roll_max = 3;

facts = ds_list_create();
locations = ds_map_create();

//erosion_village
locations[? erosion_village] = [[314, 523], [631, 686], [338, 729], [545, 1347], [1354, 940], [1431, 580]];
scr_list_add_question(facts, enum_question_type.multi, "What color is the sky?", ["Blue", "Not blue", "Purple!"], 0, noone);
scr_list_add_question(facts, enum_question_type.multi, "What is the answer to life", ["2", "42", "1"], 1, noone);
scr_list_add_question(facts, enum_question_type.multi, "What color is the sky?", ["Blue", "Not blue", "Purple!"], 0, noone);
scr_list_add_question(facts, enum_question_type.multi, "What is the answer to life", ["2", "42", "1"], 1, noone);
scr_list_add_question(facts, enum_question_type.multi, "What color is the sky?", ["Blue", "Not blue", "Purple!"], 0, noone);
scr_list_add_question(facts, enum_question_type.multi, "What is the answer to life", ["2", "42", "1"], 1, noone);