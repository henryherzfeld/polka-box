////@description scr_dialogue_poppy

text0 = ds_map_create();    

text0[? "GREET"] = ["Hi", "Hey " + game.name + ", I'm a little busy right now.", ["EXIT", "GREET"], [polka, obj_npc_poppy]]
text0[? "EXIT"] = ["Oh, okay.", [], [polka]]	

text1 = ds_map_create();

//Dialogue Segment (A) 
scr_dia_segment(text1, "GREET");
scr_dia_line("Hello!", polka);
scr_dia_options("A1", "A2", "A3", "FILLER"); 

scr_dia_segment(text1, "A1");
scr_dia_line("What do crops need to live?", polka);
scr_dia_line("Crops and plants need AIR, SUNLIGHT, WATER, and SOIL.", obj_npc_poppy);
scr_dia_line_sprite(spr_air_sunlight_water_soil);
scr_dia_options("B1", "B2", "B3", "FILLER"); 

scr_dia_segment(text1, "A2");
scr_dia_line("Can you help me?", polka);
scr_dia_line("Hi there, " +game.name + "!", obj_npc_poppy);
scr_dia_line("It's SO good to see you.", obj_npc_poppy);
scr_dia_line("Well, I study plants, how they work, and how we can use them to improve our lives.", obj_npc_poppy);
scr_dia_line("So it really depends on what you need help with!", obj_npc_poppy);
scr_dia_options("A1", "A2", "A3", "FILLER"); 

scr_dia_segment(text1, "A3");
scr_dia_line("What are you working on?", polka);
scr_dia_line("I'm looking at chamomile!", obj_npc_poppy);
scr_dia_line("It's a really cool plant that looks like a daisy.", obj_npc_poppy);
scr_dia_line("I'm checking out how chamomile makes people more relaxed and calm.", obj_npc_poppy);
scr_dia_line("It can help parents that are stressed out by this whole farming problem!", obj_npc_poppy);
scr_dia_options("A1", "A2", "A3", "FILLER"); 

//Dialogue Segment (B)
scr_dia_segment(text1, "B1");
scr_dia_line("How do you know that the plants are getting enough air, sunlight, water, and soil?", polka);
scr_dia_line("This is what a HEALTHY plant looks like.", obj_npc_poppy);
scr_dia_line_sprite(spr_healthy_plant); 

scr_dia_line("It's green, has lots of leaves, has strong stems.", obj_npc_poppy);

scr_dia_line("It has plenty of nutrient-rich soil.", obj_npc_poppy);

scr_dia_line("Nutrients make a plant healthy.", obj_npc_poppy);

scr_dia_line("Just like people need nutrients to grow and stay healthy.", obj_npc_poppy);


scr_dia_line("If the plant isn't getting enough WATER - it will wilt.", obj_npc_poppy);
scr_dia_line_sprite(spr_healthy_plant); 
scr_dia_line_sprite(spr_dying_plant);

scr_dia_line("The edges of the leaves turn out dry and brown.", obj_npc_poppy);

scr_dia_line("The soil will be dry.", obj_npc_poppy);

scr_dia_line("There is low soil moisture found when measuring.", obj_npc_poppy);


scr_dia_line("If the plant isn't getting enough LIGHT - the stems are long and thin.", obj_npc_poppy);
scr_dia_line_sprite(spr_dying_plant);
scr_dia_line_sprite(spr_plant_less_sunlight);

scr_dia_line("They have small, yellow leaves.", obj_npc_poppy);

scr_dia_line("The stems grow thin because the plant is desperately reaching its leaves up to get more light.", obj_npc_poppy);

scr_dia_line("If there isn't enough SOIL, then the plant will wilt.", obj_npc_poppy);
scr_dia_line_sprite(spr_plant_less_sunlight);
scr_dia_line_sprite(spr_dying_plant);

scr_dia_line("The edges of the leaves turn out dry and brown.", obj_npc_poppy);

scr_dia_options("EXIT", "FILLER");

scr_dia_segment(text1, "B2");
scr_dia_line("Why do plants need water?", polka);
scr_dia_line("Plants use water to bring nutrients up from the roots into their leaves", obj_npc_poppy);
scr_dia_line_sprite(spr_water_going_up_plant);
scr_dia_options("B1", "B2", "B3", "FILLER");

scr_dia_segment(text1, "B3");
scr_dia_line("Why do plants need sunlight?", polka);
scr_dia_line("Plants use sunlight to power their food-making process.", obj_npc_poppy);
scr_dia_line_sprite(spr_air_sunlight_water_soil);

