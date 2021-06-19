function scr_dialogue_poppy_mtv() {
	text1 = ds_map_create();
	scr_dia_segment(text1, "GREET");
	scr_dia_line("Hi, "+game.name+"! Welcome, great to have you on board!", obj_npc_poppy);
	scr_dia_line("I'm the botanist.", obj_npc_poppy);
	scr_dia_line("I study plants and how they can be used to help others", obj_npc_poppy);
	scr_dia_line("There's something I have for you to do, if you're up to it.", obj_npc_poppy);
	scr_dia_line("The villies are getting sick because of the pollution!", obj_npc_poppy);
	scr_dia_line("I need you to go and place these air-purifying plants around the village.", obj_npc_poppy);
	scr_dia_line("Make sure to press the SPACE key wherever you want to plant.", obj_npc_poppy);
	scr_dia_line("And if you want to use a different plant, press SPACE more than once at the same spot!", obj_npc_poppy);
	scr_dia_line("Feel free to place as many plants as you want!", obj_npc_poppy);
	scr_dia_line("Just come back and see me afterwards.", obj_npc_poppy);
	scr_dia_line("I expect you'll do a great job, can't wait to see what you've done!", obj_npc_poppy);
	scr_dia_options("EXIT", "FILLER");

	scr_dia_segment(text1, "EXIT");
	scr_dia_line("Okay! I'll get to it.", polka);

	text2 = ds_map_create();
	scr_dia_segment(text2, "GREET");
	scr_dia_line("Back already?", obj_npc_poppy);
	scr_dia_line("Well, thank you!", obj_npc_poppy);
	scr_dia_line("You've done a terrific job and have been a great, great help!", obj_npc_poppy);
	scr_dia_line("I'll let you know as soon as I have another task for you.", obj_npc_poppy);
	scr_dia_options("EXIT", "FILLER");

	scr_dia_segment(text2, "EXIT");
	scr_dia_line("Sounds good. Bye!", polka);


	text3 = ds_map_create();
	scr_dia_segment(text3, "GREET");
	scr_dia_line("Hey "+game.name+" I'm a little busy watering plants, maybe you should go visit another Villy?", obj_npc_poppy);
	scr_dia_options("EXIT", "FILLER");

	scr_dia_segment(text3, "EXIT");
	scr_dia_line("Sounds good. Bye!", polka);


	text4 = ds_map_create();
	scr_dia_segment(text4, "GREET");
	scr_dia_line("85% of plant life is found in the OCEAN!", [obj_npc_poppy, enum_portrait.happy]);
	scr_dia_options("EXIT", "FILLER");

	scr_dia_segment(text4, "EXIT");
	scr_dia_line("Sounds good. Bye!", polka);

	text5 = ds_map_create();
	scr_dia_segment(text5, "GREET");
	scr_dia_line("Oak trees don't produce acorns until they are 50 years old!", [obj_npc_poppy, enum_portrait.happy]);
	scr_dia_options("EXIT", "FILLER");

	scr_dia_segment(text5, "EXIT");
	scr_dia_line("Sounds good. Bye!", polka);

	text6 = ds_map_create();
	scr_dia_segment(text6, "GREET");
	scr_dia_line("Scientists have only explored ONE percent of rainforest plants for medicinal potential.", obj_npc_poppy);
	scr_dia_line("Not only that, but 70,000 plants have already been used in medicine.", obj_npc_poppy);
	scr_dia_line("Think of how many more there might be! ... Too bad the rainforests are disappearing...", [obj_npc_poppy, enum_portrait.sad]);

	scr_dia_options("EXIT", "FILLER");

	scr_dia_segment(text6, "EXIT");
	scr_dia_line("Sounds good. Bye!", polka);

	return [text1, text2, text3, text4, text5, text6];


}
