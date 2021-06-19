function scr_dialogue_hubble() {
	text1 = ds_map_create();

	scr_dia_segment(text1, "GREET");
	scr_dia_line("Hello!", polka);

	scr_dia_options("A1", "FILLER");

	scr_dia_segment(text1, "A1");
	scr_dia_line("What do you do", polka);
	scr_dia_line("I study space and explore all the things in the universe that we don't know much about (1/3)", obj_npc_hubble);
	scr_dia_line("Things like planets, stars, galaxies, and more (2/3)", obj_npc_hubble);
	scr_dia_line("I then think about how we can use these findings to help us right now (3/3)", obj_npc_hubble);

	scr_dia_options("B1", "FILLER"); 

	scr_dia_segment(text1, "B1");
	scr_dia_line("What are you working on right now?", polka);
	scr_dia_line("I'm exploring how we can mine asteroids to get metals that are really hard to find here (1/5)", obj_npc_hubble);
	scr_dia_line("They have trillions of dollars worth of platinum and gold and silver (2/5)", obj_npc_hubble);
	scr_dia_line("They're like rocks of treasure floating in space! (3/5)", obj_npc_hubble);
	scr_dia_line("Asteroids also have lots of water in them (4/5)", obj_npc_hubble);
	scr_dia_line("So they can be good places to have refueling stations when astronauts need to stock up on water and fuel (5/5)", obj_npc_hubble);

	scr_dia_options("EXIT", "FILLER");

	scr_dia_segment(text1, "EXIT");
	scr_dia_line("Thanks!", polka);

	return [text1];


}
