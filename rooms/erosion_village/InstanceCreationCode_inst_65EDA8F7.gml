active = false;

scene_info = [
	[scr_cutscene_change_variable, polka, "move_override", true],
	[scr_cutscene_change_variable, obj_camera, "following", noone],
	[scr_cutscene_wait, 1],
	[scr_cutscene_change_variable, npc_green_villy, "draw", true],
	[scr_cutscene_pan_camera, 1200, 400, false, 12],
	[scr_cutscene_wait, 4],
	[scr_cutscene_pan_camera_char, polka, false, 12],
	[scr_cutscene_change_variable, npc_green_villy, "draw", false],
	[scr_cutscene_change_variable, obj_camera, "following", polka],
	[scr_cutscene_change_variable, polka, "move_override", false]
];