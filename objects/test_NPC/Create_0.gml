/// @description Insert description here

text = ds_map_create();
text[? "greet"] = ["Hi Polka!", "How is it going?", "Do you want to ask me something yo?", ["A1_1", "A1_2", "EXIT", "greet"]];
text[? "A1_1"] = ["I am asking you something!", "I am responding to ya bruh", ["A1_2", "EXIT", "greet"]];
text[? "A1_2"] = ["I like cheerios", "so do I my good sir", ["A1_1", "EXIT", "greet"]]
text[? "EXIT"] = ["See ya, punk...", []]