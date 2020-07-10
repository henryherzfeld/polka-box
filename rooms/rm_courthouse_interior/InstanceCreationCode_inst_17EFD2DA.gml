active = false;

var temp = dialogue.dialogues[? obj_npc_chieftain];
var case_text = temp[0];

scene_info = [
	[scr_cutscene_change_variable, polka, "move_override", true],
	[scr_cutscene_move_character, obj_npc_chieftain, 100, 10, true, 1],
	[scr_cutscene_wait, 1],
	[scr_cutscene_move_character, obj_npc_chieftain, 498, 44, false, 2],
	[scr_cutscene_wait, 1],
	[scr_cutscene_create_dialogue, case_text, []],
	[scr_cutscene_change_variable, polka, "move_override", false],
]