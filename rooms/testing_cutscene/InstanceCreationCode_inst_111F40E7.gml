active = true;

poppy_cutscene_1_1 = ds_map_create();
scr_dia_segment(poppy_cutscene_1_1, "GREET");

scr_dia_line("Oh! Adi, come in, come in!", obj_npc_poppy);
//scr_dia_line_sprite(spr_portrait_poppy_happy); 

scr_dia_line("Have a seat, I was just watering my plants for the day.", obj_npc_poppy);
//scr_dia_line_sprite(spr_portrait_poppy_happy);

scr_dia_options("EXIT", "EXIT");
scr_dia_segment(poppy_cutscene_1_1, "EXIT");
scr_dia_line("[Continue]", polka);

//BREAK

poppy_cutscene_1_2 = ds_map_create();
scr_dia_segment(poppy_cutscene_1_2, "GREET");

scr_dia_line("Here's some tea I made from green tea leaves." , obj_npc_poppy); 

scr_dia_line("It's a great energy-booster after a long day's work.", obj_npc_poppy);
//scr_dia_line_sprite(spr_portrait_poppy_happy);


scr_dia_options("EXIT", "EXIT");
scr_dia_segment(poppy_cutscene_1_2, "EXIT");
scr_dia_line("[Continue]", polka);

//BREAK

poppy_cutscene_1_3 = ds_map_create();
scr_dia_segment(poppy_cutscene_1_3, "GREET");

scr_dia_line("I really love plants." , obj_npc_poppy); 
//scr_dia_line_sprite(spr_portrait_poppy_happy);

scr_dia_line("They're such wonderful friends to have.", obj_npc_poppy);

scr_dia_options("EXIT", "EXIT");
scr_dia_segment(poppy_cutscene_1_3, "EXIT");
scr_dia_line("[Continue]", polka);

//BREAK

poppy_cutscene_1_4 = ds_map_create();
scr_dia_segment(poppy_cutscene_1_4, "GREET");

scr_dia_line("Did I ever tell you how I became a botanist?" , obj_npc_poppy); 

scr_dia_options("EXIT", "EXIT");
scr_dia_segment(poppy_cutscene_1_4, "EXIT");
scr_dia_line("[Continue]", polka);

//BREAK

poppy_cutscene_1_5 = ds_map_create();
scr_dia_segment(poppy_cutscene_1_5, "GREET");

scr_dia_line("I was never the most popular girl at my school." , obj_npc_poppy); 
scr_dia_line_sprite(spr_poppy_flashback_1);

scr_dia_line("I was shy and quiet and usually kept to myself.", obj_npc_poppy);
scr_dia_line_sprite(spr_poppy_flashback_1);
scr_dia_line_sprite(spr_poppy_flashback_2);

scr_dia_options("EXIT", "EXIT");
scr_dia_segment(poppy_cutscene_1_5, "EXIT");
scr_dia_line("[Continue]", polka);	

//BREAK

poppy_cutscene_1_6 = ds_map_create();
scr_dia_segment(poppy_cutscene_1_6, "GREET");

scr_dia_line("To make friends, I would steal the plants in my parent's garden." , obj_npc_poppy); 
scr_dia_line_sprite(spr_poppy_flashback_3);
//scr_dia_line_sprite(spr_portrait_poppy_happy);

scr_dia_options("EXIT", "EXIT");
scr_dia_segment(poppy_cutscene_1_6, "EXIT");
scr_dia_line("[Continue]", polka);

//BREAK

poppy_cutscene_1_7 = ds_map_create();
scr_dia_segment(poppy_cutscene_1_7, "GREET");

scr_dia_line("I would make delicious soup using herbs like basil and thyme and give it to my friends to enjoy.", obj_npc_poppy); 
scr_dia_line_sprite(spr_poppy_flashback_4);
//scr_dia_line_sprite(spr_portrait_poppy_happy);

scr_dia_line("I would help my friends calm down after stressful tests by making them tea using chamomile leaves.", obj_npc_poppy);
scr_dia_line_sprite(spr_poppy_flashback_4);
scr_dia_line_sprite(spr_poppy_flashback_5);

scr_dia_line("And I would make my friends happy by giving them flowers on days when they were feeling down.", obj_npc_poppy);
scr_dia_line_sprite(spr_poppy_flashback_5);
scr_dia_line_sprite(spr_poppy_flashback_6);

scr_dia_line("Soon enough, I became one of the most popular girls at school!", obj_npc_poppy);
scr_dia_line_sprite(spr_poppy_flashback_6);
//scr_dia_line_sprite(spr_portrait_poppy_happy);


scr_dia_options("EXIT", "EXIT");
scr_dia_segment(poppy_cutscene_1_7, "EXIT");
scr_dia_line("[Continue]", polka);

