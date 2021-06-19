function scr_dialogue_boojum() {
	text1 = ds_map_create();

	scr_dia_segment(text1, "GREET");
	scr_dia_line("Hello!", polka);

	scr_dia_options("A1", "FILLER");

	scr_dia_segment(text1, "A1");
	scr_dia_line("What do you do", polka);
	scr_dia_line("I study how matter and energy works in the world around us", obj_npc_boojum);

	scr_dia_options("B1", "FILLER"); 

	scr_dia_segment(text1, "B1");
	scr_dia_line("What are you working on right now?", polka);
	scr_dia_line("I'm looking at proton radiation, which is energy made by fast-moving protons in atoms (1/7)", obj_npc_boojum);
	scr_dia_line("We use radiation to treat people with cancer (2/7)", obj_npc_boojum);
	scr_dia_line("But besides killing the cancer cells, it also kills some healthy cells (3/7)", obj_npc_boojum);
	scr_dia_line("This can cause side-effects (4/7)", obj_npc_boojum);
	scr_dia_line("So that's why I'm now exploring PROTON radiation (5/7)", obj_npc_boojum);
	scr_dia_line("It's more precise and powerful (6/7)", obj_npc_boojum);
	scr_dia_line("It can be used to help kill cancer cells WITHOUT hurting their healthy cells (7/7)", obj_npc_boojum);

	scr_dia_options("EXIT", "FILLER");

	scr_dia_segment(text1, "EXIT");
	scr_dia_line("Thanks!", polka);

	return [text1];


}
