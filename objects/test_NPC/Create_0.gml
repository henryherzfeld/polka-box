/// @description Insert description here

event_inherited();

text = ds_map_create();
text[? "GREET"] = ["Hi Polka!", "How is it going?", "Do you want to ask me something yo?", ["A1_1", "A1_2", "EXIT", "GREET"]];
text[? "A1_1"] = ["I am asking you something!", "I am responding to ya bruh", ["A1_2", "EXIT", "GREET"]];
text[? "A1_2"] = ["I like cheerios", "so do I my good sir", ["A1_1", "EXIT", "GREET"]]
text[? "EXIT"] = ["See ya, punk...", []]