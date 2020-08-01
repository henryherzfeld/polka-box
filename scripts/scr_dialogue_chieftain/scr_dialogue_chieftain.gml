//VILLY CHIEFTAIN DIALOGUE

text1 = ds_map_create();

scr_dia_segment(text1, "GREET");
scr_dia_line("Present your case!", obj_npc_chieftain);

scr_dia_line("We found out that the farmer's crops are dying because the soil they need in order to grow the crops is being washed away by rainwater.", polka);
scr_dia_line("To understand why the crops were dying, we first had to understand what crops need to live.", polka);

//EROSION INVESTIGATION CASE QUIZ QUESTIONS
erosion_investigation_case = ds_list_create();
scr_quiz_list(erosion_investigation_case);

scr_quiz_question(enum_question_type.multi, 
"To learn about this, we spoke with a ______ named Villy Poppy.", 
["farmer",
"gardener",
"botanist",
"chemist"], 
2);
scr_quiz_question_response(noone, "What?! That's outrageous");

scr_quiz_question(enum_question_type.checkbox,
"We learned that plants need:", 
["Air",
"Sunlight",
"Water",
"Soil"],
[0,1,2,3]);
scr_quiz_question_response(noone, "What?! That's ridiculous");

scr_quiz_question(enum_question_type.checkbox,
"If a plant wasn't getting enough sunlight, it looked:", 
["Yellow",
"Strong",
"Long",
"Thin"],
[0,2,3]);
scr_quiz_question_response(noone, "What?! I don't believe it");

scr_quiz_question(enum_question_type.checkbox,
"If a plant wasn't getting enough water, it looked:", 
["Dry",
"Brown",
"Green",
"Wilting"],
[0,1,3]);
scr_quiz_question_response("I see. Keep going", "What?! That's outrageous");

scr_quiz_question(enum_question_type.checkbox,
"If a plant wasn't getting enough soil, it looked:", 
["Strong",
"Brown",
"Dry",
"Wilting"],
[1,2,3]);
scr_quiz_question_response(noone, "What?! That's ridiculous");

scr_quiz_question(enum_question_type.multi, 
"We observed that the plants that weren't getting enough water or enough soil looked", 
["Similar",
"Different"], 
0);
scr_quiz_question_response(noone, "What?! That's outrageous");

scr_quiz_question(enum_question_type.multi, 
"That's because these plants lacked ______.", 
["Soda",
"Nutrients",
"Insects",
"All of the above"], 
1);
scr_quiz_question_response(noone, "What?! That's outrageous");

scr_quiz_question(enum_question_type.evidence_checkbox,
"After investigating the farmer's crops, we realized they looked", 
["Wilting",
"Brown",
"Dry",
"Green"],
[enum_evi_type.photo_crop, [0,1,2]]); 
//EVIDENCE 2 IS RESERVED FOR CROP APPEARANCE PHOTO EVIDENCE (spr_crop_appearance_fields_photo_evidence)
scr_quiz_question_response(noone, "What?! That's ridiculous");

scr_quiz_question(enum_question_type.checkbox,
"They either weren't getting enough", 
["Water",
"Air",
"Sunlight",
"Soil"],
[0,3]);
scr_quiz_question_response(noone, "What?! That's outrageous");

scr_quiz_question(enum_question_type.multi, 
"We concluded that the plants ____ getting enough nutrients.", 
["were",
"were not"], 
1);
scr_quiz_question_response(noone, "What?! That's outrageous");

scr_quiz_question(enum_question_type.multi, 
"We learned that measuring the ______ could help us conclude whether the crops were getting enough water.", 
["soil depth",
"soil moisture",
"soil density",
"All of the above"], 
1);
scr_quiz_question_response(noone, "What?! That's ridiculous");

scr_quiz_question(enum_question_type.multi, 
"If the soil moisture was between _____ kpa, then it meant there was enough water available for the plants.", 
["10-20",
"30-40",
"50-60",
"None of the above"], 
2);
scr_quiz_question_response(noone, "What?! That's outrageous");

scr_quiz_question(enum_question_type.multi, 
"We used a ____ to measure the moisture", 
["tensiometer",
"thermometer",
"measuring stick",
"None of the above"], 
0);
scr_quiz_question_response(noone, "What?! That's ridiculous");

scr_quiz_question(enum_question_type.evidence_multi, 
"We discovered that the soil moisture was between ____ kpa", 
["30-40",
"50-60",
"70-80",
"None of the above"], 
[enum_evi_type.soil_moisture_tbl , 1]); 
//EVIDENCE 2 IS RESERVED FOR THE SOIL MOISTURE TABLE (spr_soil_moisture_table_evidence)
scr_quiz_question_response(noone, "What?! That's outrageous");

scr_quiz_question(enum_question_type.multi, 
"We concluded that the soil ____ enough water", 
["didn't have",
"had"], 
1);
scr_quiz_question_response("I see. Keep going", "What?! That's ridiculous");

scr_quiz_question(enum_question_type.multi, 
"We decided to investigate if the crops were getting enough topsoil. We measured the ____ in the farmer's fields.", 
["soil moisture",
"soil compaction",
"soil depth",
"All of the above"], 
2);
scr_quiz_question_response(noone, "What?! That's outrageous");

scr_quiz_question(enum_question_type.multi, 
"We learned that about _____ inches of topsoil depth was needed for plants to grow.", 
["8-10",
"11-13",
"6-8",
"None of the above"], 
0);
scr_quiz_question_response(noone, "What?! That's outrageous");

