text1 = ds_map_create();

text1[? "GREET"] = ["Hello!", "Hello there " + game.name + "!", ["GREET", "EXIT", "EXIT"], [polka, obj_npc_villy.id, ]];
text1[? "EXIT"] = ["Bye Bye", "See you later!", [], [polka, obj_npc_villy.id]];

text2 = ds_map_create();

text2[? "GREET"] = [["Here is a piece of evidence, " + game.name + "!", ["SCRIPT", scr_evi_add_notebook, enum_evi_type.evidence1], ["SCRIPT", scr_event_fire, event.new_evidence], ["SCRIPT", scr_change_variable, obj_overlay.id, "new_evidence", obj_notebook.evi_def[enum_evi_type.evidence1, enum_evi_state.sprite]]], ["EXIT", "EXIT"], [[obj_npc_villy.id, enum_portrait.angry]]];
text2[? "EXIT"] = ["Thats some chill shit", [], [noone]];

text3 = ds_map_create();

text3[? "GREET"] = ["I am chasing you, " + game.name + "!", ["EXIT", "EXIT"], [[obj_npc_villy.id, enum_portrait.angry], ]];
text3[? "EXIT"] = ["Thats some creepy shit", [], [noone]];

scene_info = [
	[scr_cutscene_change_variable, polka, "move_override", true],
	[scr_cutscene_change_variable, obj_camera, "following", noone],
	[scr_cutscene_wait, 1],
	[scr_cutscene_pan_camera, obj_npc_villy.x, obj_npc_villy.y, false, 12],
	[scr_cutscene_wait, 2],
	[scr_cutscene_move_character_char, obj_npc_villy, polka, false, 5],
	[scr_cutscene_pan_camera_char, polka, false, 12],
	[scr_cutscene_create_dialogue, text1, []],
	[scr_cutscene_change_variable, polka, "move_override", true],
	[scr_cutscene_change_variable, obj_camera, "following", noone],
	[scr_cutscene_wait, 2],
	[scr_cutscene_move_character, polka, 300, 300, false, 5],
	[scr_cutscene_pan_camera_char, polka, false, 12],
	[scr_cutscene_move_character_char, obj_npc_villy, polka, false, 5],
	[scr_cutscene_create_dialogue, text2, []],
	[scr_cutscene_wait, 2],
	[scr_cutscene_move_character, polka, 1000, 800, false, 5],
	[scr_cutscene_pan_camera_char, polka, false, 12],
	[scr_cutscene_move_character_char, obj_npc_villy, polka, false, 5],
	[scr_cutscene_create_dialogue, text3, []],
	[scr_cutscene_wait, 2],
	[scr_cutscene_move_character, polka, 300, 300, false, 5],
	[scr_cutscene_pan_camera_char, polka, false, 12],
	[scr_cutscene_move_character_char, obj_npc_villy, polka, false, 5],
	[scr_cutscene_create_dialogue, text3, []],
	[scr_cutscene_change_variable, obj_camera, "following", polka],
	[scr_cutscene_change_variable, polka, "move_override", false],
];