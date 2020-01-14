/// @description Villy Poppy - dialogue part 2

event_inherited();

text = ds_map_create();    

/// (They visit the botanist again) — TELL

text[? "GREET"] = ["VILLY POPPY: What did you find?", ["A1", "A1_1", "GREET"]]

text[? "A1"] = ["The farmer's crops are green, healthy, and strong.", "VILLY POPPY: Really? How interesting!", ["EXIT", "GREET"]]

text[? "A1_1"] = ["The farmer's crops are brown, dry, and wilting.", "VILLY POPPY: Are you sure? You might want to check again.", ["A1", "A1_1", "GREET"]]

text[? "EXIT"] = ["Ok", []]


name = "Villy Poppy";
portrait = spr_portrait;