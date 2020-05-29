/// @description Insert description here

event_inherited();

text[? "GREET"] = ["Howdy There!", ["A1", "EXIT"], [id]];
text[? "A1"] = ["Oh, Hello!", "How can I help you?", ["B1", "B2"], [polka, id]];
text[? "B1"] = ["What is this place?", "Oh yes this is the Bazaar, we sell things here.", ["B1", "B2", "C1", "EXIT"], [polka, id]];
text[? "B2"] = ["Who are you?", "I'm Villy Jeff from Sales.", ["B1", "B2", "C1", "EXIT"], [polka, id]];
text[? "C1"] = ["Can I buy something?", "Unfortunately no, you may not. We are closed at the moment." ,["B1", "B2", "C1", "EXIT", "EXIT"], [polka, id]]
text[? "EXIT"] = ["Oh, alright then. Goodbye.", "Take care!", [], [polka, id]];


portrait = spr_portrait_villy_green;