scr_dia_line("This is called photosynthesis.", obj_npc_poppy);
scr_dia_line("Photosynthesis is Greek for 'putting together light'.", obj_npc_poppy);
scr_dia_line("It's how plants get the energy they need to live.", obj_npc_poppy);

scr_dia_options("B1", "B2", "B3", "FILLER");

scr_dia_segment(text1, "EXIT");
scr_dia_line("Thanks!", polka);


text2 = ds_map_create();

scr_dia_segment(text2, "GREET");
scr_dia_line("So what did you find?", obj_npc_poppy); 

scr_dia_line("The plants ARE getting enough air and sunlight. The sun has been bright.", obj_npc_poppy);
//CROPS APPEARANCE QUIZ QUESTIONS
crops_appearance_quiz = ds_list_create();
scr_quiz_list(crops_appearance_quiz);

scr_quiz_question(enum_question_type.multi, 
"The farmer's crops ____ getting enough nutrients.", 
["Are", "Are not"], 
1);
scr_quiz_question_response("Really? How did you find out?", "You almost got it! Try again");

scr_quiz_question(enum_question_type.evidence_checkbox, 
"Their leaves look",
["Dry", "Brown", "Wilting", "Strong", "Green"],
[enum_evi_type.photo_crop ,[0,1,2]]); 
//RESERVED EVIDENCE 2 FOR CROP APPEARANCE PHOTO EVIDENCE (spr_crop_appearance_fields_photo_evidence)
scr_quiz_question_response("The plants ARE getting enough air and sunlight. The sun has been bright.", noone);
scr_quiz_question_sprite(spr_checkbox_info_2); 
//END OF CROPS APPEARANCE QUIZ QUESTIONS

scr_dia_line_quiz(crops_appearance_quiz, obj_npc_poppy); 
//QUIZ WHERE THEY HAVE TO ATTACH PHOTO EVIDENCE ABOUT HOW THE CROPS LOOKS

scr_dia_line("The air is plenty.", obj_npc_poppy);
scr_dia_line_sprite(spr_water_drop);

scr_dia_line("Perhaps they're not getting enough water?", obj_npc_poppy);

scr_dia_line("You can tell from the soil moisture if a plant is getting enough.", obj_npc_poppy);
scr_dia_line_sprite(spr_water_drop);

scr_dia_line("Plants grow best when our soil moisture is 50 to 60 kPa.", obj_npc_poppy);
scr_dia_line("For measuring soil moisture, you would have to use a tool.", obj_npc_poppy);
scr_dia_line("I might have one lying around that could help.", obj_npc_poppy);
scr_dia_line("Let's check the tool chest!", obj_npc_poppy);

//ADD "PRESS THE SPACEBAR" ANIMATION FOR OPENING THE CHEST WHEN PLAYER APPROACHES CHEST

scr_dia_options("EXIT", "FILLER");

scr_dia_segment(text2, "EXIT");
scr_dia_line("Sounds good", polka);


text3 = ds_map_create();

scr_dia_segment(text3, "GREET");
scr_dia_line("So what did you find out?", obj_npc_poppy); 

//SOIL MOISTURE QUIZ QUESTIONS
soil_moisture_quiz = ds_list_create();
scr_quiz_list(soil_moisture_quiz);

scr_quiz_question(enum_question_type.multi, 
"The farmer's crops ____ getting enough water.", 
["Are", "Are not"], 
0);
scr_quiz_question_response("How did you find out?", "You almost got it! Try again");

scr_quiz_question(enum_question_type.evidence_multi, 
"The soil moisture levels are between",
["20-40 kpa", "50-60 kpa", "70-80 kpa"],
[enum_evi_type.soil_moisture_tbl, 1]); 
//RESERVED EVIDENCE 1 FOR SOIL MOISTURE TABLE EVIDENCE (spr_soil_moisture_table_evidence)
scr_quiz_question_response("The plants ARE getting enough air and sunlight.", "You almost got it! Try again");

scr_quiz_question(enum_question_type.multi, 
"They are _____ getting enough soil to grow properly",
["likely", "likely not"],
1); 
scr_quiz_question_response("That's what I was thinking! Plants don't get enough nutrients when they don't have enough soil.", "You almost got it! Try again");

//END OF SOIL MOISTURE QUIZ QUESTIONS

scr_dia_line("That's what I was thinking! Plants don't get enough nutrients when they don't have enough soil.", obj_npc_poppy);
//QUIZ WHERE THEY HAVE TO ATTACH TABLE EVIDENCE ABOUT HOW THE SOIL MOISTURE LEVELS IN THE CROPS ARE
scr_dia_line_quiz(soil_moisture_quiz, obj_npc_poppy); 

