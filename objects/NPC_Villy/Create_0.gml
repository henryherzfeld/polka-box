/// @description Insert description here

event_inherited();

text = ds_map_create();    

text[? "greet"] = ["What's going on?", "The people of this town are starving!", ["A1", "A1_1", "A1_2", "greet"]]
text[? "A1"] = ["Why are you starving?", "The farmers aren't giving enough food.", ["A1_1", "A1_2", "A2", "greet"]]
text[? "A1_1"] = ["Who are you?", "I'm a baker at the bazaar. I need my food if I have to work. I can't live off of just bread and cupcakes!", ["A1_2", "A2", "greet"]]
text[? "A1_2"] = ["How long have you been starving for?", "For the past few days!", ["A1_1", "A2", "greet"]]
text[? "A2"] = ["Why aren't the farmers giving enough food?", "I don't know, you'd have to ask farmer Villy Nilly Weera-vay.", ["EXIT", "greet"]]
text[? "A2_1"] = ["What food do the farmers give?", "Vegetables! Lots and lots of vegetables! Corn, carrots, potatoes, squash, peas... uh, what else... oh, yeah! -beans, turnips, and the like.", ["A2_2", "greet"]]
text[? "A2_2"] = ["There's nothing else to eat?", "The food prices have shot up like a rocket these last few weeks. But now we don't even have vegetables! All I have are fish, bread, and stale cupcakes.", ["A2_1", "greet"]]

text[? "EXIT"] = ["Bye Bye", []]

name = "Villy";
portrait = spr_portrait;
scripts = [
	[scr_change_variable, game.id, "find_weeravay", true],
]