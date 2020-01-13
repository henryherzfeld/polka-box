   /// @description Villy Poppy - dialogue part 1

event_inherited();

text = ds_map_create();    

if(game.find_poppy and !game.examine_crops){
	text[? "GREET"] = ["Hi", ["A1", "A1_1", "A1_2", "GREET"]]

	text[? "A1"] = ["What do crops need to live?", "VILLY POPPY: Plants need air, sunlight, water, and soil.", ["A2", "A2_1", "A2_2", "A2_3", "A2_4", "GREET"]]

	text[? "A1_1"] = ["Who are you?", "VILLY POPPY: Hi, there! Good to see you. I’m Villy Poppy! I study plants, how they work, and how we can use them to improve our lives.", ["A1", "A1_1", "A1_2", "GREET"]]

	text[? "A1_2"] = ["What are you working on?", "VILLY POPPY: I’m looking at chamomile! It’s a really cool plant that looks like a daisy. I’m checking out how chamomile makes people more relaxed and calm. It can help parents that are stressed out by this whole farming problem.", ["A1", "A1_1", "A1_2", "GREET"]]

     
	text[? "A2"] = ["How do you know that the plants are getting enough air, sunlight, water, and soil?", "VILLY POPPY: This is what a healthy plant looks like. It’s green, has lots of leaves, has strong stems. It has plenty of nutrient-rich soil. Nutrients make a plant healthy. Just like people need nutrients to grow and stay healthy.      If the plant isn’t getting enough water — it will wilt.", "VILLY POPPY: The edges of the leaves turn out dry and brown. The soil will be dry. There is low soil moisture found when measuring.    If the plant isn’t getting enough light — the stems are long and thin. They have small, yellow, few leaves.    If there isn’t enough soil, then the plant will wilt. The edges of the leaves turn out dry and brown.", ["A3", "A3_1", "A3_2", "GREET"]]

	text[? "A2_1"] = ["Why do plants need air?", "VILLY POPPY: Plants use carbon dioxide in the air to make food for themselves.", ["A2", "A2_1", "A2_2", "A2_3", "A2_4", "GREET"]]

	text[? "A2_2"] = ["Why do plants need sunlight?", "VILLY POPPY: Plants use sunlight to power their food-making process. This is called photosynthesis. Photosynthesis is Greek for “putting together light”. Photosynthesis is how plants get the energy they need to live.", ["A2", "A2_1", "A2_2", "A2_3", "A2_4", "GREET"]]

	text[? "A2_3"] = ["Why do plants need water?", "VILLY POPPY: Plants need water to move nutrients inside them. A plant that lacks water lacks nutrients.", ["A2", "A2_1", "A2_2", "A2_3", "A2_4", "GREET"]]

	text[? "A2_4"] = ["Why do plants need soil?", "VILLY POPPY: Soil has important nutrients. If there isn’t enough soil, then the plant isn’t getting enough nutrients.", ["A2", "A2_1", "A2_2", "A2_3", "A2_4", "GREET"]]


	text[? "A3"] = ["What nutrients do plants need?", "VILLY POPPY: Ah, of course! Great question. Plants need nitrogen (N), phosphorous (P), and potassium (K) to grow. They're known as NPK.", ["EXIT", "GREET"]]

	text[? "A3_1"] = ["Why are plants green?", "VILLY POPPY: Chlorophyll is a pigment that gives plants their green color. Chlorophyll absorbs the sunlight needed for plants to make food. It absorbs red and blue light. It reflects green light. That’s why we see plants as green.", ["A3", "A3_1", "A3_2", "GREET"]]

	text[? "A3_2"] = ["Why are plant stems long and thin when they don’t get sunlight?", "VILLY POPPY: The stems grow thin because the plant is desperately reaching its leaves up to get more light.", ["A3", "A3_1", "A3_2", "GREET"]]

	text[? "EXIT"] = ["Ok", []]
	
	scripts = [
		[scr_change_variable, obj_cutscene.id, "active", true],
		[scr_change_variable, game.id, "examine_crops", true],
		[scr_change_variable, game.id, "find_poppy", false]
	]
} else if (game.report_crops_to_poppy){
/// (They visit the botanist again) — TELL: The farmer’s crops are not getting enough nutrients. Their leaves look dry, brown, and wilted 
	text[? "GREET"] = ["VILLY POPPY: The plants are getting enough air and sunlight. The sun has been bright. The air is plenty. Perhaps they're not getting enough water? You can tell from the soil moisture is a plant is getting enough.", ["A1", "A1_1", "A1_2", "GREET"]]

	text[? "A1"] = ["What level of soil moisture is good for plants?", "VILLY POPPY: Plants grow best when our soil moisture is 50 to 60 kpa.", ["EXIT", "GREET"]]

	text[? "A1_1"] = ["How do plants get water from the soil?", "VILLY POPPY: The plant roots absorb the water in the soil. Plants have xylem, which are like tubes. They move water and nutrients in the soil from the roots and up the plants.", ["A1", "A1_1", "A1_2", "GREET"]]

	text[? "A1_2"] = ["How do you measure soil moisture?", "VILLY POPPY: For measuring soil moisture, you would have to use a tool. I might have one lying around that could help.", ["A1", "A1_1", "A1_2", "GREET"]]

	text[? "EXIT"] = ["Ok", []]
	
	scripts = [
	[scr_change_variable, game.id, "measure_soil_moisture", true],
	[scr_change_variable, game.id, "report_crops_to_poppy", false]
	]
} else{
	text[? "GREET"] = ["Hi", "VILLY POPPY: Go away!", ["EXIT", "GREET"]]
	text[? "EXIT"] = ["Hm, okay.", []]	
}
name = "Villy Poppy";
portrait = spr_portrait;