scr_dia_line("How much soil do plants need in order to grow?", polka);
scr_dia_line("Topsoil is the top layer of soil for growing plants - like vegetables.", obj_npc_poppy);
scr_dia_line_sprite(spr_topsoil);

scr_dia_line("It holds all the nutrients that are super-important to plants.", obj_npc_poppy);
scr_dia_line_sprite(spr_topsoil);

scr_dia_line("About 8 - 10 inches of topsoil depth is good.", obj_npc_poppy);
scr_dia_line("Less than that, and a plant is likely not getting enough nutrients.", obj_npc_poppy);
 
scr_dia_line("You'll also have to find some tool that helps you measure how deep the topsoil is.", obj_npc_poppy);

scr_dia_options("EXIT", "FILLER");

scr_dia_segment(text3, "EXIT");
scr_dia_line("Thanks!", polka);

text4 = ds_map_create();

//VILLY POPPY DIALOGUE
scr_dia_segment(text4, "GREET");

//TOPSOIL DEPTH QUIZ QUESTIONS
topsoil_depth_quiz = ds_list_create();
scr_quiz_list(topsoil_depth_quiz);

scr_quiz_question(enum_question_type.multi, 
"The farmer's crops _____ getting enough topsoil.", 
["Are", "Are not"], 
1);
scr_quiz_question_response("How did you find out?", "You almost got it! Try again");

scr_quiz_question(enum_question_type.evidence_multi, 
"The soil depth levels are between",
["4-6 inches", "6-8 inches", "8-10 inches"],
[enum_evi_type.soil_depth_tbl, 0]); 
//RESERVED EVIDENCE 1 FOR TOPSOIL DEPTH LEVELS EVIDENCE (spr_topsoil_depth_evidence)
scr_quiz_question_response("Now we got something!", "You almost got it! Try again");

//END OF TOPSOIL DEPTH QUIZ QUESTIONS

scr_dia_line("Now we got something!", obj_npc_poppy);
//QUIZ WHERE THEY HAVE TO ATTACH TABLE EVIDENCE ABOUT HOW DEEP THE TOPSOIL LEVELS ARE
scr_dia_line_quiz(topsoil_depth_quiz, obj_npc_poppy); 

scr_dia_line("Why is there not enough topsoil?", polka);
scr_dia_line("I really don't know! I wonder what Villy Weeraway has been up to.", obj_npc_poppy);
scr_dia_line("I wonder what Villy Weeraway has been up to.", obj_npc_poppy);
scr_dia_line("But if you find anything, then be sure to let me know!", obj_npc_poppy);

scr_dia_options("EXIT", "FILLER");

scr_dia_segment(text4, "EXIT");
scr_dia_line("Will do!", polka);


text5 = ds_map_create();

scr_dia_segment(text5, "GREET");

//TOPSOIL RAIN EROSION QUIZ QUESTIONS
topsoil_rain_erosion_quiz = ds_list_create();
scr_quiz_list(topsoil_rain_erosion_quiz);

scr_quiz_question(enum_question_type.multi, 
"What did you find out", 
["The topsoil is being moved by people", "The topsoil is getting grabbed by animals", "The rain outside is flooding people's homes", "The topsoil is being removed away by water"], 
3);
scr_quiz_question_response("How did you find out?", "You almost got it! Try again");

scr_quiz_question(enum_question_type.evidence_multi, 
"We saw the topsoil getting moved by _____ into a lake when it was raining outside",
["Wind", "Water", "Animals", "Ice"],
[enum_evi_type.photo_erosion_water, 1]); 
//RESERVED EVIDENCE 2 FOR SOIL-EROSION-WATER PHOTO EVIDENCE (spr_soil_erosion_water_photo_evidence)
scr_quiz_question_response("This is wonderful, you figured it out!", "You almost got it! Try again");

//END OF TOPSOIL RAIN EROSION QUIZ QUESTIONS

scr_dia_line("This is wonderful, you figured it out!", obj_npc_poppy);
//QUIZ WHERE THEY HAVE TO ATTACH PHOTO EVIDENCE ABOUT HOW THE TOPSOIL WAS GETTING ERODED BY WATER
scr_dia_line_quiz(topsoil_rain_erosion_quiz, obj_npc_poppy); 

scr_dia_line("So THAT'S how the topsoil got removed!", obj_npc_poppy);
scr_dia_line("When soil or dirt is moved from one place to another by wind or water, it's called EROSION.", obj_npc_poppy);
scr_dia_line_sprite(spr_soil_erosion_water_photo_evidence);

scr_dia_options("EXIT", "FILLER");

scr_dia_segment(text5, "EXIT");
scr_dia_line("Thanks for all your help!", polka);



return [text0, text1, text2, text3, text4, text5];