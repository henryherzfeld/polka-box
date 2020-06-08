/// @description Insert description here

event_inherited();

text = ds_map_create();

questions = ds_list_create();
questions[| 1] = [enum_question_type.evidence, enum_evi_type.evidence2, [["right! you're so awesome and funny"], ["wrong idiot"]]];
questions[| 0] = [enum_question_type.evidence_multi, ["Prompt evi_multi", spr_soil_moisture_table], ["Right", "Wrong", "Wrong"], [enum_evi_type.evidence2, 0], [["right! you're so awesome and funny"], ["wrong idiot"]]];
questions[| 2] = [enum_question_type.multi, "Prompt multi", ["Right", "Wrong", "Wrong"], 0, [["Correct!!!!!"]]];
questions[| 4] = [enum_question_type.evidence_checkbox, "Prompt evi_checkbox", ["Right", "Wrong", "Right", "Right"], [enum_evi_type.evidence2, [0,2,3]], []];
questions[| 3] = [enum_question_type.checkbox, "Prompt checkbox", ["Right", "Wrong", "Right", "Right"], [0, 2, 3], [["right! you're so awesome and funny"], ["wrong idiot"]]];

//text[? "GREET"] =	[["Hey I'm ready for the quiz!", ["COLOR", 0, 2, 4], ["COLOR", 10, 8, 10], ["COLOR", 100, 12, 14]], "Okay here goes sucka",
text[? "GREET"] =	["Hey I'm ready for the quiz!", "Okay here goes sucka",
					["Good job on the quiz!", ["QUIZ", questions, id]], 
					"Thanks", "Anything Else?", ["A1", "EXIT", "EXIT"], [polka, id, id, polka, id]]

text[? "A1"] = ["Can I do another quiz?", ["You", ["SPRITE", test_test]], "Me", ["You", ["SPRITE"]], ["GREET", "EXIT", "EXIT"], [polka, id, polka, id]]
text[? "EXIT"] = ["Bye Bye", [], [polka]]

name = "Villy";
portrait = spr_portrait;
scripts = [
	[scr_change_variable, game.id, "find_weeravay", true],
]