//BREAK

poppy_cutscene_1_8 = ds_map_create();
scr_dia_segment(poppy_cutscene_1_8, "GREET");

scr_dia_line("That's when I realized I loved studying plants to help others.", obj_npc_poppy); 
//scr_dia_line_sprite(spr_portrait_poppy_happy);

scr_dia_line("Botany helped me make friends in a way that was true to me." , obj_npc_poppy);

scr_dia_line("Just like right now, we're having tea made from plant leaves." , obj_npc_poppy);
//scr_dia_line_sprite(spr_portrait_poppy_happy);

scr_dia_options("EXIT", "EXIT");
scr_dia_segment(poppy_cutscene_1_8, "EXIT");
scr_dia_line("[Continue]", polka);

//BREAK

poppy_cutscene_1_9 = ds_map_create();
scr_dia_segment(poppy_cutscene_1_9, "GREET");

scr_dia_line("Well...I look forward to seeing you more, Adi.", obj_npc_poppy); 

scr_dia_line("Thanks for having tea with me." , obj_npc_poppy); 
//scr_dia_line_sprite(spr_portrait_poppy_happy);

scr_dia_line("I'm off to tend to my plants outside." , obj_npc_poppy); 

scr_dia_options("EXIT", "EXIT");
scr_dia_segment(poppy_cutscene_1_9, "EXIT");
scr_dia_line("[End]", polka);

/*
Player walks inside Poppy's house and faces her. 

Poppy is watering her house plants with a plant pitcher and is humming ("tune" emoticon)

She turns and sees the player. She looks surprised to see the player ("!" emoticon)

"Oh! [game.name], come in, come in!" 

"Have a seat, I was just watering my plants for the day."

Player sits in one of her chairs

She walks over to him with a teapot and cup and gives him some steaming tea

"Here's some tea I made from green tea leaves." 
"It's a great energy-booster after a long day's work."

She sits down in a chair after giving him the tea. They both sip their tea  

"I really love plants."
"They're such wonderful friends to have."

She pauses and sips some more tea

"Did I ever tell you how I became a botanist?"

She puts her cup of tea away

"I was never the most popular girl at my school."
"I was shy and quiet and usually kept to myself."

Laughs good-naturedly (or we can use a "laugh" emoticon)

"To make friends, I would steal the plants in my parent's garden."

Player looks surprised ("!" emoticon)

Poppy laughs again good-naturedly (or we can use a "laugh" emoticon)

"I would make delicious soup using herbs like basil and thyme and give it to my friends to enjoy."
"I would help my friends calm down after stressful tests by making them tea using chamomile leaves."
"And I would make my friends happy by giving them flowers on days when they were feeling down."
"Soon enough, I became one of the most popular girls at school!"

(Poppy has a happy, warm feeling emoticon)

"That's when I realized I loved studying plants to help others."
"Botany helped me make friends in a way that was true to me."
"Just like right now, we're having tea made from plant leaves."

(Player has a happy, warm feeling emotion) 

She stands from her chair.

"Well...I look forward to seeing you more, [name]."
"Thanks for having tea with me."
"I'm off to tend to my plants outside."  

Walks out the home

(End scene, fade to black)  

*/

