active = false;
destroy = false;

scene_info = [	
	[scr_cutscene_change_variable, polka, "move_override", true],
	[scr_cutscene_move_character, polka, 0, 12, true, 2],
	[scr_cutscene_emote_character, polka, spr_emote_shocked,100],
	[scr_cutscene_notification, "Finish your current task before visting another Villy!"],
	[scr_cutscene_change_variable, polka, "move_override", false]
]