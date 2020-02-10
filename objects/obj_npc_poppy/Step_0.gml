/// @description Insert description here
// You can write your code in this editor

event_inherited();

if(flags.find_poppy and !flags.examine_crops){
	text[? "GREET"] = ["Hi", ["A1", "A1_1", "A1_2", "GREET"], [polka]]

	text[? "A1"] = ["What do crops need to live?", "Plants need air, sunlight, water, and soil.", ["A2", "A2_1", "A2_2", "A2_3", "A2_4", "GREET"], [polka, id]]

	text[? "A1_1"] = ["Can you help me?", "Hi there, " + game.name + "! Good to see you. Well, I study plants, how they work, and how we can use them to improve our lives. So it really depends on what you need help with!", ["A1", "A1_1", "A1_2", "GREET"], [polka, id]]

	text[? "A1_2"] = ["What are you working on?", "I'm looking at chamomile! It's a really cool plant that looks like a daisy. I'm checking out how chamomile makes people more relaxed and calm. It can help parents that are stressed out by this whole farming problem.", ["A1", "A1_1", "A1_2", "GREET"], [polka, id]]

     
	text[? "A2"] = ["How do you know that the plants are getting enough air, sunlight, water, and soil?", "This is what a healthy plant looks like. It's green, has lots of leaves, has strong stems. It has plenty of nutrient-rich soil. Nutrients make a plant healthy. Just like people need nutrients to grow and stay healthy.", "If the plant isn't getting enough water -- it will wilt.", "The edges of the leaves turn out dry and brown. The soil will be dry. There is low soil moisture found when measuring.", "If the plant isn't getting enough light -- the stems are long and thin. They have small, yellow, few leaves.", "If there isn't enough soil, then the plant will wilt. The edges of the leaves turn out dry and brown.", ["A3", "A3_1", "A3_2", "GREET"], [polka, id, id, id, id, id]]

	text[? "A2_1"] = ["Why do plants need air?", "Plants use carbon dioxide in the air to make food for themselves.", ["A2", "A2_1", "A2_2", "A2_3", "A2_4", "GREET"], [polka, id]]

	text[? "A2_2"] = ["Why do plants need sunlight?", "Plants use sunlight to power their food-making process. This is called photosynthesis. Photosynthesis is Greek for “putting together light”. Photosynthesis is how plants get the energy they need to live.", ["A2", "A2_1", "A2_2", "A2_3", "A2_4", "GREET"], [polka, id]]

	text[? "A2_3"] = ["Why do plants need water?", "Plants need water to move nutrients inside them. A plant that lacks water lacks nutrients.", ["A2", "A2_1", "A2_2", "A2_3", "A2_4", "GREET"], [polka, id]]

	text[? "A2_4"] = ["Why do plants need soil?", "Soil has important nutrients. If there isn't enough soil, then the plant isn't getting enough nutrients.", ["A2", "A2_1", "A2_2", "A2_3", "A2_4", "GREET"], [polka, id]]


	text[? "A3"] = ["What nutrients do plants need?", "Ah, of course! Great question, " + game.name + ". Plants need nitrogen (N), phosphorous (P), and potassium (K) to grow. They're known as NPK.", ["EXIT", "GREET"], [polka, id]]

	text[? "A3_1"] = ["Why are plants green?", "Chlorophyll is a pigment that gives plants their green color. Chlorophyll absorbs the sunlight needed for plants to make food. It absorbs red and blue light. It reflects green light. That's why we see plants as green.", ["A3", "A3_1", "A3_2", "GREET"], [polka, id]]

	text[? "A3_2"] = ["Why are plant stems long and thin when they don't get sunlight?", "The stems grow thin because the plant is desperately reaching its leaves up to get more light.", ["A3", "A3_1", "A3_2", "GREET"], [polka, id]]

	text[? "EXIT"] = ["Ok", []]
	
	scripts = [
		[scr_change_variable, flags.id, "examine_crops", true],
		[scr_change_variable, flags.id, "find_poppy", false]
	]
} else if (flags.report_crops_to_poppy){

//The player TELLS Poppy about how the farmer's plants are not getting enough nutrients

text[? "GREET"] = ["What did you find?", ["A1", "A1_1", "GREET"], [id]]

text[? "A1"] = ["The farmer's crops are not getting enough nutrients.", "Really? Well, that's interesting! How did you find out?", ["A2", "A2_1", "GREET"], [polka, id]]

text[? "A1_1"] = ["The farmer's crops are getting enough nutrients.", "Are you sure? You might want to check again.", ["A1", "A1_1", "GREET"], [polka, id]]

text[? "A2"] = ["Their leaves look dry, brown, and wilted.", "Good work.", ["EXIT", "GREET"], [polka, id]]

text[? "A2_1"] = ["The farmer's crops are green, healthy, and strong.", "Are you sure? You might want to check again.", ["A2", "A2_1", "GREET"], [polka, id]]

text[? "EXIT"] = ["Thanks", []]
	
	scripts = [
	[scr_change_variable, flags.id, "prompt_measure_soil_moisture", true],
	[scr_change_variable, flags.id, "report_crops_to_poppy", false]
	]
	
} else if (flags.prompt_measure_soil_moisture){
	

/// (They visit the botanist again) — TELL: The farmer's crops are not getting enough nutrients. Their leaves look dry, brown, and wilted 
	text[? "GREET"] = ["The plants are getting enough air and sunlight. The sun has been bright. The air is plenty. Perhaps they're not getting enough water? You can tell from the soil moisture is a plant is getting enough.", ["A1", "A1_1", "A1_2", "GREET"], [id]]

	text[? "A1"] = ["What level of soil moisture is good for plants?", "Plants grow best when our soil moisture is 50 to 60 kpa.", ["EXIT", "GREET"], [polka, id]]

	text[? "A1_1"] = ["How do plants get water from the soil?", "The plant roots absorb the water in the soil. Plants have xylem, which are like tubes. They move water and nutrients in the soil from the roots and up the plants.", ["A1", "A1_1", "A1_2", "GREET"], [polka, id]]

	text[? "A1_2"] = ["How do you measure soil moisture?", "For measuring soil moisture, you would have to use a tool. I might have one lying around that could help.", ["A1", "A1_1", "A1_2", "GREET"], [polka, id]]

	text[? "EXIT"] = ["Ok", []]
	
	scripts = [
	[scr_change_variable, flags.id, "measure_soil_moisture", true],
	[scr_change_variable, flags.id, "prompt_measure_soil_moisture", false]
	]
}