scr_quiz_question(enum_question_type.multi, 
"We used a ____ to measure the topsoil depth", 
["tensiometer",
"thermometer",
"measuring stick",
"None of the above"], 
2);
scr_quiz_question_response(noone, "What?! That's ridiculous");

scr_quiz_question(enum_question_type.evidence_multi, 
"We discovered that the topsoil depth was between ____ inches", 
["1-2",
"4-6",
"8-10",
"None of the above"], 
[enum_evi_type.soil_depth_tbl, 1]); 
//EVIDENCE 2 IS RESERVED FOR THE TOPSOIL DEPTH TABLE (spr_topsoil_depth_evidence)
scr_quiz_question_response(noone, "What?! That's outrageous");

scr_quiz_question(enum_question_type.multi, 
"We concluded that the crops _____ getting enough topsoil", 
["were not",
"were"], 
0);
scr_quiz_question_response(noone, "What?! That's outrageous");

scr_quiz_question(enum_question_type.evidence_multi, 
"We made an observation while returning to the farm. While it was _____, we saw water carrying the topsoil away from the fields over to the lake nearby.", 
["snowing",
"raining",
"hailing",
"None of the above"], 
[enum_evi_type.photo_erosion_water, 1]); 
//EVIDENCE 2 IS RESERVED FOR THE SOIL-EROSION-WATER PHOTO (spr_soil_erosion_water_photo_evidence)
scr_quiz_question_response("I see. Keep going", "What?! That's ridiculous");

scr_quiz_question(enum_question_type.multi, 
"When soil or rock is moved from one place to another by wind or water, it's called", 
["Weathering",
"Sleet",
"Erosion",
"Earthquake"], 
2);
//END OF EROSION INVESTIGATION CASE QUIZ QUESTIONS
scr_dia_line("The court has noted the account given!", obj_npc_chieftain); 
scr_dia_line_quiz(erosion_investigation_case, obj_npc_chieftain); 


scr_dia_line("That brings us to our conclusion: The farmer's crops are dying because the soil they need to grow is being eroded away by rainwater.", polka);

scr_dia_line("We found out that planting more vegetation around the fields lowers soil erosion.", polka);
scr_dia_line_sprite(spr_erosion_experiment_setup_after); 

//EROSION EXPERIMENT CASE QUIZ QUESTIONS
erosion_experiment_case = ds_list_create();
scr_quiz_list(erosion_experiment_case);

scr_quiz_question(enum_question_type.multi, 
"In our _____, we found out that the soil in forests had a higher topsoil depth and soil compaction.", 
["hypothesis",
"procedure",
"background research",
"None of the above"], 
2);
scr_quiz_question_response(noone, "What?! That's outrageous");

scr_quiz_question(enum_question_type.multi, 
"We set up an experiment. Our ______ was that planting more vegetation around the fields would lower soil erosion.", 
["hypothesis",
"procedure",
"background research",
"None of the above"], 
0);
scr_quiz_question_response(noone, "What?! That's ridiculous");

scr_quiz_question(enum_question_type.multi, 
"We set up a step-by-step ______ for doing the experiment.", 
["hypothesis",
"procedure",
"background research",
"None of the above"], 
1);
scr_quiz_question_response("I see. Keep going", "What?! That's outrageous");

scr_quiz_question(enum_question_type.multi, 
"We made _____ different square patches. Each patch was filled with soil.", 
["one",
"two",
"three",
"None of the above"], 
1);
scr_quiz_question_response(noone, "What?! That's ridiculous");

scr_quiz_question(enum_question_type.multi, 
"We planted crops in both patches. The difference was how much _______ there was in each patch.", 
["earthworms",
"soil",
"vegetation",
"None of the above"], 
2);
scr_quiz_question_response(noone, "What?! That's outrageous");

scr_quiz_question(enum_question_type.multi, 
"The ____ patch had no vegetation planted around it. The ____ patch had vegetation like big and small trees planted around it.", 
["first; second",
"second; first"], 
0);
scr_quiz_question_response(noone, "What?! That's ridiculous");

scr_quiz_question(enum_question_type.multi, 
"Over 4 weeks, we measured the ______ in each patch and compared the results at the end.", 
["topsoil depth",
"crop growth",
"soil compaction",
"All of the above"], 
3);
scr_quiz_question_response(noone, "What?! That's outrageous");

scr_quiz_question(enum_question_type.evidence_multi, 
"From our data ____, we found that the patch with vegetation had higher plant growth and soil depth than the patch with no vegetation.", 
["analysis",
"procedure",
"hypothesis",
"None of the above"], 
0);
scr_quiz_question_response("I see. Keep going", "What?! That's ridiculous");

scr_quiz_question(enum_question_type.multi, 
"We came to the _____ that planting more vegetation around the fields does lower soil erosion.", 
["hypothesis",
"conclusion",
"background research",
"None of the above"], 
[enum_evi_type.soil_experiment_tbl, 0]);
scr_quiz_question_sprite(spr_erosion_experiment_setup_after);
//EVIDENCE 2 IS RESERVED FOR THE EROSION EXPERIMENT TABLE (spr_erosion_experiment_table_evidence)

//END OF EROSION EXPERIMENT CASE QUIZ QUESTIONS
scr_dia_line("The court has decided to grant the farmers the funding needed to solve the erosion problem.", obj_npc_chieftain); 
scr_dia_line_sprite(spr_erosion_experiment_setup_after);
scr_dia_line_quiz(erosion_experiment_case, obj_npc_chieftain);
scr_dia_line("Session adjourned!", obj_npc_chieftain);
scr_dia_options("EXIT", "EXIT");


scr_dia_segment(text1, "EXIT");
scr_dia_line("Ok", polka);

return [text1];