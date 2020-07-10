active = false;

var temp = dialogue.dialogues[? obj_npc_weeraway];
var investigation_text = temp[3];

scene_info = [
	[scr_cutscene_change_variable, polka, "move_override", true],
	[scr_cutscene_wait, 1],
	[scr_cutscene_change_room, rm_weeraway_interior, 500, 266],
	[scr_cutscene_wait, 2],
	[scr_cutscene_move_character, polka, -80, 0, true, 2],
	[scr_cutscene_move_character, polka, 0, -164, true, 2],
	[scr_cutscene_move_character, polka, 40, 0, true, 2],
	[scr_cutscene_create_dialogue, investigation_text, [[scr_event_fire, event.talk_weeraway]]],
	[scr_cutscene_change_variable, polka, "move_override", false],
];