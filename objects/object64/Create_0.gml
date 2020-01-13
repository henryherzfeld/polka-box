/// @description Villy Poppy - dialogue part 2

event_inherited();

text = ds_map_create();    

/// (They visit the botanist again) — TELL: The farmer’s crops are not getting enough nutrients. Their leaves look dry, brown, and wilted

text[? "GREET"] = ["VILLY POPPY: The plants are getting enough air and sunlight. The sun has been bright. The air is plenty. Perhaps they're not getting enough water? You can tell from the soil moisture is a plant is getting enough.", ["A1", "A1_1", "A1_2", "GREET"]]

text[? "A1"] = ["What level of soil moisture is good for plants?", "VILLY POPPY: Plants grow best when our soil moisture is 50 to 60 kpa.", ["EXIT", "GREET"]]

text[? "A1_1"] = ["How do plants get water from the soil?", "VILLY POPPY: The plant roots absorb the water in the soil. Plants have xylem, which are like tubes. They move water and nutrients in the soil from the roots and up the plants.", ["A1", "A1_1", "A1_2", "GREET"]]

text[? "A1_2"] = ["How do you measure soil moisture?", "VILLY POPPY: For measuring soil moisture, you would have to use a tool. I might have one lying around that could help.", ["A1", "A1_1", "A1_2", "GREET"]]


text[? "EXIT"] = ["Ok", []]

/*
(They get the tensiometer from the tool chest.)  
(They visit the farm. The tensiometer should only work in a crop tile or a soil tile) 
(They measure the soil moisture levels in the farmer’s crop field) 
(They find soil moisture levels of 50 - 60 kpa.)
*/

name = "Villy Poppy";
portrait = spr_portrait;