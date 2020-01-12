text = ds_map_create();    

text[? "GREET"] = ["What's going on?", "The people of this town are starving!", ["A1", "A1_1", "A1_2", "GREET"]]
text[? "A1"] = ["Why are you starving?", "The farmers aren't giving enough food.", ["A1_1", "A1_2", "A2", "GREET"]]
text[? "A1_1"] = ["Who are you?", "I'm a baker at the bazaar. I need my food if I have to work. I can't live off of just bread and cupcakes!", ["A1_2", "A2", "GREET"]]
text[? "A1_2"] = ["How long have you been starving for?", "For the past few days!", ["A1_1", "A2", "GREET"]]
text[? "A2"] = ["Why aren't the farmers giving enough food?", "I don't know, you'd have to ask farmer Villy Nilly Weera-vay.", ["EXIT", "GREET"]]
text[? "A2_1"] = ["What food do the farmers give?", "Vegetables! Lots and lots of vegetables! Corn, carrots, potatoes, squash, peas... uh, what else... oh, yeah! -beans, turnips, and the like.", ["A2_2", "GREET"]]
text[? "A2_2"] = ["There's nothing else to eat?", "The food prices have shot up like a rocket these last few weeks. But now we don't even have vegetables! All I have are fish, bread, and stale cupcakes.", ["A2_1", "GREET"]]

text[? "EXIT"] = ["Bye Bye", []]


scene_info = [
	[scr_cutscene_change_variable, polka, "move_override", true],
	[scr_cutscene_wait, 2],
	[scr_cutscene_move_character, polka, 288, 196, false, 1],
	[scr_cutscene_wait, 2],
	[scr_cutscene_create_dialogue, text, -1],
	[scr_cutscene_wait, 2.5],
	[scr_cutscene_move_character, polka, 40, 50, true, .75],
	[scr_cutscene_wait, 1],
	[scr_cutscene_change_variable, polka, "move_override", false]
];