//denotes the scene sets for 
scene_info = [

	//poppy enters the room
	[scr_cutscene_change_room, rm_poppy, 416, 160],
	[scr_cutscene_wait, 1],
	
	[scr_cutscene_change_variable, polka, "move_override", true],

	//polka walks forward and faces poppy
	[scr_cutscene_move_character, polka, 416, 140, false, 0.6],
	
	[scr_cutscene_change_facing, polka, dir.up],
	[scr_cutscene_wait, 2],
	
	//poppy walks over to her plants
	[scr_cutscene_move_character, obj_npc_poppy, 350, 50, false, 0.6],
	[scr_cutscene_wait, 1],
	
	[scr_cutscene_change_facing, obj_npc_poppy, dir.right],
	
	//she waters her plants
	[scr_cutscene_animate_character, obj_npc_poppy, spr_poppy_watering_right, 4],
	[scr_cutscene_wait, 1],
	
	[scr_cutscene_emote_character, obj_npc_poppy, spr_emote_love, 80],
	[scr_cutscene_wait, 3],
	
	[scr_cutscene_move_character, obj_npc_poppy, 400, 50, false, 0.6],
	[scr_cutscene_wait, 1],
	
	[scr_cutscene_animate_character, obj_npc_poppy, spr_poppy_watering_right, 4],
	[scr_cutscene_wait, 1],
	
	[scr_cutscene_move_character, obj_npc_poppy, 450, 50, false, 0.6],
	[scr_cutscene_wait, 1],
	
	[scr_cutscene_animate_character, obj_npc_poppy, spr_poppy_watering_right, 4],
	[scr_cutscene_wait, 1],
	
	//poppy faces the player
	[scr_cutscene_change_facing, obj_npc_poppy, dir.down],
	
	//poppy looks surprised to see the player
	[scr_cutscene_emote_character, obj_npc_poppy, spr_emote_shocked, 80],
	[scr_cutscene_wait, 3],
	
	//POPPY SPEAKS
	[scr_cutscene_create_dialogue, poppy_cutscene_1_1, [], obj_npc_poppy],

	//polka sits in chair
	[scr_cutscene_move_character, polka, 295, 135, false, 0.7],
	[scr_cutscene_wait, 1],

	//give polka the sitting down sprite
	[scr_cutscene_change_character_sprites, polka, 
											spr_villy_walk_front, spr_villy_walk_left, spr_villy_walk_back, spr_villy_walk_right,
											spr_villy_sitting_right, spr_villy_stand_left, spr_villy_stand_back, spr_villy_sitting_right],
	[scr_cutscene_move_character, polka, 0, 10, true, 10000],
	
	[scr_cutscene_wait, 2],
	
	//poppy walks over to polka with tea
	[scr_cutscene_change_character_sprites, obj_npc_poppy, 
											spr_poppy_walk_cup_front, spr_poppy_walk_cup_left, spr_poppy_walk_cup_back, spr_poppy_walk_cup_right,
											spr_poppy_stand_cup_front, spr_poppy_stand_cup_left, spr_poppy_stand_cup_back, spr_poppy_stand_cup_right],
	
	[scr_cutscene_move_character, obj_npc_poppy, 290, 125, false, 0.7],
	[scr_cutscene_wait, 3],
	
	
	//polka gets tea cup
	[scr_cutscene_change_character_sprites, polka, 
											spr_villy_walk_front, spr_villy_walk_left, spr_villy_walk_back, spr_villy_walk_right,
											spr_villy_sitting_cup_right, spr_villy_stand_left, spr_villy_stand_back, spr_villy_sitting_cup_right],
	
	//polka faces right
	[scr_cutscene_change_facing, polka, dir.right],
	
	//POPPY SPEAKS
	[scr_cutscene_create_dialogue, poppy_cutscene_1_2, [], obj_npc_poppy],
	[scr_cutscene_wait, 2],
	
	//poppy walks over to her seat
	[scr_cutscene_move_character, obj_npc_poppy, 360, 130, false, 0.7],
	[scr_cutscene_wait, 1],
	
	//poppy sits in her seat with cup in her hand
	[scr_cutscene_change_character_sprites, obj_npc_poppy, 
											spr_poppy_walk_cup_front, spr_poppy_walk_cup_front, spr_poppy_walk_cup_front, spr_poppy_walk_cup_front,
											spr_poppy_sitting_cup_left, spr_poppy_sitting_cup_left, spr_poppy_stand_cup_back, spr_poppy_stand_cup_right],
	[scr_cutscene_move_character, obj_npc_poppy, 0, 12, true, 10000],
	
	//poppy faces left
	[scr_cutscene_change_facing, obj_npc_poppy, dir.left],
	
	//they both sip their tea
	[scr_cutscene_animate_character, obj_npc_poppy, spr_poppy_drinking_tea],
	[scr_cutscene_wait, 1],
	
	[scr_cutscene_animate_character, polka, spr_villy_drinking_tea],
	[scr_cutscene_wait, 1],
	
	[scr_cutscene_animate_character, obj_npc_poppy, spr_poppy_drinking_tea, 1],
	[scr_cutscene_wait, 1],
	
	//POPPY SPEAKS
	[scr_cutscene_create_dialogue, poppy_cutscene_1_3, [], obj_npc_poppy],
	[scr_cutscene_wait, 2],
	
	//she pauses and sips more tea
	[scr_cutscene_animate_character, obj_npc_poppy, spr_poppy_drinking_tea, 3],
	[scr_cutscene_wait, 1],
	

	//POPPY SPEAKS
	[scr_cutscene_create_dialogue, poppy_cutscene_1_4, [], obj_npc_poppy],
	[scr_cutscene_wait, 2],
	
	//she puts her tea away, so that she's only sitting down facing left
	[scr_cutscene_change_character_sprites, obj_npc_poppy, 
											spr_poppy_walk_front, spr_poppy_walk_left, spr_poppy_walk_back, spr_poppy_walk_right,
											spr_poppy_sitting_left, spr_poppy_sitting_left, spr_poppy_stand_back, spr_poppy_stand_right],
	[scr_cutscene_wait, 2],
	
	//POPPY SPEAKS
	[scr_cutscene_create_dialogue, poppy_cutscene_1_5, [], obj_npc_poppy],
	
	//laughs good-naturedly 
	[scr_cutscene_emote_character, obj_npc_poppy, spr_emote_haha, 70],
	[scr_cutscene_wait, 2],
	
	//POPPY SPEAKS
	[scr_cutscene_create_dialogue, poppy_cutscene_1_6, [], obj_npc_poppy],
	[scr_cutscene_wait, 2],
	
	//polka is surprised
	[scr_cutscene_emote_character, polka, spr_emote_whoa, 70],
	[scr_cutscene_wait, 2],
	
	//poppy laughs again
	[scr_cutscene_emote_character, obj_npc_poppy, spr_emote_chuckle, 70],
	[scr_cutscene_wait, 2],
	
	//POPPY SPEAKS
	[scr_cutscene_create_dialogue, poppy_cutscene_1_7, [], obj_npc_poppy],
	[scr_cutscene_wait, 2],
	
	//poppy feels wonderful 
	[scr_cutscene_emote_character, obj_npc_poppy, spr_emote_angel, 70],
	[scr_cutscene_wait, 2],
	
	//POPPY SPEAKS
	[scr_cutscene_create_dialogue, poppy_cutscene_1_8, [], obj_npc_poppy],
	[scr_cutscene_wait, 2],
	
	//polka feels warm on the inside
	[scr_cutscene_emote_character, polka, spr_emote_love, 70],
	[scr_cutscene_wait, 2],
	
	//poppy stands from her chair
	[scr_cutscene_change_character_sprites, obj_npc_poppy, 
											spr_poppy_walk_front, spr_poppy_walk_left, spr_poppy_walk_back, spr_poppy_walk_right,
											spr_poppy_stand_front, spr_poppy_stand_left, spr_poppy_stand_back, spr_poppy_stand_right],
	
	[scr_cutscene_change_facing, obj_npc_poppy, dir.left],
	[scr_cutscene_wait, 2],
	
	//POPPY SPEAKS
	[scr_cutscene_create_dialogue, poppy_cutscene_1_9, [], obj_npc_poppy],
	[scr_cutscene_wait, 2],
	
	//poppy walks out the house
	[scr_cutscene_move_character, obj_npc_poppy, 422, 226, false, 0.7],
	
	//poppy disappears from the cutscene
	[scr_cutscene_instance_destroy_nearest, 422, 226, obj_npc_poppy],
	
	//cutscene fades to black
	[scr_cutscene_change_room_fade, fin, 0, 0, .1],
]

