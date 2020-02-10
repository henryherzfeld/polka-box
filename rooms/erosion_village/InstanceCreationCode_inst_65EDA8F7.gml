active = false;

scene_info = [
	[scr_cutscene_change_variable, polka, "move_override", true],
	[scr_cutscene_change_variable, obj_camera, "following", noone],
	[scr_cutscene_wait, 1],
//	[scr_cutscene_pan_camera, 882, 493, false, 5],
//	[scr_cutscene_wait, 3],
//	[scr_cutscene_pan_camera, polka.x, polka.y, false, 5],
	[scr_cutscene_change_variable, obj_camera, "following", polka],
	[scr_cutscene_wait, 1],
	[scr_cutscene_change_variable, polka, "move_override", false]
];