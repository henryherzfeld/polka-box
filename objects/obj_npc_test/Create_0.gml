/// @description Insert description here

event_inherited();


questions = ds_list_create();
scr_list_add_question(questions, enum_question_type.evidence, noone, noone, enum_evi_type.evidence2);
scr_list_add_question_response(questions, ["right! you're so awesome and funny"], ["wrong idiot"]);

scr_list_add_question(questions, enum_question_type.evidence_multi, "Prompt evi_multi", ["Righttttt ttttttt ttttttt", "Wronggggggggg gggggg gggggggggg", "Wronggggggggg gggggggg ggggggggggg"], [enum_evi_type.evidence2, 0]);
scr_list_add_question_response(questions, ["right! you're so awesome and funny"], ["wrong idiot"]);
scr_list_add_question_sprite(questions, spr_soil_moisture_table);

scr_list_add_question(questions, enum_question_type.multi, "QUESTION PROMPT", ["Right", "Wrong", "Wrong",], 0);
scr_list_add_question_response(questions, ["Correct!!!!!"], noone);

scr_list_add_question(questions, enum_question_type.evidence_checkbox, "Prompt evi_checkbox", ["Right", "Wrong", "Right", "Right"], [enum_evi_type.evidence2, [0,2,3]]);

scr_list_add_question(questions, enum_question_type.checkbox, "Prompt checkbox", ["Right", "Wrong", "Right", "Right"], [0, 2, 3]);
scr_list_add_question_response(questions, ["right! you're so awesome and funny"], ["wrong idiot"]);

/*
questions[| 0] = [enum_question_type.evidence, enum_evi_type.evidence2, [["right! you're so awesome and funny"], ["wrong idiot"]]];

questions[| 1] = [enum_question_type.evidence_multi, ["Prompt evi_multi", spr_soil_moisture_table], ["Righttttt ttttttt ttttttt", "Wronggggggggg gggggg gggggggggg", "Wronggggggggg gggggggg ggggggggggg"], [enum_evi_type.evidence2, 0], [["right! you're so awesome and funny"], ["wrong idiot"]]];

questions[| 2] = [enum_question_type.multi, "QUESTION PROMPT", ["Right", "Wrong", "Wrong",], 0, [["Correct!!!!!"]]];

questions[| 3] = [enum_question_type.evidence_checkbox, "Prompt evi_checkbox", ["Right", "Wrong", "Right", "Right"], [enum_evi_type.evidence2, [0,2,3]], []];

questions[| 4] = [enum_question_type.checkbox, "Prompt checkbox", ["Right", "Wrong", "Right", "Right"], [0, 2, 3], [["right! you're so awesome and funny"], ["wrong idiot"]]];
*/

text = ds_map_create();
text[? "GREET"] =	[[" Hey and hello...... it is me an npc and let me tell you I'm ready for the quiz!........ I'm ready for the quiz! I'm ready for the quiz! ", 
					["COLOR", c_black, 1, 4], ["COLOR", c_red, 10, 14], ["COLOR", c_orange, 15, 15], ["COLOR", c_yellow, 16, 16], ["COLOR", c_green, 17, 17], ["COLOR", c_blue, 18, 18], ["COLOR", c_purple, 19, 19]], 
					"Okay here goes sucka",
					["Good job on the quiz!", ["QUIZ", questions, id], ["COLOR", c_black, 1, 4]], 
//					"Good job on the quiz!", 
					"Thanks", "Anything Else?", ["A1", "EXIT", "EXIT"], [polka, id, id, polka, id]]

text[? "A1"] = ["Can I do another quiz?", "Me", "You", ["GREET", "EXIT", "EXIT"], [polka, id, polka, id]]
text[? "EXIT"] = ["Bye Bye", [], [polka]]

name = "Villy";
portrait = spr_portrait;
scripts = [
	[scr_change_variable, game.id, "find_weeravay", true],
]