/// @description Insert description here

event_inherited();

text = ds_map_create();    
/*
text[? "GREET"] = ["What's going on?", "The people of this town are starving!", ["A1", "A1_1", "A1_2", "GREET"]]
text[? "A1"] = ["Why are you starving?", "The farmers aren't giving enough food.", ["A1_1", "A1_2", "A2", "GREET"]]
text[? "A1_1"] = ["Who are you?", "I'm a baker at the bazaar. I need my food if I have to work. I can't live off of just bread and cupcakes!", ["A1_2", "A2", "GREET"]]
text[? "A1_2"] = ["How long have you been starving for?", "For the past few days!", ["A1_1", "A2", "GREET"]]
text[? "A2"] = ["Why aren't the farmers giving enough food?", "I don't know, you'd have to ask farmer Villy Nilly Weera-vay.", ["EXIT", "GREET"]]
text[? "A2_1"] = ["What food do the farmers give?", "Vegetables! Lots and lots of vegetables! Corn, carrots, potatoes, squash, peas... uh, what else... oh, yeah! -beans, turnips, and the like.", ["A2_2", "GREET"]]
text[? "A2_2"] = ["There's nothing else to eat?", "The food prices have shot up like a rocket these last few weeks. But now we don't even have vegetables! All I have are fish, bread, and stale cupcakes.", ["A2_1", "GREET"]]

text[? "EXIT"] = ["Bye Bye", []]
*/

questions = ds_list_create();
questions[| 0] = [enum_question_type.evidence, enum_evi_type.evidence2, [["right! you're so awesome and funny"], ["wrong idiot", "how could you be so stupid?", "youve failed us"]]];
questions[| 1] = [enum_question_type.multi, "Prompt multi", ["Right", "Wrong", "Wrong"], 0, [["Correct!!!!!"]]];
questions[| 2] = [enum_question_type.checkbox, "Prompt checkbox", ["Right", "Wrong", "Right", "Right"], [0, 2, 3], []];

text[? "GREET"] =	["Hey I'm ready for the quiz!", "Okay here goes sucka",
					["Good job on the quiz!", ["QUIZ", questions, id]], 
					"Thanks", "Anything Else?", ["A1", "EXIT", "EXIT"], [polka, id, id, polka, id]]


text[? "A1"] = ["Can I do another quiz?", "You", "Me", "You", ["GREET", "EXIT", "EXIT"], [polka, id, polka, id]]
text[? "EXIT"] = ["Bye Bye", [], [polka]]



name = "Villy";
portrait = spr_portrait;
scripts = [
	[scr_change_variable, game.id, "find_weeravay", true],
]