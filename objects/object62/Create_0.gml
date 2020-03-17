/// @description Villy
 
event_inherited();

text = ds_map_create();    

text[? "GREET"] = ["What's going on?", "We're doomed, " + game.name + "! The people of this town are starving!", ["A1", "A1_1", "A1_2", "GREET"], [polka, id]]

text[? "A1"] = ["Why are you starving?", "The farmers aren't giving enough food.", ["A2", "A2_1", "A2_2", "GREET"], [polka, id]]

text[? "A1_1"] = ["Why aren't you at work?", "I need my food if I have to work. I'm a baker at the bazaar. I can't live off of just bread and cupcakes!", ["A1", "A1_1", "A1_2", "GREET"], [polka, id]]

text[? "A1_2"] = ["How long have you been starving for?", "For the past few days!", ["A1", "A1_1", "A1_2", "GREET"], [polka, id]]

text[? "A2"] = ["Why aren't the farmers giving enough food?", "I don't know, you'd have to ask farmer Villy Nilly Weera-vay.", ["EXIT", "GREET"], [polka, id]]

text[? "A2_1"] = ["What food do the farmers give?", "Vegetables! Lots and lots of vegetables! Corn, carrots, potatoes, squash, peas... uh, what else... oh, yeah! -beans, turnips, and the like.", ["A2", "A2_1", "A2_2", "GREET"], [polka, id]]

text[? "A2_2"] = ["There's nothing else to eat?", "The food prices have shot up like a rocket these last few weeks. But now we don't even have vegetables! All I have are fish, bread, and stale cupcakes.", ["A2", "A2_1", "A2_2", "GREET"], [polka, id]]

text[? "EXIT"] = ["Ok", [], []]

name = "Villy";
portrait = spr_portrait_villy_green;

scripts = [];

draw = false;

counter = 0;
blink_freq = 50;