/* Examples

ero_fin_text4a = ds_map_create();
scr_dia_segment(ero_fin_text4a, "GREET");

scr_dia_line("You've got your first crystal piece! Good work, young knight.", obj_npc_poppy); 
scr_dia_line_sprite(spr_crystal_inventa_status_1);

scr_dia_line("Knock out the next quests to get more crystal pieces", obj_npc_poppy); 
scr_dia_line_sprite(spr_crystal_inventa_status_1);
scr_dia_line_sprite(spr_virus_henchmen);

scr_dia_line("You have to take Virus down! He's still out there. Who knows what he's plotting next...", obj_npc_poppy); 

scr_dia_line("Get ready for your next quest! You'll be exploring space!", obj_npc_poppy);
scr_dia_line_sprite(spr_virus_henchmen);
scr_dia_line_sprite(spr_ship); 

scr_dia_options("EXIT", "EXIT");
scr_dia_segment(ero_fin_text4a, "EXIT");
scr_dia_line("Ok", polka);

[scr_cutscene_scale_camera, .3, 1000],
[scr_cutscene_change_variable, polka, "move_override", true],
[scr_cutscene_change_variable, obj_camera, "following", noone],
[scr_cutscene_wait, 1],
[scr_cutscene_scale_camera, 1.3, 2],
[scr_cutscene_pan_camera, 770, 1025, false, 12],
[scr_cutscene_wait, .5],
[scr_cutscene_pan_camera, 1900, 1025, false, 12],
[scr_cutscene_wait, .5],
[scr_cutscene_pan_camera, 1900, 500, false, 12],
[scr_cutscene_wait, .5],
[scr_cutscene_pan_camera, 400, 500, false, 12],
[scr_cutscene_wait, .5],
[scr_cutscene_pan_camera, 1200, 500, false, 12],
[scr_cutscene_change_variable, npc_green_villy, "draw", true],
[scr_cutscene_scale_camera, 1, 1],
[scr_cutscene_wait, 3],
[scr_cutscene_pan_camera_char, polka, false, 12],
[scr_cutscene_change_variable, npc_green_villy, "draw", false],
[scr_cutscene_wait, 1],
[scr_cutscene_change_variable, obj_camera, "following", polka],
[scr_cutscene_change_variable, polka, "move_override", false]

*/

room_goto(rm_poppy);
scene_info = scr_poppy_minigame_1();