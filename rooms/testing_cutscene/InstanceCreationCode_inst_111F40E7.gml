text1 = ds_map_create();

text1[? "GREET"] = ["Hello!", "Hello there " + game.name + "!", ["GREET", "EXIT", "EXIT"], [polka, obj_npc_villy.id, ]];
text1[? "EXIT"] = ["Bye Bye", "See you later!", [], [polka, obj_npc_villy.id]];

text2 = ds_map_create();

text2[? "GREET"] = ["I am chasing you, " + game.name + "!", ["EXIT", "EXIT"], [[obj_npc_villy.id, enum_portrait.angry], ]];
text2[? "EXIT"] = ["Thats some creepy shit", [], [noone]];

scene_info = [
	[scr_cutscene_change_variable, polka, "move_override", true],
	[scr_cutscene_change_variable, obj_camera, "following", noone],
	[scr_cutscene_wait, 1],
	[scr_cutscene_pan_camera, obj_npc_villy.x, obj_npc_villy.y, false, 12],
	[scr_cutscene_wait, 4],
	[scr_cutscene_move_character_char, obj_npc_villy, polka, false, 5],
	[scr_cutscene_pan_camera_char, polka, false, 12],
	[scr_cutscene_create_dialogue, text1, []],
	[scr_cutscene_change_variable, polka, "move_override", true],
	[scr_cutscene_change_variable, obj_camera, "following", noone],
	[scr_cutscene_wait, 4],
	[scr_cutscene_move_character, polka, 300, 300, false, 5],
	[scr_cutscene_pan_camera_char, polka, false, 12],
	[scr_cutscene_move_character_char, obj_npc_villy, polka, false, 5],
	[scr_cutscene_create_dialogue, text2, []],
	[scr_cutscene_wait, 4],
	[scr_cutscene_move_character, polka, 1000, 800, false, 5],
	[scr_cutscene_pan_camera_char, polka, false, 12],
	[scr_cutscene_move_character_char, obj_npc_villy, polka, false, 5],
	[scr_cutscene_create_dialogue, text2, []],
	[scr_cutscene_wait, 4],
	[scr_cutscene_move_character, polka, 300, 300, false, 5],
	[scr_cutscene_pan_camera_char, polka, false, 12],
	[scr_cutscene_move_character_char, obj_npc_villy, polka, false, 5],
	[scr_cutscene_create_dialogue, text2, []],
	[scr_cutscene_change_variable, obj_camera, "following", polka],
	[scr_cutscene_change_variable, polka, "move_override", false],
];