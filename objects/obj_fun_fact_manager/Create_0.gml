/// @description Insert description here

roll_max = 3;

locations = ds_map_create();
locations[? erosion_village] = [[314, 523], [631, 686], [338, 729], [545, 1347], [1354, 940], [1431, 580]];
locations[? erosion_forest] = [[355, 972], [500, 715], [1078, 1105], [1200, 888], [1451, 229], [1459, 676]];

facts = ds_list_create();
scr_quiz_list(facts);
scr_quiz_question(enum_question_type.multi, "There are more microorganisms in a handful of soil than there are people on earth.", ["True", "False"], 0);

scr_quiz_question(enum_question_type.multi, "It takes how many years to produce just under an inch of topsoil?", ["10", "100", "500", "1000"], 2);

scr_quiz_question(enum_question_type.multi, "How much of the Earth is covered in water?", ["90%", "85%", "97%", "99%"], 2);

scr_quiz_question(enum_question_type.multi, "How long does it take for light to reach the Earth from the Sun?", ["8 seconds", "8 minutes", "8 hours"], 1);

scr_quiz_question(enum_question_type.multi, "How much of the earth's oxygen is made by the Amazon Rainforest?", ["5%", "10%", "20%"], 2);

scr_quiz_question(enum_question_type.multi, "About how many more bones do babies have than adults?", ["10", "100", "200"], 1);

scr_quiz_question(enum_question_type.multi, "A teaspoonful of neutron star would weigh roughly how much?", ["1 million tons", "6 million tons", "6 billion tons", "10 billion tons"], 2);

scr_quiz_question(enum_question_type.multi, "What is the hottest planet in our solar system?", ["Venus", "Pluto", "Mercury", "Earth"], 0);

scr_quiz_question(enum_question_type.multi, "A clock runs ____ on a mountain than at sea level", ["Slower", "Faster", "No different"], 1);

scr_quiz_question(enum_question_type.multi, "About how many of the cells in your body can fit on the head of a pin?", ["10,000 cells", "100,000 cells", "1,000,000 cells"], 0);

scr_quiz_question(enum_question_type.multi, "Earth is about how many years old?", ["1 Billion", "5 Billion", "10 Billion", "100 Billion"], 1);

scr_quiz_question(enum_question_type.checkbox, "Which of the following is hotter than the sun?", ["Molten steel", "Lava", "Lightning"], [2]);
