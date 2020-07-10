
active = false;

var temp = dialogue.dialogues[? obj_npc_baron];
text = temp[0];

scene_info = [
	[scr_cutscene_change_variable, polka, "move_override", true],
	[scr_cutscene_wait, 2],
	[scr_cutscene_move_character, obj_npc_baron, 50, -100, true, 3],
	[scr_cutscene_wait, 1],
	[scr_cutscene_create_dialogue, text],
	[scr_cutscene_move_character, obj_npc_baron, -50, 100, true, 3],
	[scr_cutscene_change_variable, polka, "move_override", false],
]

/*

	poppy_crops = ds_map_create();
	scr_dia_segment(poppy_crops, "GREET");
	scr_dia_line("You should capture this moment!", [obj_npc_poppy, enum_portrait.happy]);
	scr_dia_line("Oh my!", [obj_npc_poppy, enum_portrait.sad]);
	scr_dia_line("Water is making its way into my boots. Meet me back at my lab once you're done here. I'm going inside!", [obj_npc_poppy, enum_portrait.angry]);
	scr_dia_options("EXIT", "EXIT");
	
	scr_dia_segment(poppy_crops, "EXIT");
	scr_dia_line("Okay", polka);
	
	scene_info = [
	[scr_cutscene_change_variable, polka, "move_override", true],
	[scr_cutscene_change_variable, game, "rain", true],
	[scr_cutscene_wait, 2],
	[scr_cutscene_change_variable, obj_camera, "following", noone],
	[scr_cutscene_pan_camera, 1630, 600, false, 4],
	[scr_cutscene_change_room, erosion_forest,  1300, 650],
	[scr_cutscene_wait, .1],
	[scr_cutscene_change_variable, obj_camera, "x", 700],
	[scr_cutscene_change_variable, obj_camera, "y", 300],
	[scr_cutscene_change_variable, polka, "move_override", true],
	[scr_cutscene_instance_create, 1300, 700, "Instances", obj_npc_poppy],
	[scr_cutscene_pan_camera, 1700, 300, false, 4],
	[scr_cutscene_wait, 1],
	[scr_cutscene_pan_camera_char, polka, false, 4],
	[scr_cutscene_change_variable, obj_camera, "following", polka],
	[scr_cutscene_wait, 2],
	[scr_cutscene_create_dialogue, poppy_crops, []],
	[scr_cutscene_move_character, obj_npc_poppy, -50, 900, false, 3],
	[scr_cutscene_instance_destroy_nearest, 0, 0, obj_npc_poppy],
];
}